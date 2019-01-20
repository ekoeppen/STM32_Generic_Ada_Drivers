with Ada.Real_Time; use Ada.Real_Time;
with STM32GD.Board; use STM32GD.Board;
with STM32GD.SysTick; use STM32GD.SysTick;
with Timeout;

procedure Main is
   T : Time;
begin
   Init;
   LED_GREEN.Set;
   loop
      Timeout.Start (T, Milliseconds (200));
      while not Timeout.Timed_Out (T)
      loop
         null;
      end loop;
      LED_GREEN.Toggle;
   end loop;
end Main;

