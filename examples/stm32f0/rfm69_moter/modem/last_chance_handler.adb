with STM32GD.Board;
with STM32_SVD; use STM32_SVD;
with STM32_SVD.USART; use STM32_SVD.USART;

package body Last_Chance_Handler is

   procedure Put_Char (Char : Byte) is
   begin
      while USART1_Periph.ISR.TXE = 0 loop
         null;
      end loop;
      USART1_Periph.TDR.TDR := UInt9 (Char);
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

   function String_Length (String : System.Address) return Natural is
      S : array (0 .. 31) of Byte;
      for S'Address use String;
      Length : Natural := 0;
   begin
      for C of S loop
         exit when C = Byte (0);
         Length := Length + 1;
      end loop;
      return Length;
   end String_Length;

   -------------------------
   -- Last_Chance_Handler --
   -------------------------

   procedure Last_Chance_Handler (Msg : System.Address; Line : Integer) is
   begin
      Put_Char (Byte (16#10#));
      Put_Char (Byte (16#02#));
      Put_Char (Byte (16#D8#));
      Put_Char (Byte (16#45#));
      Put_Char (Byte (16#82#));
      Put_Char (Byte (16#40# + String_Length (Msg)));
      Put_String (Msg);
      Put_Char (Byte (16#19#));
      Put_Char (Byte (Line / 256));
      Put_Char (Byte (Line mod 256));
      Put_Char (Byte (16#10#));
      Put_Char (Byte (16#03#));
      STM32GD.Board.LED2.Set;
      loop
         null;
      end loop;
   end Last_Chance_Handler;

end Last_Chance_Handler;

