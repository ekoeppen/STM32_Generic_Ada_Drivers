with STM32GD.Board; use STM32GD.Board;
with STM32GD.USART; use STM32GD.USART;

procedure Main is

   RX_Buffer : USART_Data (1 .. 16);
   RX_Count : Natural;

begin
   Init;
   LED.Set;
   while True loop
      USART.DMA_Receive (10, RX_Buffer, RX_Count);
      LED.Toggle;
      if RX_Count > 0 then
         USART.DMA_Transmit (RX_Buffer, RX_Count);
      end if;
   end loop;
end Main;
