with STM32GD.Systick; use STM32GD.Systick;

package body Monotonic_Counter is

   procedure SysTick_Handler with Export => True, External_Name => "SysTick_Handler";

   procedure SysTick_Handler is
   begin
      Counter := Counter + 1;
      if Counter = 0 then
         Overflow := True;
      end if;
   end SysTick_Handler;

   procedure Reset is
   begin
      Counter := 0;
      Overflow := False;
      Systick_Periph.RVR := (
         RELOAD => 8_000_000 / 8_000);
      Systick_Periph.CSR := (
         ENABLE => 1,
         TICKINT => 1,
         CLKSOURCE => 1,
         COUNTFLAG => 0,
         Reserved_3_15 => 0,
         Reserved_17_31 => 0);
   end Reset;

end Monotonic_Counter;
