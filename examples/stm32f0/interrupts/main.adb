with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Real_Time; use Ada.Real_Time;

with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.EXTI;
with STM32GD.Board; use STM32GD.Board;

procedure Main is

   package GPIO renames STM32GD.GPIO;
   package EXTI renames STM32GD.EXTI;

   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (50);

begin
   Init;
   TX.Init;
   USART.Init;
   Button.Configure_Trigger (EXTI.Interrupt_Falling_Edge);
   LED_GREEN.Set;
   loop
      if EXTI.IRQ_Handler.Status (EXTI.EXTI_Line_0) = True then
         LED_GREEN.Toggle;
         EXTI.IRQ_Handler.Reset_Status (EXTI.EXTI_Line_0);
      end if;
      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;

