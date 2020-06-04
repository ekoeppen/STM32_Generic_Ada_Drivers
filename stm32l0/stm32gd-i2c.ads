with STM32_SVD.I2C;
with STM32_SVD; use STM32_SVD;

package STM32GD.I2C is

   pragma Preelaborate;

   I2C_1 : STM32_SVD.I2C.I2C_Peripheral renames STM32_SVD.I2C.I2C1_Periph;
   I2C_2 : STM32_SVD.I2C.I2C_Peripheral renames STM32_SVD.I2C.I2C2_Periph;

end STM32GD.I2C;
