with STM32GD.USART;
with STM32GD.Board;
with Peripherals;
with Ada.Real_Time; use Ada.Real_Time;

with Blink;

package body Serial is

   protected body Serial_Data is
      procedure Read is begin null; end;
      procedure Write is begin null; end;
   end Serial_Data;

   task Serial_Task with Storage_Size => 1024 is
      pragma Priority (30);
   end Serial_Task;

   task body Serial_Task is
      RX_Buffer : STM32GD.USART.USART_Data (1 .. 16);
      RX_Count : Natural;
      Blink_Delta : constant Time_Span := Milliseconds (100);
   begin
      loop
         Peripherals.USART.DMA_Receive (10, RX_Buffer, RX_Count);
         if RX_Count > 0 then
            STM32GD.Board.LED_GREEN.Toggle;
            Blink.Blink_Parameters.Set_Rate (Blink.Blink_Parameters.Get_Rate + Blink_Delta);
            Peripherals.USART.DMA_Transmit (RX_Buffer, RX_Count);
         end if;
      end loop;
   end Serial_Task;

end Serial;
