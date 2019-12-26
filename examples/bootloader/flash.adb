with System.Machine_Code; use System.Machine_Code;
with STM32_SVD.Flash; use STM32_SVD.Flash;
with STM32_SVD; use STM32_SVD;
with System;

package body Flash is

   procedure Init is
   begin
      null;
   end Init;

   procedure Unlock is
   begin
      Flash_Periph.KEYR := 16#4567_0123#;
      Flash_Periph.KEYR := 16#CDEF_89AB#;
   end Unlock;

   procedure Lock is
   begin
      Flash_Periph.CR.PER := 0;
      Flash_Periph.CR.PG := 0;
      Flash_Periph.CR.LOCK := 1;
   end Lock;

   procedure Erase (Addr : Unsigned_32) is
   begin
      Flash_Periph.CR.PER := 1;
      Flash_Periph.AR := UInt32 (Addr);
      Flash_Periph.CR.STRT := 1;
      Wait_Until_Ready;
      Flash_Periph.CR.PER := 0;
   end Erase;

   procedure Enable_Write is
   begin
      Flash_Periph.CR.PG := 1;
   end Enable_Write;

   procedure Write (Addr : Unsigned_32; Value : Unsigned_16) is
   begin
      Asm ("strh r1, [r0]", Volatile => True);
      Wait_Until_Ready;
   end Write;

   function Read (Addr : Unsigned_32) return Unsigned_16 is
      V : Unsigned_16;
   begin
      Asm ("ldrh %1, [%0]",
         Inputs => Unsigned_32'Asm_Input ("r", Addr),
         Outputs => Unsigned_16'Asm_Output ("=r", V));
      return V;
   end Read;

   procedure Wait_Until_Ready is
   begin
      while Flash_Periph.SR.BSY = 1 loop null; end loop;
      while Flash_Periph.SR.EOP = 0 loop null; end loop;
      Flash_Periph.SR.EOP := 1;
   end Wait_Until_Ready;

end Flash;
