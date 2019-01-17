with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with STM32GD.I2C;
with STM32GD.I2C.Peripheral;
with STM32GD.USART;
with STM32GD.USART.Peripheral;
with Drivers;
with Drivers.RFM69;
with Drivers.Si7006;
with Ada.Interrupts.Names;
with System;

package Peripherals is

   subtype Millivolts is Natural range 0..4095;

   package GPIO renames STM32GD.GPIO;
   package RFM69_RESET is new GPIO.Pin (Pin => GPIO.Pin_2, Port => GPIO.Port_A,
      Mode => GPIO.Mode_Out);
   package CSN is new GPIO.Pin (Pin => GPIO.Pin_4, Port => GPIO.Port_A,
      Mode => GPIO.Mode_Out);
   package IRQ is new GPIO.Pin (Pin => GPIO.Pin_3, Port => GPIO.Port_A,
      Mode => GPIO.Mode_In);
   package SPI is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1);
   package SCL is new GPIO.Pin (Pin => GPIO.Pin_6, Port => GPIO.Port_B,
      Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package SCL_OUT is new GPIO.Pin (Pin => GPIO.Pin_6, Port => GPIO.Port_B,
      Mode => GPIO.Mode_Out);
   package SDA is new GPIO.Pin (Pin => GPIO.Pin_7, Port => GPIO.Port_B,
      Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package I2C is new STM32GD.I2C.Peripheral (
      I2C => STM32GD.I2C.I2C_1);

   package Radio is new Drivers.RFM69 (SPI => SPI, Chip_Select => CSN,
      IRQ => IRQ, Packet_Size => 62, Frequency => 868_000_000);
   package Si7006 is new Drivers.Si7006 (I2C => I2C);

   procedure Init;
   procedure Power_Down;
   procedure Power_Up;
   procedure Enable_Stop_Mode (Low_Power : Boolean);
   procedure Disable_Stop_Mode;
   function Supply_Voltage return Millivolts;

end Peripherals;
