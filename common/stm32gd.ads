pragma Warnings (Off);
with Interfaces; use Interfaces;
pragma Warnings (On);

package STM32GD is

   pragma Preelaborate;

   type UID_Type is array (1 .. 3) of Unsigned_32;

   procedure Wait_For_Interrupt with Inline_Always;
   procedure Clear_Event with Inline_Always;
   procedure Wait_For_Event with Inline_Always;
   procedure Reset;
   function UID return UID_Type;

end STM32GD;

