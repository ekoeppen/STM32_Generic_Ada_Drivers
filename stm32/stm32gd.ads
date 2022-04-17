pragma Warnings (Off);
with Interfaces; use Interfaces;
pragma Warnings (On);

with STM32_SVD; use STM32_SVD;

package STM32GD is

   pragma Preelaborate;

   type UID_Type is array (1 .. 3) of Unsigned_32;
   type Byte_Array is array (natural range <>) of Byte;
   subtype I2C_Address is UInt7;
   type Callback_Type is access procedure;

   procedure Wait_For_Interrupt with Inline_Always;
   procedure Clear_Event with Inline_Always;
   procedure Wait_For_Event with Inline_Always;
   function UID return UID_Type;

end STM32GD;

