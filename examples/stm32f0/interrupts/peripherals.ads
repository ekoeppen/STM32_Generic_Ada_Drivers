with Ada.Interrupts.Names;

with STM32GD.Timer;
with STM32GD.Timer.Peripheral;

package Peripherals is

   package Timer is new STM32GD.Timer.Peripheral (Timer => STM32GD.Timer.Timer_14, IRQ => Ada.Interrupts.Names.TIM14);

end Peripherals;
