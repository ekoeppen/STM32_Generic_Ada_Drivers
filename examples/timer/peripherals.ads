with STM32GD.Timer;
with STM32_SVD.Interrupts;
with STM32_SVD.TIM; use STM32_SVD.TIM;

package Peripherals is

   package Timer is new STM32GD.Timer (
      Timer => TIM6_Periph,
      IRQ => 17);

end Peripherals;
