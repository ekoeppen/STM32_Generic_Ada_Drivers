with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;

procedure Main is

   package GPIO renames STM32GD.GPIO;

   package SCLK is new GPIO.Pin (Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package MOSI is new GPIO.Pin (Pin => GPIO.Pin_6, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package MISO is new GPIO.Pin (Pin => GPIO.Pin_7, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package CSN  is new GPIO.Pin (Pin => GPIO.Pin_4, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);

   package SPI is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1, Data_Size => STM32GD.SPI.Data_Size_8b);
   Data : STM32GD.SPI.SPI_Data_8b := (0, 1, 2, 3, 4, 5, 6, 7);

begin
   SCLK.Init;
   MOSI.Init;
   MISO.Init;
   CSN.Init;
   SPI.Init;
   loop
      SPI.Transfer (Data);
   end loop;
end Main;

