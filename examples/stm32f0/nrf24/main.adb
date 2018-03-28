with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Real_Time; use Ada.Real_Time;

with STM32GD.Board;
with STM32GD.SPI;
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.SPI.Peripheral;

with Peripherals; use Peripherals;
with Drivers;
with Drivers.NRF24;

procedure Main is

   package GPIO renames STM32GD.GPIO;

   package CSN is new GPIO.Pin (Pin => GPIO.Pin_8, Port => GPIO.Port_C, Mode => GPIO.Mode_Out);
   package CE  is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_C, Mode => GPIO.Mode_Out);
   package IRQ is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_C, Mode => GPIO.Mode_In);
   package SPI is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1, Data_Size => STM32GD.SPI.Data_Size_8b);

   package Radio is new Drivers.NRF24 (SPI => SPI, Chip_Select => CSN, Chip_Enable => CE, IRQ => IRQ);

begin
   STM32GD.Board.Init;
   Peripherals.Init;
   Radio.Set_Channel (70);
   loop
      null;
   end loop;
end Main;
