with STM32GD.USART; use STM32GD.USART;

package Serial is

   subtype Line_Length is Integer range 1 .. 64;

   type Serial_Data is
   record
      Data : USART_Data (Line_Length);
      Length : Natural;
   end record;

   package Output is
      procedure Write (Data : in USART_Data; Length : in Natural);

      procedure Write (Line : in Serial_Data);
      procedure Write_Line (Line : in Serial_Data);
      procedure Write (Line : in String);
      procedure Write_Line (Line : in String);
   end Output;

end Serial;
