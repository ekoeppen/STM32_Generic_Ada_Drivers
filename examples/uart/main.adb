with STM32GD.Board; use STM32GD.Board;

procedure Main is

begin
   Init;
   USART.Transmit (79);
   USART.Transmit (75);
   USART.Transmit (32);
   loop
      USART.Transmit (USART.Receive);
      LED.Toggle;
   end loop;
end Main;
