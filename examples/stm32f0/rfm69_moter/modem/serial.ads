with STM32GD.USART; use STM32GD.USART;
with STM32_SVD;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Serial is

   subtype Line_Length is Integer range 1 .. 64;

   type Serial_Data is
   record
      Data     : USART_Data (Line_Length);
      Length   : Natural;
   end record;

   protected Input is
      entry Read_Line (Line : out Serial_Data);
      function Is_Ready return Boolean;
      procedure Set_Ready (Line : Serial_Data);
   private
      Buffer   : Serial_Data;
      Ready    : Boolean := False;
   end Input;

   package Output is
      procedure Write (Data : in USART_Data; Length : in Natural);

      procedure Write (Character : in STM32_SVD.Byte);
      procedure Write (Line : in Serial_Data);
      procedure Write_Line (Line : in Serial_Data);
   end Output;

end Serial;
