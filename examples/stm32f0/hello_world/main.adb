with Drivers.Text_IO;
with STM32GD.Board;
with Startup;

procedure Main is
   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);
begin
   STM32GD.Board.Init;
   loop
      Text_IO.Put_Line ("Hello, World!");
   end loop;
end Main;
