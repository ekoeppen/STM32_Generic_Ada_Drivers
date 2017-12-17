with STM32_SVD.USART;

generic

   Clock : Integer;
   USART : in out STM32_SVD.USART.USART_Peripheral;
   Speed : UInt32;

package STM32GD.USART.Peripheral is

   procedure Init;

   procedure Transmit (Data : in UInt8);

end STM32GD.USART.Peripheral;
