with Ada.Interrupts.Names;

package Peripherals.IRQ_Handlers is
   type IRQ_Callback_Type is not null access procedure;

   protected type Timer (Callback : IRQ_Callback_Type) is
   private
      procedure Handler;
      pragma Attach_Handler (Handler, Ada.Interrupts.Names.TIM14);
   end Timer;

   Handler : Peripherals.IRQ_Handlers.Timer (Peripherals.Timer.IRQ_Callback'Access);

end Peripherals.IRQ_Handlers;
