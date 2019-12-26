with STM32_SVD; use STM32_SVD;
with STM32_SVD.SPI;

package STM32GD.SPI is

   pragma Preelaborate;

   SPI_1 : STM32_SVD.SPI.SPI_Peripheral renames STM32_SVD.SPI.SPI1_Periph;

   type SPI_Data_Size is
     (Data_Size_8b,
      Data_Size_16b);

   type SPI_Data_8b is array (Natural range <>) of Byte;

   type SPI_Data_16b is array (Natural range <>) of Byte;

end STM32GD.SPI;
