with STM32GD.Board; use STM32GD.Board;

procedure Main is

begin
   Init;
   LED2.Clear;
   LED.Set;
   loop
      if BUTTON.Is_Set then
         LED2.Toggle;
         LED.Toggle;
      end if;
   end loop;
end Main;
