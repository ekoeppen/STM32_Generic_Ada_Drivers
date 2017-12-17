with Ada.Interrupts;       use Ada.Interrupts;

package IRQ is

   protected type Controller (IRQ : Interrupt_ID) is

   procedure IRQ_Handler;
   pragma Attach_Handler (IRQ_Handler, IRQ);

   procedure Run;

   end Controller;

end IRQ;
