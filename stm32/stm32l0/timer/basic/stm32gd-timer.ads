with Ada.Interrupts; use Ada.Interrupts;
with Ada.Real_Time; use Ada.Real_Time;
with STM32_SVD.Interrupts; use STM32_SVD.Interrupts;
with STM32_SVD.TIM; use STM32_SVD.TIM;

generic

   Timer : in out TIM6_Peripheral;
   IRQ   : Interrupt_ID;

package STM32GD.Timer is

   procedure Init;
   procedure Stop;
   procedure After (Time : Time_Span; Callback : Callback_Type);
   procedure Every (Interval : Time_Span; Callback : Callback_Type);

private

   protected IRQ_Handler is
      procedure Handler;
      pragma Attach_Handler (Handler, IRQ);
   end IRQ_Handler;

end STM32GD.Timer;
