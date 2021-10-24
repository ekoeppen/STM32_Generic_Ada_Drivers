with STM32_SVD; use STM32_SVD;
with STM32_SVD.USART;
with STM32GD.Clock;
with STM32GD.Clock.Tree;

generic

   USART : in out STM32_SVD.USART.USART_Peripheral;
   Speed : UInt32;
   with package Clock_Tree is new STM32GD.Clock.Tree (<>);
   Clock : STM32GD.Clock.Clock_Type;
   Rx_DMA : Boolean := false;
   Tx_DMA : Boolean := false;

package STM32GD.USART is

   pragma Preelaborate;

   procedure Init;

   procedure Transmit (Data : in Byte);
   function Receive return Byte;
   function Data_Available return Boolean;

end STM32GD.USART;
