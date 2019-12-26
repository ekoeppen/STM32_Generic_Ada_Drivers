with Interfaces; use Interfaces;

package Flash is

   pragma Preelaborate;

   procedure Init
      ;
   procedure Unlock
      ;
   procedure Lock
      ;
   procedure Enable_Write
      ;
   procedure Write (Addr : Unsigned_32; Value : Unsigned_16)
      ;
   function Read (Addr : Unsigned_32) return Unsigned_16
      ;
   procedure Erase (Addr : Unsigned_32)
      ;
   procedure Wait_Until_Ready
      ;

end Flash;
