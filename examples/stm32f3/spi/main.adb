with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.Board; use STM32GD.Board;
with STM32_SVD.RCC; use STM32_SVD.RCC;

procedure Main is

   package SPI is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1);
   Data : STM32GD.SPI.SPI_Data_8b := (0, 1, 2, 3, 4, 5, 6, 7);

begin
   Init;
   RCC_Periph.APB2ENR.SPI1EN := 1;
   SCLK.Init;
   MOSI.Init;
   MISO.Init;
   CSN.Init;
   SPI.Init;
   loop
      CSN.Clear;
      SPI.Send (Data);
      CSN.Set;
   end loop;
end Main;

