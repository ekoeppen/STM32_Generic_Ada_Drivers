with System.Machine_Code; use System.Machine_Code;
with System; use System;
with Interfaces; use Interfaces;
with STM32_SVD; use STM32_SVD;
with Flash;
with STM32GD.Board;
with STM32_SVD.RCC;

procedure Bootloader is

   Line : array (Unsigned_32 range 0 .. 47) of Unsigned_8;
   Count : Unsigned_8;

   Reset_Vector_Address : constant Unsigned_32 := 16#0800_0004#;
   Bootloader_Address : constant Unsigned_32
      with Import, Convention => Asm, External_Name => "__bootloader";
   User_Vector_Address : constant Unsigned_32
      with Import, Convention => Asm, External_Name => "__bootloader_data";
   Flash_Segment_Size : constant Unsigned_32 := 1024;
   --   with Import, Convention => Asm, External_Name => "__page_size";

   package Board renames STM32GD.Board;
   package USART renames Board.USART;

   procedure Erase is
      Addr : Unsigned_32 := 16#0800_0000#;
      Saved_Vector_Low : Unsigned_16;
      Saved_Vector_High : Unsigned_16;
   begin
      Saved_Vector_Low := Flash.Read (Reset_Vector_Address);
      Saved_Vector_High := Flash.Read (Reset_Vector_Address + 2);
      Flash.Unlock;
      while Addr < Bootloader_Address loop
         Flash.Erase (Addr);
         Addr := Addr + Flash_Segment_Size;
      end loop;
      Flash.Enable_Write;
      Flash.Write (Reset_Vector_Address, Saved_Vector_Low);
      Flash.Write (Reset_Vector_Address + 2, Saved_Vector_High);
      Flash.Lock;
   end Erase;

   function Nibble (N : Unsigned_8) return Unsigned_8 is
   begin
      return (if N >= 65 then N - 65 + 10 else N - 48);
   end Nibble;

   function From_Hex (I : Unsigned_32) return Unsigned_8 is
   begin
      return 16 * Nibble (Line (I)) + Nibble (Line (I + 1));
   end From_Hex;

   procedure Write (Addr : Unsigned_32) is
      Value : Unsigned_16;
      Write_Addr : Unsigned_32 := Addr;
      J : Unsigned_32;
   begin
      Flash.Unlock;
      J := 9;
      for I in Unsigned_32 range 1 .. Unsigned_32 (Count) / 2 loop
         Flash.Enable_Write;
         Value := Unsigned_16 (From_Hex (J)) +
            256 * Unsigned_16 (From_Hex (J + 2));
         if Write_Addr = Reset_Vector_Address then
            Flash.Write (User_Vector_Address, Value);
         elsif Write_Addr = Reset_Vector_Address + 2 then
            Flash.Write (User_Vector_Address + 2, Value);
         else
            Flash.Write (Write_Addr, Value);
         end if;
         J := J + 4;
         Write_Addr := Write_Addr + Unsigned_32 (2);
      end loop;
      Flash.Lock;
   end Write;

   procedure Read_Lines is
      Record_Type : Unsigned_8;
      XON : constant Byte := 17;
      XOFF : constant Byte := 19;
      Offset : Unsigned_32 := 0;
      Addr : Unsigned_32;
   begin
      loop
         USART.Transmit (XON);
         for I in Line'Range loop
            Line (I) := Unsigned_8 (USART.Receive);
            exit when Line (I) = 10;
         end loop;
         USART.Transmit (XOFF);
         Count := From_Hex (1);
         Addr := Unsigned_32 (From_Hex (3)) * 256 + Unsigned_32 (From_Hex (5));
         Record_Type := From_Hex (7);
         case Record_Type is
            when 16#00# => Write (Addr + Offset);
            when 16#04# => Offset := (Unsigned_32 (From_Hex (9)) * 256 + Unsigned_32 (From_Hex (11))) * 2 ** 16;
            when 16#80# => Flash.Erase (Addr + Offset);
            when others => null;
         end case;
      end loop;
   end Read_Lines;

begin
   Board.TX.Enable;
   Board.RX.Enable;
   USART.Enable;
   Board.TX.Init;
   Board.RX.Init;
   USART.Init;
   USART.Transmit (Character'Pos ('?'));
      for I in 0 .. 16#0010_0000# loop
         if USART.Data_Available then
            USART.Transmit (Character'Pos ('F'));
            while USART.Data_Available loop USART.Transmit (USART.Receive); end loop;
            Flash.Init;
            Erase;
            Read_Lines;
         end if;
   end loop;
   USART.Transmit (Character'Pos ('R'));
   if Flash.Read (User_Vector_Address) /= 16#FFFF# then
      Asm ("movs r1, #0; ldr r1, [r1]; mov sp, r1", Volatile => True);
      Asm ("ldr r0, %0", Volatile => True, Inputs => Unsigned_32'Asm_Input ("m", User_Vector_Address));
      Asm ("ldr r0, [r0]; add r1, #1; bx r0", Volatile => True);
   end if;
end Bootloader;
