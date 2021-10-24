with STM32GD.Board; use STM32GD.Board;
with HAL;

procedure Main is

   package Button_IRQ is new HAL.Pin_IRQ (Pin => BUTTON);

begin
   Init;
   LED.Set;
   Text_IO.Put_Line ("Hello, World!");
   STM32GD.Clear_Event;
   Button.Configure_Trigger (Rising => True);
   loop
      Text_IO.Put_Line ("Waiting for button...");
      Button.Wait_For_Trigger;
      LED.Toggle;
      Text_IO.Put_Line ("Button pressed");
   end loop;
end Main;
