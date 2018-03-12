with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with System; use System;
with System.Machine_Code;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Unchecked_Conversion;

with STM32GD.Board;
with STM32GD.USART;

with Peripherals;
with Serial;
with Blink;

procedure Main is
   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (1000);
begin
   STM32GD.Board.Init;
   Peripherals.Init;
   while True loop
      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;
