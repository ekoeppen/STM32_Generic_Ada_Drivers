with STM32_SVD; use STM32_SVD;
with STM32_SVD.SPI;

generic

   SPI : in out STM32_SVD.SPI.SPI_Peripheral;

package STM32GD.SPI is

   pragma Preelaborate;

   procedure Init;

   procedure Send (Data : in Byte);
   procedure Send (Data : in Byte_Array);
   procedure Receive (Data : out Byte);
   procedure Receive (Data : out Byte_Array);
   procedure Transfer (Data : in out Byte_Array);

end STM32GD.SPI;
