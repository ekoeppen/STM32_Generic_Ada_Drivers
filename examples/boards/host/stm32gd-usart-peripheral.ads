with STM32_SVD; use STM32_SVD;
generic

   Filename : String;

package STM32GD.USART.Peripheral is

   pragma Preelaborate;

   procedure Transmit (Data : in Byte);

end STM32GD.USART.Peripheral;
