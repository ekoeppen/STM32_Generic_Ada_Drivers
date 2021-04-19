with STM32_SVD.SPI;

generic

   SPI : in out STM32_SVD.SPI.SPI_Peripheral;
   Data_Size : STM32GD.SPI.SPI_Data_Size;

package STM32GD.SPI.Peripheral is

   pragma Preelaborate;

   procedure Init;

   procedure Transfer (Data : in out SPI_Data_8b)
   with
      Pre => Data_Size = Data_Size_8b;

end STM32GD.SPI.Peripheral;
