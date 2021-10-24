pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x3.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.RNG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_RNGEN_Field is STM32_SVD.Bit;
   subtype CR_IE_Field is STM32_SVD.Bit;

   --  control register
   type CR_Register is record
      --  unspecified
      Reserved_0_1  : STM32_SVD.UInt2 := 16#0#;
      --  Random number generator enable
      RNGEN         : CR_RNGEN_Field := 16#0#;
      --  Interrupt enable
      IE            : CR_IE_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : STM32_SVD.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      RNGEN         at 0 range 2 .. 2;
      IE            at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype SR_DRDY_Field is STM32_SVD.Bit;
   subtype SR_CECS_Field is STM32_SVD.Bit;
   subtype SR_SECS_Field is STM32_SVD.Bit;
   subtype SR_CEIS_Field is STM32_SVD.Bit;
   subtype SR_SEIS_Field is STM32_SVD.Bit;

   --  status register
   type SR_Register is record
      --  Read-only. Data ready
      DRDY          : SR_DRDY_Field := 16#0#;
      --  Read-only. Clock error current status
      CECS          : SR_CECS_Field := 16#0#;
      --  Read-only. Seed error current status
      SECS          : SR_SECS_Field := 16#0#;
      --  unspecified
      Reserved_3_4  : STM32_SVD.UInt2 := 16#0#;
      --  Clock error interrupt status
      CEIS          : SR_CEIS_Field := 16#0#;
      --  Seed error interrupt status
      SEIS          : SR_SEIS_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      DRDY          at 0 range 0 .. 0;
      CECS          at 0 range 1 .. 1;
      SECS          at 0 range 2 .. 2;
      Reserved_3_4  at 0 range 3 .. 4;
      CEIS          at 0 range 5 .. 5;
      SEIS          at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Random number generator
   type RNG_Peripheral is record
      --  control register
      CR : aliased CR_Register;
      --  status register
      SR : aliased SR_Register;
      --  data register
      DR : aliased STM32_SVD.UInt32;
   end record
     with Volatile;

   for RNG_Peripheral use record
      CR at 16#0# range 0 .. 31;
      SR at 16#4# range 0 .. 31;
      DR at 16#8# range 0 .. 31;
   end record;

   --  Random number generator
   RNG_Periph : aliased RNG_Peripheral
     with Import, Address => RNG_Base;

end STM32_SVD.RNG;
