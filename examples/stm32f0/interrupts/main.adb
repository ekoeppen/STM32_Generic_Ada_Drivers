with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Real_Time; use Ada.Real_Time;

with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.EXTI;
with STM32GD.Timer;
with STM32GD.Timer.Peripheral;
with STM32GD.Board; use STM32GD.Board;

with Peripherals;

procedure Main is

   package GPIO renames STM32GD.GPIO;
   package EXTI renames STM32GD.EXTI;

   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (50);

   procedure Polling_Test is
   begin
      loop
         if EXTI.IRQ_Handler.Status (EXTI.EXTI_Line_0) = True then
            LED_GREEN.Toggle;
            EXTI.IRQ_Handler.Reset_Status (EXTI.EXTI_Line_0);
         end if;
         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end Polling_Test;

   procedure Waiting_Test is
   begin
      loop
         Button.Wait_For_Trigger;
         LED_GREEN.Toggle;
      end loop;
   end Waiting_Test;

   procedure Cancel_Test is
   begin
      Peripherals.Timer.Init;
      loop
         Peripherals.Timer.After (Milliseconds (5000), Button.Cancel_Wait'Access);
         Button.Wait_For_Trigger;
         if Button.Triggered then
            LED_GREEN.Toggle;
         else
            LED_RED.Toggle;
         end if;
         Button.Clear_Trigger;
      end loop;
   end Cancel_Test;

begin
   Init;
   TX.Init;
   USART.Init;
   Button.Configure_Trigger (EXTI.Interrupt_Falling_Edge);
   LED_GREEN.Set;
   --  Polling_Test;
   --  Waiting_Test;
   Cancel_Test;
end Main;

