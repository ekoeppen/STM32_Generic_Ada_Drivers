with Ada.Interrupts.Names;         use Ada.Interrupts.Names;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package RTC_IRQ is

   Alarm_Occurred : Suspension_Object;

   protected Handler is
      pragma Interrupt_Priority;
   private
      procedure IRQ_Handler;
      pragma Attach_Handler (IRQ_Handler, RTC);
   end Handler;

end RTC_IRQ;
