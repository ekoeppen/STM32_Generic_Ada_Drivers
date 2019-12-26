with STM32_SVD; use STM32_SVD;

generic

   Filename : String;

package STM32GD.USART.Peripheral is

   pragma Preelaborate;

   procedure Init;

   procedure Transmit (Data : in Byte);
   function Receive return Byte;

end STM32GD.USART.Peripheral;
