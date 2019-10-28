with Ada.Interrupts;
with STM32_SVD.USART;
with STM32_SVD; use STM32_SVD;

generic

   with package USART is new STM32GD.USART.Peripheral (<>);
   IRQ   : Ada.Interrupts.Interrupt_ID;

package STM32GD.USART.IRQ is

   procedure Init;

   protected IRQ_Handler  is
      entry Wait;
   private
      procedure Handler;
      pragma Attach_Handler (Handler, IRQ);

      Data_Available : Boolean := False;
   end IRQ_Handler;

end STM32GD.USART.IRQ;
