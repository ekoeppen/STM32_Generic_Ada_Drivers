with STM32_SVD.Interrupts; use STM32_SVD.Interrupts;
with STM32_SVD.EXTI;

package STM32GD.EXTI.IRQ is

   protected IRQ_Handler is
      entry Wait;
      procedure Cancel;
      function Status (Line : External_Line_Number) return Boolean;
      procedure Reset_Status (Line : External_Line_Number);
      procedure Handler;
      pragma Attach_Handler (Handler, EXTI0);
      pragma Attach_Handler (Handler, EXTI1);
      pragma Attach_Handler (Handler, EXTI2_TSC);
      pragma Attach_Handler (Handler, EXTI3);
      pragma Attach_Handler (Handler, EXTI4);
      pragma Attach_Handler (Handler, EXTI9_5);
      pragma Attach_Handler (Handler, EXTI15_10);

   private
      EXTI_Status_1 : STM32_SVD.EXTI.PR1_Register;
      EXTI_Status_2 : STM32_SVD.EXTI.PR2_Register;
      Cancelled : Boolean;
      Triggered : Boolean;
   end IRQ_Handler;

end STM32GD.EXTI.IRQ;
