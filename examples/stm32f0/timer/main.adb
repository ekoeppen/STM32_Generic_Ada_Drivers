with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32GD.Board; use STM32GD.Board;

with Peripherals;

procedure Main is
   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (200);

begin
   Init;
   Peripherals.Timer.Init;
   Text_IO.Put_Line ("--------------------------------------------------------------------------");
   Text_IO.Put_Line ("Main task starting");
   Peripherals.Timer.Every (Milliseconds (1000), STM32GD.Board.LED2.Toggle'Access);
   --  Peripherals.Timer.After (Milliseconds (5000), STM32GD.Board.LED2.Toggle'Access);
   while True loop
      LED.Toggle;
      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;
