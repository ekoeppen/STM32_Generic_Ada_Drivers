with Ada.Real_Time; use Ada.Real_Time;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;

with STM32_SVD.RCC;
with STM32GD.Board; use STM32GD.Board;

with Drivers.Text_IO;

procedure Main is

   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (500);
   package Text_IO is new Drivers.Text_IO (STM32GD.Board.USART);

begin
   Init;
   LED_GREEN.Set;
   Text_IO.Put_Line ("Starting");
   loop
      Text_IO.Put_Line ("Waiting");
      Next_Release := Next_Release + Period;
      delay until Next_Release;
      LED_GREEN.Toggle;
   end loop;
end Main;
