with STM32GD.GPIO.Pin;
with STM32GD.SPI.Peripheral;

package HAL is

   generic package Pin renames STM32GD.GPIO.Pin;
   generic package SPI renames STM32GD.SPI.Peripheral;

end HAL;
