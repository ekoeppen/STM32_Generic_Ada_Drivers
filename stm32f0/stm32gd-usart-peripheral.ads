with STM32_SVD; use STM32_SVD;
with STM32GD.Clock;
with STM32GD.Clock.Tree;

generic

   USART : STM32GD.USART.USART_Instance;
   Speed : UInt32;
   with package Clock_Tree is new STM32GD.Clock.Tree (<>);
   Clock : STM32GD.Clock.Clock_Type;
   RX_DMA_Buffer_Size : in Natural := 0;

package STM32GD.USART.Peripheral is

   pragma Preelaborate;

   RX_DMA_Buffer: array (1 .. RX_DMA_Buffer_Size) of Byte;

   procedure Enable;
   procedure Disable;
   procedure Init;

   procedure Transmit (Data : in Byte);
   function Receive return Byte;
   function Data_Available return Boolean;

   procedure DMA_Transmit (Data : in USART_Data; Count : in Natural);
   procedure DMA_Receive (Data : out USART_Data; Count : out Natural);
   function DMA_Receive (Delimiter : in Byte; Data : out USART_Data; Data_Index : in out Natural) return Boolean;
   procedure DMA_Receive (Delimiter : Byte; Data : out USART_Data; Count : out Natural);
   function DMA_Receive return Byte;

end STM32GD.USART.Peripheral;
