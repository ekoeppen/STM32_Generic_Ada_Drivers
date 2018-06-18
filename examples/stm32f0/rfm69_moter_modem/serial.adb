with STM32_SVD; use STM32_SVD;
with STM32_SVD.USART; use STM32_SVD.USART;
with STM32GD.USART; use STM32GD.USART;
with STM32GD.Board;
with Peripherals;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Interrupts;
with Ada.Interrupts.Names;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body Serial is

   task Serial_Task with Storage_Size => 384;

   ----------------------------------------------------------------------------

   protected body Input is
      entry Read_Line (Line : out Serial_Data) when Ready is
      begin
         Line.Data := Buffer.Data;
         Line.Length := Buffer.Length - 1;
         Ready := False;
      end Read_Line;

      procedure Set_Ready (Line : Serial_Data) is
      begin
         Buffer := Line;
         Ready := True;
      end Set_Ready;
   end Input;

   package body Output is
      procedure Write (Data : in USART_Data; Length : in Natural) is
      begin
         Peripherals.USART.DMA_Transmit (Data, Length);
      end Write;

      procedure Write (Line : in Serial_Data) is
      begin
         Write (Line.Data, Line.Length);
      end Write;

      procedure Write_Line (Line : in Serial_Data) is
      begin
         Write (Line.Data, Line.Length);
         Peripherals.USART.Transmit (10);
      end Write_Line;

      procedure Write (Line : in String) is
         TX_Buffer : USART_Data (1 .. Line'Length);
      begin
         for I in Line'Range loop
            TX_Buffer (I) := Character'Pos (Line (I));
         end loop;
         Write (TX_Buffer, TX_Buffer'Length);
      end Write;

      procedure Write_Line (Line : in String) is
      begin
         Write (Line);
         Peripherals.USART.Transmit (10);
      end Write_Line;
   end Output;

   ----------------------------------------------------------------------------

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

   procedure Test is
      RX_Data : Serial_Data;
   begin
      Input.Read_Line (RX_Data);
      Output.Write (RX_Data);
   end Test;

   task body Serial_Task is
      Buffer : Serial_Data;
   begin
      Serial.Write_Line ("Serial task starting" & Character'Val (10));
      loop
         Buffer.Length := Buffer.Data'First;
         loop
            Peripherals.USART.IRQ_Handler.Wait;
            exit when Peripherals.USART.DMA_Receive (10, Buffer.Data, Buffer.Length);
         end loop;
         Input.Set_Ready (Buffer);
      end loop;
   end Serial_Task;

end Serial;
