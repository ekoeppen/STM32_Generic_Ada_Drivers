with STM32_SVD; use STM32_SVD;

package STM32GD.SPI is

   SPI_1 : Natural := 1;

   type SPI_Data_Size is
     (Data_Size_8b,
      Data_Size_16b);

   type SPI_Data_8b is array (Natural range <>) of Byte;

   type SPI_Data_16b is array (Natural range <>) of UInt16;

end STM32GD.SPI;
