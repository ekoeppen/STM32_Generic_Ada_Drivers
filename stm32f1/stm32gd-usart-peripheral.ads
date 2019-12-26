with STM32_SVD; use STM32_SVD;
with STM32_SVD.USART;

generic

   Clock : Integer;
   USART : USART_Instance;
   Speed : UInt32;

package STM32GD.USART.Peripheral is

   pragma Preelaborate;

   procedure Enable;
   procedure Disable;
   procedure Init;

   procedure Transmit (Data : in Byte);
   function Data_Available return Boolean;
   function Receive return Byte;

end STM32GD.USART.Peripheral;
