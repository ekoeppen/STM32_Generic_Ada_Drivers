with STM32GD.Board;
with STM32GD.Clock;
with STM32GD.Clock.Tree;
with STM32GD.Clock.Timer;
with STM32GD.RTC;

procedure Main is

   package Board renames STM32GD.Board;
   package Clock renames STM32GD.Clock;

   package Delay_Timer is new STM32GD.Clock.Timer (Clock_Tree => Board.CLOCKS, Input => Clock.SYSCLK);
   package RTC is new STM32GD.RTC (Clock_Tree => Board.CLOCKS, Clock => Clock.LSI);

begin
   Board.Init;
   RTC.Init;
   loop
      Board.LED.Toggle;
      Delay_Timer.Delay_s (1);
   end loop;
end Main;

