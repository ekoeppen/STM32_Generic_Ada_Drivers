with STM32GD.GPIO.Pin;
with STM32GD.GPIO.Polled;
with STM32GD.SPI.Peripheral;
with STM32GD.I2C.Peripheral;
with STM32GD.USART.Peripheral;

package HAL is

   pragma Preelaborate;

   generic package Pin     renames STM32GD.GPIO.Pin;
   generic package Pin_IRQ renames STM32GD.GPIO.Polled;
   generic package SPI     renames STM32GD.SPI.Peripheral;
   generic package I2C     renames STM32GD.I2C.Peripheral;
   generic package USART   renames STM32GD.USART.Peripheral;

end HAL;
