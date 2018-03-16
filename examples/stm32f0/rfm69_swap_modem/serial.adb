with STM32_SVD;
with STM32GD.USART; use STM32GD.USART;
with STM32GD.Board;
with Peripherals;
with Ada.Real_Time; use Ada.Real_Time;

package body Serial is

   protected body Buffer is
      procedure Set_Line (Data: Serial_Data) is
      begin
         Set_True (Input_Available);
         Line := Data;
      end Set_Line;

      function Get_Line return Serial_Data is
      begin
         Set_False (Input_Available);
         return Line;
      end Get_Line;
   end Buffer;

   ----------------------------------------------------------------------------
   --
   procedure Read_Line (Line : out Serial_Data) is
   begin
      Suspend_Until_True (Input_Available);
      Line := Input.Get_Line;
   end Read_Line;

   procedure Write_Line (Line : in Serial_Data) is
   begin
      Peripherals.USART.DMA_Transmit (Line.Data, Line.Length);
   end Write_Line;

   procedure Write_Line (Line : in String) is
      TX_Buffer : USART_Data (1 .. Line'Length);
   begin
      for I in Line'Range loop
         TX_Buffer (I) := Character'Pos (Line (I));
      end loop;
      Peripherals.USART.DMA_Transmit (TX_Buffer, TX_Buffer'Length);
   end Write_Line;

   ----------------------------------------------------------------------------

   task Serial_Task with Storage_Size => 256 is
      pragma Priority (10);
   end Serial_Task;

   task body Serial_Task is
      RX_Data : Serial_Data;
      Next_Release : Time := Clock;
      Period       : constant Time_Span := Milliseconds (10);
   begin
      Serial.Write_Line ("Serial task starting" & Character'Val (10));
      delay until Next_Release + Period;
      loop
         Peripherals.USART.DMA_Receive (RX_Data.Data, RX_Data.Length);
         if RX_Data.Length > 0 then
            Input.Set_Line (RX_Data);
            STM32GD.Board.LED_GREEN.Toggle;
         end if;
      end loop;
   end Serial_Task;

end Serial;
