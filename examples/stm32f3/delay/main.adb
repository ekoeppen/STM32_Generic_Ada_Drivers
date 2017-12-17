with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Real_Time; use Ada.Real_Time;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;

with STM32_SVD.RCC;

procedure Main is

   package GPIO renames STM32GD.GPIO;
   package LED is new GPIO.Pin (Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);

   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (75);  -- arbitrary

begin
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPAEN := True;
   LED.Init;
   LED.Set;
   loop
      LED.Toggle;
      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;

