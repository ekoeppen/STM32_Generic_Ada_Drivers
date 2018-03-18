with Ada.Interrupts;
with Ada.Interrupts.Names;

package body Peripherals.IRQ_Handlers is

   protected body USART is
      entry Wait when Data_Available is
      begin
         Data_Available := False;
      end Wait;

      procedure Handler is
      begin
         Data_Available := True;
      end Handler;
   end USART;

end Peripherals.IRQ_Handlers;
