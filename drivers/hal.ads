with STM32GD.GPIO.Pin;
with STM32GD.SPI.Peripheral;
with STM32GD.I2C.Peripheral;

package HAL is

   generic package Pin renames STM32GD.GPIO.Pin;
   generic package SPI renames STM32GD.SPI.Peripheral;
   generic package I2C renames STM32GD.I2C.Peripheral;

end HAL;
