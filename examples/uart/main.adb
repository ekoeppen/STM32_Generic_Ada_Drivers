with STM32GD.Board; use STM32GD.Board;

procedure Main is

begin
   Init;
   loop
      USART.Transmit (USART.Receive);
      LED.Toggle;
   end loop;
end Main;
