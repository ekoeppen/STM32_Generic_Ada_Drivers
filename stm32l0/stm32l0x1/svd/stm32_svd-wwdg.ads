--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.WWDG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control register
   type CR_Register is record
      --  7-bit counter (MSB to LSB)
      T             : STM32_SVD.UInt7;
      --  Activation bit
      WDGA          : STM32_SVD.Bit;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      T             at 0 range 0 .. 6;
      WDGA          at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  CFR_WDGTB array
   type CFR_WDGTB_Field_Array is array (0 .. 1) of STM32_SVD.Bit
     with Component_Size => 1, Size => 2;

   --  Type definition for CFR_WDGTB
   type CFR_WDGTB_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WDGTB as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  WDGTB as an array
            Arr : CFR_WDGTB_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CFR_WDGTB_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Configuration register
   type CFR_Register is record
      --  7-bit window value
      W              : STM32_SVD.UInt7;
      --  WDGTB0
      WDGTB          : CFR_WDGTB_Field;
      --  Early wakeup interrupt
      EWI            : STM32_SVD.Bit;
      --  unspecified
      Reserved_10_31 : STM32_SVD.UInt22;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFR_Register use record
      W              at 0 range 0 .. 6;
      WDGTB          at 0 range 7 .. 8;
      EWI            at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  Status register
   type SR_Register is record
      --  Early wakeup interrupt flag
      EWIF          : STM32_SVD.Bit;
      --  unspecified
      Reserved_1_31 : STM32_SVD.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      EWIF          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System window watchdog
   type WWDG_Peripheral is record
      --  Control register
      CR  : aliased CR_Register;
      --  Configuration register
      CFR : aliased CFR_Register;
      --  Status register
      SR  : aliased SR_Register;
   end record
     with Volatile;

   for WWDG_Peripheral use record
      CR  at 16#0# range 0 .. 31;
      CFR at 16#4# range 0 .. 31;
      SR  at 16#8# range 0 .. 31;
   end record;

   --  System window watchdog
   WWDG_Periph : aliased WWDG_Peripheral
     with Import, Address => WWDG_Base;

end STM32_SVD.WWDG;
