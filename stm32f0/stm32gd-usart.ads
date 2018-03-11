with STM32_SVD; use STM32_SVD;
with STM32_SVD.USART;

package STM32GD.USART is

   USART_1 : STM32_SVD.USART.USART_Peripheral renames STM32_SVD.USART.USART1_Periph;
   USART_2 : STM32_SVD.USART.USART_Peripheral renames STM32_SVD.USART.USART2_Periph;
   USART_3 : STM32_SVD.USART.USART_Peripheral renames STM32_SVD.USART.USART3_Periph;

   type USART_Data is array (Natural range <>) of Byte;

end STM32GD.USART;
