with Ada.Interrupts.Names;
with Ada.Real_Time; use Ada.Real_Time;

with STM32_SVD.RCC;
with STM32GD.Board;
with STM32GD.USART;

with Peripherals;

procedure Main is

   RX_Buffer : STM32GD.USART.USART_Data (1 .. 16);
   RX_Count : Natural;

begin
   STM32GD.Board.Init;
   STM32GD.Board.LED_GREEN.Set;
   Peripherals.Init;
   while True loop
      Peripherals.USART.DMA_Receive (10, RX_Buffer, RX_Count);
      STM32GD.Board.LED_GREEN.Toggle;
      if RX_Count > 0 then
         Peripherals.USART.DMA_Transmit (RX_Buffer, RX_Count);
      end if;
   end loop;
end Main;
