with STM32GD.Board; use STM32GD.Board;

procedure Main is
begin
   Init;
   LED.Set;
   Text_IO.Put_Line ("Hello, World!");
   STM32GD.Clear_Event;
   BUTTON.Configure_Trigger (Rising => True);
   loop
      Text_IO.Put_Line ("Waiting for button...");
      BUTTON.Wait_For_Trigger;
      LED.Toggle;
      Text_IO.Put_Line ("Button pressed");
   end loop;
end Main;
