with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with System; use System;
with System.Machine_Code;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Unchecked_Conversion;

with STM32GD.Board;

with Peripherals;
with Serial;

procedure Main is
   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (200);

begin
   STM32GD.Board.Init;
   Peripherals.Init;
   Serial.Output.Write_Line ("--------------------------------------------------------------------------");
   Serial.Output.Write_Line ("Main task starting");
   Peripherals.Timer.Every (Milliseconds (1000), STM32GD.Board.LED_GREEN.Toggle'Access);
   --  Peripherals.Timer.After (Milliseconds (5000), STM32GD.Board.LED_GREEN.Toggle'Access);
   while True loop
      STM32GD.Board.LED_RED.Toggle;
      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;
