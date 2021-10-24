pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x3.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.CRC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype IDR_IDR_Field is STM32_SVD.Byte;

   --  Independent data register
   type IDR_Register is record
      --  General-purpose 8-bit data register bits
      IDR           : IDR_IDR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      IDR           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CR_RESET_Field is STM32_SVD.Bit;
   subtype CR_POLYSIZE_Field is STM32_SVD.UInt2;
   subtype CR_REV_IN_Field is STM32_SVD.UInt2;
   subtype CR_REV_OUT_Field is STM32_SVD.Bit;

   --  Control register
   type CR_Register is record
      --  Write-only. RESET bit
      RESET         : CR_RESET_Field := 16#0#;
      --  unspecified
      Reserved_1_2  : STM32_SVD.UInt2 := 16#0#;
      --  Polynomial size
      POLYSIZE      : CR_POLYSIZE_Field := 16#0#;
      --  Reverse input data
      REV_IN        : CR_REV_IN_Field := 16#0#;
      --  Reverse output data
      REV_OUT       : CR_REV_OUT_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      RESET         at 0 range 0 .. 0;
      Reserved_1_2  at 0 range 1 .. 2;
      POLYSIZE      at 0 range 3 .. 4;
      REV_IN        at 0 range 5 .. 6;
      REV_OUT       at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Cyclic redundancy check calculation unit
   type CRC_Peripheral is record
      --  Data register
      DR   : aliased STM32_SVD.UInt32;
      --  Independent data register
      IDR  : aliased IDR_Register;
      --  Control register
      CR   : aliased CR_Register;
      --  Initial CRC value
      INIT : aliased STM32_SVD.UInt32;
      --  polynomial
      POL  : aliased STM32_SVD.UInt32;
   end record
     with Volatile;

   for CRC_Peripheral use record
      DR   at 16#0# range 0 .. 31;
      IDR  at 16#4# range 0 .. 31;
      CR   at 16#8# range 0 .. 31;
      INIT at 16#10# range 0 .. 31;
      POL  at 16#14# range 0 .. 31;
   end record;

   --  Cyclic redundancy check calculation unit
   CRC_Periph : aliased CRC_Peripheral
     with Import, Address => CRC_Base;

end STM32_SVD.CRC;
