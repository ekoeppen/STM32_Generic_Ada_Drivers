with STM32GD.Board;

procedure Main is

   I : Integer with volatile;

begin
   STM32GD.Board.Init;
   STM32GD.Board.LED_GREEN.Set;
   loop
      I := 100000;
      while I > 0 loop
         I := I - 1;
      end loop;
      STM32GD.Board.LED_GREEN.Toggle;
   end loop;
end Main;
