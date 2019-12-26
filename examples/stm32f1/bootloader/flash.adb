with System;

package body Flash is

   Flash_Memory : array (Unsigned_32 range 0 .. 16#3FFFF#) of Unsigned_16
      with Import, Address => System'To_Address (0);

   procedure Init is
   begin
      null;
   end Init;

   procedure Unlock is
   begin
      null;
   end Unlock;

   procedure Lock is
   begin
      null;
   end Lock;

   procedure Enable_Erase is
   begin
      null;
   end Enable_Erase;

   procedure Erase (Addr : Unsigned_32) is
   begin
      Enable_Erase;
      Write (Addr, 0);
   end Erase;

   procedure Enable_Write is
   begin
      null;
   end Enable_Write;

   procedure Write (Addr : Unsigned_32; Value : Unsigned_16) is
   begin
      Flash_Memory (Addr / 2) := Value;
   end Write;

   function Read (Addr : Unsigned_32) return Unsigned_16 is
   begin
      return Flash_Memory (Addr / 2);
   end Read;

   procedure Wait_Until_Ready is
   begin
      null;
   end Wait_Until_Ready;

end Flash;
