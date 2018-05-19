with STM32_SVD; use STM32_SVD;
with Serial; use Serial;
with STM32GD.Board;
with STM32GD.USART; use STM32GD.USART;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Peripherals;

package body Modem is

   task Modem_Task with Storage_Size => 256;
   task Command_Task with Storage_Size => 512;

   -----------------------------------------------------------------------------

   task body Modem_Task is
      Next_Release : Time := Clock;
      Period       : constant Time_Span := Milliseconds (500);
      Test_Data    : Peripherals.Radio.Packet_Type := (0, 1, 2, 3, 4, 5, 6, 7);
   begin
      Serial.Output.Write_Line ("Modem task starting");
      Peripherals.Radio.TX_Mode;
      loop
         Peripherals.Radio.TX (Test_Data);
         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end Modem_Task;

   -----------------------------------------------------------------------------

   procedure Handle_Command (Line : Serial_Data) is
      Transmit_Cmd   : Byte := Character'Pos ('t');
      Receive_Cmd    : Byte := Character'Pos ('r');
      Status_Cmd     : Byte := Character'Pos ('s');
   begin
      Serial.Output.Write (Line);
      if Line.Length > 1 then
         if Line.Data (1) = Transmit_Cmd then
            Serial.Output.Write_Line ("Transmitting");
         elsif Line.Data (1) = Receive_Cmd then
            Serial.Output.Write_Line ("Receiving");
         elsif Line.Data (1) = Status_Cmd then
            Serial.Output.Write_Line ("Status");
            Peripherals.Radio.Print_Registers;
         end if;
      end if;
   end Handle_Command;

   task body Command_Task is
      Command_Line : Serial_Data;
   begin
      Serial.Output.Write_Line ("Command task starting");
      loop
         Serial.Output.Write ("Command: ");
         Serial.Input.Read_Line (Command_Line);
         Handle_Command (Command_Line);
      end loop;
   end Command_Task;

end Modem;
