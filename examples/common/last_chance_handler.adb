with STM32GD.Board;
with STM32_SVD; use STM32_SVD;
with STM32_SVD.USART; use STM32_SVD.USART;

package body Last_Chance_Handler is

   procedure Put_Char (Char : Byte) is
   begin
      USART1_Periph.TDR.TDR := UInt9 (Char);
      while USART1_Periph.ISR.TXE = 0 loop
         null;
      end loop;
   end Put_Char;

   procedure Put_String (String : System.Address) is
      S : array (0 .. 31) of Byte;
      for S'Address use String;
   begin
      for C of S loop
         exit when C = Byte (0);
         Put_Char (C);
      end loop;
   end Put_String;

   procedure Put_String (S: String) is
   begin
      for C of S loop
         exit when C = Character'Val (0);
         Put_Char (Character'Pos (C));
      end loop;
   end Put_String;

   -------------------------
   -- Last_Chance_Handler --
   -------------------------

   procedure Last_Chance_Handler (Msg : System.Address; Line : Integer) is
      Line_Str : String := Integer'Image (Line);
   begin
      Put_String ("Program error: ");
      Put_String (Msg);
      Put_String (Line_Str);
      Put_Char (Byte (10));
      STM32GD.Board.LED2.Set;
      loop
         null;
      end loop;
   end Last_Chance_Handler;

end Last_Chance_Handler;

