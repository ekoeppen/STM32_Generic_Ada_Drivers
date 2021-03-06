with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.EXTI;

with STM32_SVD.RCC;

with Button_Irq;

procedure Main is

   package GPIO renames STM32GD.GPIO;

   package LED is new GPIO.Pin (Pin => GPIO.Pin_12, Port => GPIO.Port_D, Mode => GPIO.Mode_Out);
   package Button is new GPIO.Pin (Pin => GPIO.Pin_0, Port => GPIO.Port_A);

begin
   STM32_SVD.RCC.RCC_Periph.AHB1ENR.GPIOAEN := True;
   STM32_SVD.RCC.RCC_Periph.AHB1ENR.GPIODEN := True;
   STM32_SVD.RCC.RCC_Periph.APB2ENR.SYSCFGEN := True;
   Button.Init;
   Button.Configure_Trigger (STM32GD.EXTI.Interrupt_Falling_Edge);
   LED.Init;
   LED.Set;
   loop
      Suspend_Until_True (Button_Irq.Button_Pressed);
      LED.Toggle;
   end loop;
end Main;

