with STM32GD.GPIO;
with STM32GD.GPIO_Polled;
with STM32GD.SPI;
with STM32GD.I2C;
with STM32GD.USART;

package HAL is

   generic package Pin     renames STM32GD.GPIO;
   generic package Pin_IRQ renames STM32GD.GPIO_Polled;
   generic package SPI     renames STM32GD.SPI;
   generic package I2C     renames STM32GD.I2C;
   generic package USART   renames STM32GD.USART;

end HAL;
