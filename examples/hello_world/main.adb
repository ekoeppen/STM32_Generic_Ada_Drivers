with Drivers.Text_IO;
with STM32GD.Board;

procedure Main is

   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);
   Line : String (1 .. 8);
   Len : Natural;

begin
   STM32GD.Board.Init;
   STM32GD.Board.LED_GREEN.Set;
   loop
      Text_IO.Put_Line ("Hello, World!");
      Text_IO.Put_Line ("Press <enter>");
      Text_IO.Get_Line (Line, Len);
      STM32GD.Board.LED_GREEN.Toggle;
   end loop;
end Main;
