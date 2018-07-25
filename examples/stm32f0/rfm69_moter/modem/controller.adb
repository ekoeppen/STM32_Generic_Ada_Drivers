with STM32_SVD;                     use STM32_SVD;
with Serial;                        use Serial;
with STM32GD.Board;                 use STM32GD.Board;
with STM32GD.USART;                 use STM32GD.USART;
with Ada.Real_Time;                 use Ada.Real_Time;
with Ada.Synchronous_Task_Control;  use Ada.Synchronous_Task_Control;
with Peripherals;                   use Peripherals; use Peripherals.Radio;
with Utils;                         use Utils;
with Modem;                         use Modem;
with Packet;                        use Packet;
with CBOR;
with Blink;

package body Controller is

   task Controller_Task with Storage_Size => 512;

   Test_Data      : Radio.Packet_Type;

   Transmit_Cmd   : constant Byte := Character'Pos ('t');
   Continuous_Cmd : constant Byte := Character'Pos ('c');
   Receive_Cmd    : constant Byte := Character'Pos ('r');
   Status_Cmd     : constant Byte := Character'Pos ('s');

   subtype Response_Size_Type is Positive range 1 .. 64;
   subtype Response_Type is USART_Data (Response_Size_Type);
   Response : Response_Type;
   Response_Index : Response_Size_Type;

   procedure Write_To_Response (Data : Byte);
   function Read_From_Response return Byte;

   -----------------------------------------------------------------------------

   package Response_Encoder is new CBOR (
      Write => Write_To_Response,
      Read => Read_From_Response);

   procedure Start_Response is
   begin
      Response_Index := Response'First;
      Write_to_Response (16#10#);
      Write_to_Response (16#02#);
   end Start_Response;

   procedure End_Response is
   begin
      Write_to_Response (16#03#);
   end End_Response;

   procedure Write_To_Response (Data : Byte) is
   begin
      Response (Response_Index) := Data;
      Response_Index := Response_Index + 1;
   end Write_To_Response;

   function Read_From_Response return Byte is
      B : Byte;
   begin
      B := Response (Response_Index);
      Response_Index := Response_Index + 1;
      if B = 16#10# then
         B := Response (Response_Index);
         Response_Index := Response_Index + 1;
      end if;
      return B;
   end Read_From_Response;

   procedure Encode_Test_Packet is
   begin
      Start_Response;
      Response_Encoder.Encode_Tag (Sensor_Reading_Tag);
      Response_Encoder.Encode_Array (2);
      Response_Encoder.Encode_Byte_String ("Test");
      Response_Encoder.Encode_Tag (Voltage_Tag);
      Response_Encoder.Encode_Decimal_Fraction (33, -1);
      End_Response;
   end Encode_Test_Packet;

   procedure Send_Log_Message (Message : String) is
   begin
      Start_Response;
      Response_Encoder.Encode_Tag (Log_Message_Tag);
      Response_Encoder.Encode_Byte_String (Message);
      End_Response;
      Output.Write (Response, Response'Length);
   end Send_Log_Message;

   procedure Handle_Command (Line : Serial_Data) is
   begin
      if Line.Length > 1 then
         if Line.Data (1) = Transmit_Cmd then
            Send_Log_Message ("Transmitting");
            Modem.TX.Cancel_Send_Repeatedly;
            Modem.TX.Send (Test_Data);
         elsif Line.Data (1) = Continuous_Cmd then
            Send_Log_Message ("Continuously transmitting");
            Modem.TX.Send (Test_Data, Repeat => True);
         elsif Line.Data (1) = Receive_Cmd then
            Send_Log_Message ("Receiving");
            Modem.TX.Cancel_Send_Repeatedly;
         elsif Line.Data (1) = Status_Cmd then
            Send_Log_Message ("Status");
            Print_Registers;
         end if;
      end if;
   end Handle_Command;

   task body Controller_Task is
      Command_Line : Serial_Data;
      Packet       : Packet_Type;
      Packet_Ready : Boolean;
      Next_Release : Time := Clock;
      Period       : constant Time_Span := Milliseconds (100);
   begin
      Blink.Blink_Parameters.Increase_Blink_Count (Blink.Green);
      Encode_Test_Packet;
      loop
         if Input.Is_Ready then
            Input.Read_Line (Command_Line);
            Handle_Command (Command_Line);
         end if;
         Modem.RX.Get_Data (Packet_Ready, Packet);
         if Packet_Ready then
            for I in Packet'Range loop
               Response (I) := Packet (I);
            end loop;
            Output.Write (Response, Packet'Length);
         end if;
         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end Controller_Task;

end Controller;
