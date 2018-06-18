with STM32_SVD;                     use STM32_SVD;
with Serial;                        use Serial;
with STM32GD.Board;                 use STM32GD.Board;
with STM32GD.USART;                 use STM32GD.USART;
with Ada.Real_Time;                 use Ada.Real_Time;
with Ada.Synchronous_Task_Control;  use Ada.Synchronous_Task_Control;
with Peripherals;                   use Peripherals;
with Utils;                         use Utils;
with Modem;                         use Modem;
with Packet;                        use Packet;
with CBOR;

package body Controller is

   task Controller_Task with Storage_Size => 512;

   -----------------------------------------------------------------------------

   package Observation_Encoder is new CBOR (
      Buffer_Size_Type => Radio.Packet_Size_Type,
      Buffer_Type => Radio.Packet_Type);
   use Observation_Encoder;

   procedure Encode_Test_Packet (Packet : in out Radio.Packet_Type) is
      Position	     : Natural := 0;
   begin
      Encode_Tag (Sensor_Reading_Tag, Packet, Position);
      Encode_Array (2, Packet, Position);
      Encode_Byte_String ("Test", Packet, Position);
      Encode_Tag (Voltage_Tag, Packet, Position);
      Encode_Decimal_Fraction (33, -1, Packet, Position);
   end Encode_Test_Packet;

   procedure Handle_Command (Line : Serial_Data) is
      Transmit_Cmd   : Byte := Character'Pos ('t');
      Continuous_Cmd : Byte := Character'Pos ('c');
      Receive_Cmd    : Byte := Character'Pos ('r');
      Status_Cmd     : Byte := Character'Pos ('s');
      Test_Data      : Radio.Packet_Type;
   begin
      Serial.Output.Write (Line);
      Encode_Test_Packet (Test_Data);
      if Line.Length > 1 then
         if Line.Data (1) = Transmit_Cmd then
            Serial.Output.Write_Line ("Transmitting");
            Modem.TX.Cancel_Send_Repeatedly;
            Modem.TX.Send (Test_Data);
         elsif Line.Data (1) = Continuous_Cmd then
            Serial.Output.Write_Line ("Continuously transmitting");
            Modem.TX.Send (Test_Data, Repeat => True);
         elsif Line.Data (1) = Receive_Cmd then
            Serial.Output.Write_Line ("Receiving");
            Modem.TX.Cancel_Send_Repeatedly;
            --  if Radio.Wait_For_RX then
            --     Serial.Output.Write_Line ("Got packet");
            --  end if;
         elsif Line.Data (1) = Status_Cmd then
            Serial.Output.Write_Line ("Status");
            Radio.Print_Registers;
         end if;
      end if;
   end Handle_Command;

   task body Controller_Task is
      Command_Line : Serial_Data;
   begin
      Serial.Output.Write_Line ("Command task starting");
      loop
         Serial.Output.Write ("Command: ");
         Serial.Input.Read_Line (Command_Line);
         Handle_Command (Command_Line);
      end loop;
   end Controller_Task;

end Controller;
