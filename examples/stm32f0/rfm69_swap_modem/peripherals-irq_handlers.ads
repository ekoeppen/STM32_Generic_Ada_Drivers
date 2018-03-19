with Ada.Interrupts.Names;
with STM32GD.USART; use STM32GD.USART;

package Peripherals.IRQ_Handlers is
   protected USART is
      entry Wait;
   private
      procedure Handler;
      pragma Attach_Handler (Handler, Ada.Interrupts.Names.USART1);

      Data_Available : Boolean := False;
   end USART;

end Peripherals.IRQ_Handlers;