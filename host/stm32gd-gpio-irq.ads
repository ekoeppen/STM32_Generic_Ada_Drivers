with STM32_SVD.GPIO;
with STM32GD.EXTI;
with STM32GD.GPIO.Pin;

generic

   with package Pin is new STM32GD.GPIO.Pin (<>);

package STM32GD.GPIO.IRQ is

   procedure Connect_External_Interrupt;
   function Interrupt_Line_Number return STM32GD.EXTI.External_Line_Number;
   procedure Configure_Trigger (Trigger : STM32GD.EXTI.External_Triggers);
   procedure Wait_For_Trigger;
   procedure Clear_Trigger;
   function Triggered return Boolean;
   procedure Cancel_Wait;

end STM32GD.GPIO.IRQ;
