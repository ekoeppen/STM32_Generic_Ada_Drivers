with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;

with STM32GD.Board; use STM32GD.Board;
with STM32GD.GPIO; use STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.EXTI;

with STM32_SVD.AFIO;
with STM32_SVD.NVIC;
with STM32_SVD.RCC;

with Peripherals; use Peripherals;

procedure Main is

   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (1000);  -- arbitrary

begin
   Init;
   STM32_SVD.NVIC.NVIC_Periph.ISER0 := 2#00000000_10011000_00000000_00000000#;
   Put_Line ("Init");
   USB_Re_Enumerate;
   USB.Init;
   LED_GREEN.Set;
   Put_Line ("Starting");
   loop
      LED_GREEN.Toggle;
      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;
