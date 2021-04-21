with Ada.Real_Time; use Ada.Real_Time;
with STM32GD.Board; use STM32GD.Board;

procedure Main is

   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (500);

begin
   Init;
   LED.Set;
   Text_IO.Put_Line ("Starting");
   loop
      Text_IO.Put_Line ("Waiting");
      Next_Release := Next_Release + Period;
      delay until Next_Release;
      LED.Toggle;
   end loop;
end Main;
