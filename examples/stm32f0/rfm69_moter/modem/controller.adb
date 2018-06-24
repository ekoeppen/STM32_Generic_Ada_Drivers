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

   -----------------------------------------------------------------------------

   package Observation_Encoder is new CBOR (
      Buffer_Size_Type => Packet_Size_Type,
      Buffer_Type => Packet_Type);
   use Observation_Encoder;

   procedure Encode_Test_Packet is
      Position	: Packet_Size_Type := Test_Data'First;
   begin
      Encode_Tag (Sensor_Reading_Tag, Test_Data, Position);
      Encode_Array (2, Test_Data, Position);
      Encode_Byte_String ("Test", Test_Data, Position);
      Encode_Tag (Voltage_Tag, Test_Data, Position);
      Encode_Decimal_Fraction (33, -1, Test_Data, Position);
   end Encode_Test_Packet;

   procedure Decode_Value (Packet : in Packet_Type;
      Position : in out Packet_Size_Type) is
   begin
      null;
   end Decode_Value;

   procedure Handle_Command (Line : Serial_Data) is
   begin
      Output.Write_Line (Line);
      if Line.Length > 1 then
         if Line.Data (1) = Transmit_Cmd then
            Output.Write_Line ("Transmitting");
            Modem.TX.Cancel_Send_Repeatedly;
            Modem.TX.Send (Test_Data);
         elsif Line.Data (1) = Continuous_Cmd then
            Output.Write_Line ("Continuously transmitting");
            Modem.TX.Send (Test_Data, Repeat => True);
         elsif Line.Data (1) = Receive_Cmd then
            Output.Write_Line ("Receiving");
            Modem.TX.Cancel_Send_Repeatedly;
         elsif Line.Data (1) = Status_Cmd then
            Output.Write_Line ("Status");
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
            Output.Write_Line ("Got packet");
            for D of Packet loop
               Output.Write (To_Hex_String (D));
            end loop;
            Output.Write_Line ("");
         end if;
         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end Controller_Task;

end Controller;
