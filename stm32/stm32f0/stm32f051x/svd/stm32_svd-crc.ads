--  This spec has been automatically generated from STM32F0xx.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

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
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      IDR           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CR_RESET_Field is STM32_SVD.Bit;
   subtype CR_REV_IN_Field is STM32_SVD.UInt2;
   subtype CR_REV_OUT_Field is STM32_SVD.Bit;

   --  Control register
   type CR_Register is record
      --  reset bit
      RESET         : CR_RESET_Field := 16#0#;
      --  unspecified
      Reserved_1_4  : STM32_SVD.UInt4 := 16#0#;
      --  Reverse input data
      REV_IN        : CR_REV_IN_Field := 16#0#;
      --  Reverse output data
      REV_OUT       : CR_REV_OUT_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      RESET         at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      REV_IN        at 0 range 5 .. 6;
      REV_OUT       at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  cyclic redundancy check calculation unit
   type CRC_Peripheral is record
      --  Data register
      DR   : aliased STM32_SVD.UInt32;
      --  Independent data register
      IDR  : aliased IDR_Register;
      --  Control register
      CR   : aliased CR_Register;
      --  Initial CRC value
      INIT : aliased STM32_SVD.UInt32;
   end record
     with Volatile;

   for CRC_Peripheral use record
      DR   at 16#0# range 0 .. 31;
      IDR  at 16#4# range 0 .. 31;
      CR   at 16#8# range 0 .. 31;
      INIT at 16#C# range 0 .. 31;
   end record;

   --  cyclic redundancy check calculation unit
   CRC_Periph : aliased CRC_Peripheral
     with Import, Address => System'To_Address (16#40023000#);

end STM32_SVD.CRC;
