with STM32GD.Timer;
with STM32GD.Timer.Peripheral;
with STM32_SVD.Interrupts;

package Peripherals is

   package Timer is new STM32GD.Timer.Peripheral (
                           Timer => STM32GD.Timer.Timer_14,
                           IRQ => STM32_SVD.Interrupts.TIM14);

end Peripherals;
