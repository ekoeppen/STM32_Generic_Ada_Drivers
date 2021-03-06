with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with Drivers;
with Drivers.RFM69;
with Ada.Interrupts.Names;

package Peripherals is

   package GPIO renames STM32GD.GPIO;
   package RFM69_RESET is new GPIO.Pin (Pin => GPIO.Pin_2, Port => GPIO.Port_A,
      Mode => GPIO.Mode_Out);
   package CSN is new GPIO.Pin (Pin => GPIO.Pin_4, Port => GPIO.Port_A,
      Mode => GPIO.Mode_Out);
   package IRQ is new GPIO.Pin (Pin => GPIO.Pin_3, Port => GPIO.Port_A,
      Mode => GPIO.Mode_In);
   package SPI is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1);

   package Radio is new Drivers.RFM69 (SPI => SPI, Chip_Select => CSN,
      IRQ => IRQ, Packet_Size => 62, Frequency => 915_000_000);

   procedure Init;

end Peripherals;
