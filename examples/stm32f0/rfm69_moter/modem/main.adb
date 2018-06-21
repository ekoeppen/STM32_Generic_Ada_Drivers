with System;                       use System;
with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Unchecked_Conversion;

with STM32GD.Board;
with STM32GD.USART;

with Peripherals;
with Blink;
with Modem;
with Controller;

procedure Main is
   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (100);
begin
   STM32GD.Board.Init;
   Peripherals.Init;
   Blink.Blink_Parameters.Start (Blink.Green, Blink.Repeat, 1);
   while True loop
      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;
