with STM32GD.Systick; use STM32GD.Systick;
with STM32GD.Vectors;
with STM32_SVD; use STM32_SVD;

package body Monotonic_Counter is

   procedure SysTick_Handler;
   pragma Machine_Attribute (SysTick_Handler, "naked");

   Vectors: STM32GD.Vectors.IRQ_Vectors := (
      SysTick_Handler => Monotonic_Counter.SysTick_Handler'Address,
      others => STM32GD.Vectors.Default_Handler'Address
   ) with Export;
   pragma Linker_Section (Vectors, ".vectors");

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
