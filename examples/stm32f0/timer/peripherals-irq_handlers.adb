with Ada.Interrupts;
with Ada.Interrupts.Names;
with Peripherals;

with STM32_SVD; use STM32_SVD;

package body Peripherals.IRQ_Handlers is

   protected body Timer is
      procedure Handler is
      begin
        Callback.all;
      end Handler;
   end Timer;

end Peripherals.IRQ_Handlers;
