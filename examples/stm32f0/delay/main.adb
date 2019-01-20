with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Real_Time; use Ada.Real_Time;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;

with STM32_SVD.RCC;
with STM32GD.Board; use STM32GD.Board;

procedure Main is

   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (75);  -- arbitrary

begin
   Init;
   LED_GREEN.Set;
   USART.Put_Line ("Starting");
   loop
      USART.Put_Line ("Waiting");
      Next_Release := Next_Release + Period;
      delay until Next_Release;
      LED_GREEN.Toggle;
   end loop;
end Main;

