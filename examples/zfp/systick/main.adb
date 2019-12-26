with STM32GD.Board;
with Drivers.Text_IO;
with Monotonic_Counter;
with Startup;

procedure Main is

   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);

begin
   STM32GD.Board.Init;
   Text_IO.Put_Line ("Starting SYSTICK...");
   Monotonic_Counter.Reset;
   loop
      STM32GD.WFI;
   end loop;
end Main;

