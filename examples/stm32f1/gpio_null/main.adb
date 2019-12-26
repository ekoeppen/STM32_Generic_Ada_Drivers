with STM32GD.Board; use STM32GD.Board;

procedure Main is

begin
   Init;
   LED_GREEN.Clear;
   LED_RED.Set;
   loop
      if BUTTON.Is_Set then
         LED_GREEN.Toggle;
         LED_RED.Toggle;
      end if;
   end loop;
end Main;
