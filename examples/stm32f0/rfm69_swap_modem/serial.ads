with STM32GD.USART; use STM32GD.USART;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Serial is

   subtype Line_Length is Integer range 1 .. 64;

   type Serial_Data is
   record
      Data : USART_Data (Line_Length);
      Length : Natural;
   end record;

   procedure Read_Line (Line : out Serial_Data);
   procedure Write_Line (Line : in String);
   procedure Write_Line (Line : in Serial_Data);

   procedure Test;

end Serial;
