with STM32_SVD.I2C;
with STM32_SVD; use STM32_SVD;

package STM32GD.I2C is

   I2C_1 : STM32_SVD.I2C.I2C_Peripheral renames STM32_SVD.I2C.I2C1_Periph;
   I2C_2 : STM32_SVD.I2C.I2C_Peripheral renames STM32_SVD.I2C.I2C2_Periph;

   subtype I2C_Address is UInt7;
   type I2C_Data is array (Natural range <>) of Byte;

end STM32GD.I2C;
