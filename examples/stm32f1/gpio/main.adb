with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32GD.Board; use STM32GD.Board;
with STM32GD.GPIO; use STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.EXTI;

with STM32_SVD.RCC;

with Button_Irq;

procedure Main is

begin
   Init;
   BUTTON.Configure_Trigger (STM32GD.EXTI.Interrupt_Falling_Edge);
   LED2.Set;
   LED.Set;
   loop
      Suspend_Until_True (Button_Irq.Button_Pressed);
      LED.Toggle;
   end loop;
end Main;

