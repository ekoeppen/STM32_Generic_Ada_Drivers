with STM32GD.EXTI;  use STM32GD.EXTI;
with STM32_SVD.RTC; use STM32_SVD.RTC;

package body RTC_IRQ is

   protected body Handler is

      procedure IRQ_Handler is
      begin
         RTC_Periph.ISR.ALRAF := 0;
         if External_Interrupt_Pending (EXTI_Line_17) then
            Set_True (Alarm_Occurred);
            Clear_External_Interrupt (EXTI_Line_17);
         end if;
      end IRQ_Handler;

   end Handler;

end RTC_IRQ;
