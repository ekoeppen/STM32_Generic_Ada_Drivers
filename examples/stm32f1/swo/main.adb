with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;

with STM32GD.Board; use STM32GD.Board;
with STM32GD.GPIO; use STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.EXTI;

with STM32_SVD.AFIO;

with STM32_SVD.RCC;

procedure Main is

   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (500);  -- arbitrary

begin
   Init;
   --  STM32_SVD.AFIO.AFIO_Periph.MAPR.SWJ_CFG := 2#010#;
   LED_GREEN.Set;
   Put_Line ("Starting");
   loop
      LED_GREEN.Toggle;
      Next_Release := Next_Release + Period;
      delay until Next_Release;
      Put_Line ("Ping");
   end loop;
end Main;
