with STM32_SVD; use STM32_SVD;

package STM32GD.USART is

   pragma Preelaborate;

   type USART_Instance is (USART_1, USART_2, USART_3);
   type USART_Data is array (Natural range <>) of Byte;

end STM32GD.USART;
