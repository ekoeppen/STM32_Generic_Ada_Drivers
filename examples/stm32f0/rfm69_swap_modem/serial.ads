with STM32GD.USART; use STM32GD.USART;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Serial is

   type Serial_Data is
   record
      Data : USART_Data (1 .. 64);
      Length : Natural;
   end record;

   protected type Buffer is
      procedure Set_Line (Data: Serial_Data);
      function Get_Line return Serial_Data;
   private
      Line : Serial_Data;
   end Buffer;

   Input : Buffer;
   Input_Available : Suspension_Object;

   Output : Buffer;

   procedure Read_Line (Line : out Serial_Data);
   procedure Write_Line (Line : in String);
   procedure Write_Line (Line : in Serial_Data);

end Serial;
