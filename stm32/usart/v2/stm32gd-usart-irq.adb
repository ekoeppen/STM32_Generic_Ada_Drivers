with System; use System;
with Ada.Unchecked_Conversion;
with STM32_SVD.DMA; use STM32_SVD.DMA;

package body STM32GD.USART.IRQ is

   protected body IRQ_Handler is
      entry Wait when Data_Available is
      begin
         Data_Available := False;
      end Wait;

      procedure Handler is
      begin
         USART.ICR.TCCF := 1;
         USART.ICR.IDLECF := 1;
         USART.ICR.EOBCF := 1;
         Data_Available := True;
      end Handler;
   end IRQ_Handler;

   procedure Init is
   begin
      null;
   end Init;

end STM32GD.USART.IRQ;
