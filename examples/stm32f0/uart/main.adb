with Ada.Interrupts.Names;

with STM32GD.Board;
with STM32GD.USART;

with Peripherals;

procedure Main is
begin
   STM32GD.Board.Init;
   Peripherals.Init;

   loop
      Peripherals.USART.Transmit (Peripherals.USART.Receive);
   end loop;
end Main;

