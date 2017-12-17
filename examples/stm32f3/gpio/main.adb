with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.EXTI;

with STM32_SVD.RCC;

with Button_Irq;

procedure Main is

   package GPIO renames STM32GD.GPIO;

   package LED is new GPIO.Pin (Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package Button is new GPIO.Pin (Pin => GPIO.Pin_13, Port => GPIO.Port_C);

begin
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPAEN := 1;
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPCEN := 1;
   STM32_SVD.RCC.RCC_Periph.APB2ENR.SYSCFGEN := 1;
   Button.Init;
   Button.Configure_Trigger (STM32GD.EXTI.Interrupt_Falling_Edge);
   LED.Init;
   LED.Set;
   loop
      Suspend_Until_True (Button_Irq.Button_Pressed);
      LED.Toggle;
   end loop;
end Main;

