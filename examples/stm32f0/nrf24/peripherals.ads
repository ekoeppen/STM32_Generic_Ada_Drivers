with Ada.Interrupts.Names;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with STM32GD.Timer;
with STM32GD.Timer.Peripheral;
with Drivers;
with Drivers.NRF24;

package Peripherals is

   package GPIO renames STM32GD.GPIO;

   package Timer  is new STM32GD.Timer.Peripheral (Timer => STM32GD.Timer.Timer_14, IRQ => Ada.Interrupts.Names.TIM14);
   package SCLK   is new GPIO.Pin (Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package MISO   is new GPIO.Pin (Pin => GPIO.Pin_6, Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package MOSI   is new GPIO.Pin (Pin => GPIO.Pin_7, Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package CSN    is new GPIO.Pin (Pin => GPIO.Pin_4, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package CE     is new GPIO.Pin (Pin => GPIO.Pin_8, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package IRQ    is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_A, Mode => GPIO.Mode_In);
   package SPI    is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1);

   package Radio  is new Drivers.NRF24 (SPI => SPI, Chip_Select => CSN, Chip_Enable => CE, IRQ => IRQ);


   procedure Init;

end Peripherals;
