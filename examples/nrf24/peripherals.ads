with Ada.Interrupts.Names;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.GPIO.Polled;
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with STM32GD.Timer;
with STM32GD.Timer.Peripheral;
with Drivers;
with Drivers.NRF24;

package Peripherals is

   package GPIO renames STM32GD.GPIO;

   package Timer  is new STM32GD.Timer.Peripheral (Timer => STM32GD.Timer.Timer_14, IRQ => Ada.Interrupts.Names.TIM14);
   package CE     is new GPIO.Pin (Pin => GPIO.Pin_1, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package IRQ    is new GPIO.Pin (Pin => GPIO.Pin_2, Port => GPIO.Port_A, Mode => GPIO.Mode_In);

   package Radio  is new Drivers.NRF24 (SPI => SPI, Chip_Select => CSN, Chip_Enable => CE, IRQ => IRQ);


   procedure Init;

end Peripherals;
