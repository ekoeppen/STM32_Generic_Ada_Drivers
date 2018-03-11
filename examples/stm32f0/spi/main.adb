with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;

with STM32GD.Board; use STM32GD.Board;

procedure Main is

   package SPI is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1, Data_Size => STM32GD.SPI.Data_Size_8b);
   Data : STM32GD.SPI.SPI_Data_8b := (0, 1, 2, 3, 4, 5, 6, 7);

begin
   SPI.Init;
   loop
      SPI.Transfer (Data);
   end loop;
end Main;

