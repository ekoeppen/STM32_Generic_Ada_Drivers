with STM32_SVD; use STM32_SVD;

package STM32GD.I2C is

   subtype I2C_Address is UInt7;
   type I2C_Data is array (Natural range <>) of Byte;

end STM32GD.I2C;
