with STM32_SVD; use STM32_SVD;
with STM32_SVD.USART; use STM32_SVD.USART;
with STM32GD.USART; use STM32GD.USART;
with STM32GD.Board;
with Peripherals;
with Peripherals.IRQ_Handlers;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Interrupts;
with Ada.Interrupts.Names;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body Serial is

   Input : Serial_Data;
   Input_Available : Suspension_Object;

   ----------------------------------------------------------------------------

   procedure Read_Line (Line : out Serial_Data) is
   begin
      Input.Length := Input.Data'First;
      Set_False (Input_Available);
      Suspend_Until_True (Input_Available);
      Line := Input;
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

   procedure Test is
      RX_Data : Serial_Data;
   begin
      Read_Line (RX_Data);
      Write_Line (RX_Data);
   end Test;

   ----------------------------------------------------------------------------

   task Serial_Task with Storage_Size => 384;

   task body Serial_Task is
   begin
      Serial.Write_Line ("Serial task starting" & Character'Val (10));
      loop
         Peripherals.IRQ_Handlers.USART.Wait;
         Peripherals.USART.DMA_Receive (10, Input.Data, Input.Length);
         Set_True (Input_Available);
      end loop;
   end Serial_Task;

end Serial;
