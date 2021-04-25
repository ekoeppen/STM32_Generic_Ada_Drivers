with STM32_SVD.SPI;

generic

   SPI : in out STM32_SVD.SPI.SPI_Peripheral;

package STM32GD.SPI.Peripheral is

   pragma Preelaborate;

   procedure Init;

   procedure Send (Data : in Byte);
   procedure Send (Data : in SPI_Data_8b);
   procedure Receive (Data : out Byte);
   procedure Receive (Data : out SPI_Data_8b);
   procedure Transfer (Data : in out SPI_Data_8b);

end STM32GD.SPI.Peripheral;
