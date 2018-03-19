with Serial; use Serial;
with STM32GD.Board;
with STM32GD.USART; use STM32GD.USART;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body Modem is

   task Modem_Task with Storage_Size => 256;
   task Command_Task with Storage_Size => 256;

   -----------------------------------------------------------------------------

   task body Modem_Task is
      Next_Release : Time := Clock;
      Period       : constant Time_Span := Milliseconds (500);
   begin
      Serial.Output.Write_Line ("Modem task starting");
      loop
         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end Modem_Task;

   -----------------------------------------------------------------------------

   procedure Handle_Command (Line : Serial_Data) is
   begin
      Serial.Output.Write ("Read: ");
      Serial.Output.Write (Line);
   end Handle_Command;

   task body Command_Task is
      Command_Line : Serial_Data;
   begin
      Serial.Output.Write_Line ("Command task starting");
      loop
         Serial.Input.Read_Line (Command_Line);
         Handle_Command (Command_Line);
      end loop;
   end Command_Task;

end Modem;