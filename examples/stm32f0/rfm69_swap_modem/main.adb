with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with System; use System;
with System.Machine_Code;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Unchecked_Conversion;

with STM32GD.Board;
with STM32GD.USART;

with Peripherals;
with Peripherals.IRQ_Handlers;
with Serial;
with Blink;
with Modem;

procedure Main is
   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (100);
begin
   STM32GD.Board.Init;
   Peripherals.Init;
   Serial.Write_Line ("--------------------------------------------------------------------------" & Character'Val (10));
   Serial.Write_Line ("Main task starting" & Character'Val (10));
   while True loop
      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;
