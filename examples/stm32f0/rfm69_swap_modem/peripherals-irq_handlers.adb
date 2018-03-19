with Ada.Interrupts;
with Ada.Interrupts.Names;
with Peripherals;

with STM32_SVD; use STM32_SVD;
with STM32_SVD.USART;

package body Peripherals.IRQ_Handlers is

   protected body USART is
      entry Wait when Data_Available is
      begin
         Data_Available := False;
      end Wait;

      procedure Handler is
      begin
         STM32_SVD.USART.USART1_Periph.ICR.TCCF := 1;
         STM32_SVD.USART.USART1_Periph.ICR.IDLECF := 1;
         STM32_SVD.USART.USART1_Periph.ICR.EOBCF := 1;
         Data_Available := True;
      end Handler;
   end USART;

end Peripherals.IRQ_Handlers;
