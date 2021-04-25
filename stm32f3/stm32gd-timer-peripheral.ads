with Ada.Interrupts; use Ada.Interrupts;
with Ada.Real_Time; use Ada.Real_Time;
with STM32_SVD.Interrupts; use STM32_SVD.Interrupts;

generic

   Timer : STM32GD.Timer.Timer_Type := Timer_7;
   IRQ   : Interrupt_ID := TIM7;

package STM32GD.Timer.Peripheral is

   procedure Init;
   procedure Stop;
   procedure After (Time : Time_Span; Callback : Timer_Callback_Type);
   procedure Every (Interval : Time_Span; Callback : Timer_Callback_Type);

private

   protected IRQ_Handler is
      procedure Handler;
      pragma Attach_Handler (Handler, IRQ);
   end IRQ_Handler;

end STM32GD.Timer.Peripheral;
