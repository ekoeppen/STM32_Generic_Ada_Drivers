with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.EXTI;

with STM32_SVD.RCC;

with Button_Irq;
with Peripherals;

procedure Main is

   package GPIO renames STM32GD.GPIO;

   package LED is new GPIO.Pin (Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package Button is new GPIO.Pin (Pin => GPIO.Pin_13, Port => GPIO.Port_C);
   package Handler is new Peripherals (Input => Button, Output => LED);

begin
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPAEN := True;
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPCEN := True;
   STM32_SVD.RCC.RCC_Periph.APB2ENR.SYSCFGEN := True;
   Handler.Init;
   loop
      Suspend_Until_True (Button_Irq.Button_Pressed);
      Handler.Run;
   end loop;
end Main;

