with STM32_SVD; use STM32_SVD;

package body Drivers.Text_IO is

   procedure Put (C : Character) is
   begin
      USART.Transmit (Character'Pos (C));
   end Put;

   procedure Put (S : String) is
   begin
      for C of S loop
         Put (C);
      end loop;
   end Put;

   procedure Put_Line (S : String) is
   begin
      Put (S);
      New_Line;
   end Put_Line;

   procedure New_Line is
   begin
      USART.Transmit (10);
   end New_Line;

   procedure Put_Integer (N : Integer; Width : Natural := 0) is
      Buffer : array (Unsigned_8 range 0 .. 15) of Character;
      I : Unsigned_8 := Buffer'Last;
      V : Integer := N;
   begin
      if N /= 0 then
         if V < 0 then
            Put ('-');
            V := -V;
         end if;
         while V > 0 loop
            Buffer (I) := Character'Val (Unsigned_8 (V mod 10) + Character'Pos ('0'));
            V := V / 10;
            I := I - 1;
         end loop;
         for J in Unsigned_8 range I + 1 .. 15 loop USART.Transmit (Character'Pos (Buffer (J))); end loop;
      else
         Put ('0');
      end if;
   end Put_Integer;

   procedure Put_Hex (N : Unsigned_32; Width : Unsigned_8 := 0) is
      Buffer : array (Unsigned_8 range 0 .. 15) of Character;
      I : Unsigned_8 := 15;
      Nibble : Unsigned_8;
      V : Unsigned_32 := N;
   begin
      for I in Buffer'Range loop Buffer (I) := '0'; end loop;
      while V > 0 loop
         Nibble := Unsigned_8 (V mod 16);
         if Nibble < 10 then
            Nibble := Nibble + Character'Pos ('0');
         else
            Nibble := Nibble - 10 + Character'Pos ('A');
         end if;
         Buffer (I) := Character'Val (Nibble);
         V := V / 16;
         I := I - 1;
      end loop;
      if Width /= 0 then
         I := 15 - Width;
      end if;
      for J in Unsigned_8 range I + 1 .. 15 loop USART.Transmit (Character'Pos (Buffer (J))); end loop;
   end Put_Hex;

   procedure Get_Line (S : out String; Count : out Natural) is
      C : Character;
   begin
      Count := 0;
      for I in S'range loop
         C := Character'Val (USART.Receive);
         exit when C = Character'Val (10);
         S (I) := C;
         Count := Count + 1;
      end loop;
   end Get_Line;

   procedure Hex_Dump (S : String) is
      N : Unsigned_32 := 0;
   begin
      for I in S'Range loop
         if N mod 16 = 0 then
            Put_Hex (N, 4); Put (": ");
         end if;
         Put_Hex (Unsigned_32 (Character'Pos (S (I))), 2); Put (' ');
         if (N + 1) mod 16 = 0 then
            New_Line;
         end if;
         N := N + 1;
      end loop;
      if N mod 16 /= 0 then
         New_Line;
      end if;
   end Hex_Dump;

end Drivers.Text_IO;
