with Ada.Interrupts.Names; use Ada.Interrupts.Names;
with STM32_SVD.EXTI;

package STM32GD.EXTI.IRQ is

   protected IRQ_Handler is
      entry Wait;
      procedure Cancel;
      function Status (Line : External_Line_Number) return Boolean;
      procedure Reset_Status (Line : External_Line_Number);
      procedure Handler;
      pragma Attach_Handler (Handler, EXTI0_1);
      pragma Attach_Handler (Handler, EXTI2_3);
      pragma Attach_Handler (Handler, EXTI4_15);

   private
      EXTI_Status : STM32_SVD.EXTI.PR_Field;
      Cancelled : Boolean;
      Triggered : Boolean;
   end IRQ_Handler;

end STM32GD.EXTI;
