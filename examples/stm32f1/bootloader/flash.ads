with Interfaces; use Interfaces;

package Flash is

   pragma Preelaborate;

   procedure Init
      with Inline_Always;
   procedure Unlock
      with Inline_Always;
   procedure Lock
      with Inline_Always;
   procedure Enable_Erase
      with Inline_Always;
   procedure Enable_Write
      with Inline_Always;
   procedure Write (Addr : Unsigned_32; Value : Unsigned_16)
      with Inline_Always;
   function Read (Addr : Unsigned_32) return Unsigned_16
      with Inline_Always;
   procedure Erase (Addr : Unsigned_32)
      with Inline_Always;
   procedure Wait_Until_Ready
      with Inline_Always;

end Flash;
