with Ada.Interrupts;
with STM32_SVD.USART;
with STM32_SVD; use STM32_SVD;

generic

   Clock : Integer;
   USART : in out STM32_SVD.USART.USART_Peripheral;
   Speed : UInt32;
   IRQ   : Ada.Interrupts.Interrupt_ID;
   RX_DMA_Buffer_Size : in Natural := 0;

package STM32GD.USART.Peripheral is

   RX_DMA_Buffer: array (1 .. RX_DMA_Buffer_Size) of Byte;

   procedure Init;

   procedure Transmit (Data : in Byte);
   function Receive return Byte;

   protected IRQ_Handler  is
      entry Wait;
   private
      procedure Handler;
      pragma Attach_Handler (Handler, IRQ);

      Data_Available : Boolean := False;
   end IRQ_Handler;

end STM32GD.USART.Peripheral;
