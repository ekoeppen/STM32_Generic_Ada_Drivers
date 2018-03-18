with STM32_SVD.USART;
with STM32_SVD; use STM32_SVD;

generic

   USART : in out STM32_SVD.USART.USART_Peripheral;
   Speed : UInt32;
   RX_DMA_Buffer_Size : in Natural := 0;

package STM32GD.USART.Peripheral is

   RX_DMA_Buffer: array (1 .. RX_DMA_Buffer_Size) of Byte;

   procedure Init;

   procedure Transmit (Data : in Byte);
   function Receive return Byte;

   procedure DMA_Transmit (Data : in USART_Data; Count : in Natural);
   procedure DMA_Receive (Data : out USART_Data; Count : out Natural);
   function DMA_Receive (Delimiter : in Byte; Data : out USART_Data; Data_Index : in out Natural) return Boolean;
   procedure DMA_Receive (Delimiter : Byte; Data : out USART_Data; Count : out Natural);

end STM32GD.USART.Peripheral;
