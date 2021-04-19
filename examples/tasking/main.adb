with Ada.Real_Time; use Ada.Real_Time;
with STM32GD.Board; use STM32GD.Board;

with Tasks;

procedure Main is
   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (500);
begin
   Init;
   LED.Set;
	STM32GD.Board.Text_IO.Put_Line ("Main task starting");
   loop
      Next_Release := Next_Release + Period;
      delay until Next_Release;
      LED.Toggle;
      Tasks.Protect.Go;
   end loop;
end Main;
