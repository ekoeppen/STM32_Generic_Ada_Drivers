package IRQ is

   Status : Boolean;

   protected procedure IRQ_Handler;
   pragma Attach_Handler (IRQ_Handler, EXTI0_1_Interrupt);

end IRQ;
