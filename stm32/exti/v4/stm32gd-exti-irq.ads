with STM32_SVD.Interrupts; use STM32_SVD.Interrupts;
with STM32_SVD.EXTI;

package STM32GD.EXTI.IRQ is

   type EXTI_Status_Type is array (External_Line_Number'First .. External_Line_Number'Last) of Boolean;

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
      EXTI_Status : EXTI_Status_Type;
      Cancelled   : Boolean;
      Triggered   : Boolean;
   end IRQ_Handler;

end STM32GD.EXTI.IRQ;
