pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.STK is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CSR_ENABLE_Field is STM32_SVD.Bit;
   subtype CSR_TICKINT_Field is STM32_SVD.Bit;
   subtype CSR_CLKSOURCE_Field is STM32_SVD.Bit;
   subtype CSR_COUNTFLAG_Field is STM32_SVD.Bit;

   --  SysTick control and status register
   type CSR_Register is record
      --  Counter enable
      ENABLE         : CSR_ENABLE_Field := 16#0#;
      --  SysTick exception request enable
      TICKINT        : CSR_TICKINT_Field := 16#0#;
      --  Clock source selection
      CLKSOURCE      : CSR_CLKSOURCE_Field := 16#0#;
      --  unspecified
      Reserved_3_15  : STM32_SVD.UInt13 := 16#0#;
      --  COUNTFLAG
      COUNTFLAG      : CSR_COUNTFLAG_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : STM32_SVD.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      ENABLE         at 0 range 0 .. 0;
      TICKINT        at 0 range 1 .. 1;
      CLKSOURCE      at 0 range 2 .. 2;
      Reserved_3_15  at 0 range 3 .. 15;
      COUNTFLAG      at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype RVR_RELOAD_Field is STM32_SVD.UInt24;

   --  SysTick reload value register
   type RVR_Register is record
      --  RELOAD value
      RELOAD         : RVR_RELOAD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RVR_Register use record
      RELOAD         at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CVR_CURRENT_Field is STM32_SVD.UInt24;

   --  SysTick current value register
   type CVR_Register is record
      --  Current counter value
      CURRENT        : CVR_CURRENT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CVR_Register use record
      CURRENT        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CALIB_TENMS_Field is STM32_SVD.UInt24;
   subtype CALIB_SKEW_Field is STM32_SVD.Bit;
   subtype CALIB_NOREF_Field is STM32_SVD.Bit;

   --  SysTick calibration value register
   type CALIB_Register is record
      --  Calibration value
      TENMS          : CALIB_TENMS_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : STM32_SVD.UInt6 := 16#0#;
      --  SKEW flag: Indicates whether the TENMS value is exact
      SKEW           : CALIB_SKEW_Field := 16#0#;
      --  NOREF flag. Reads as zero
      NOREF          : CALIB_NOREF_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CALIB_Register use record
      TENMS          at 0 range 0 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      SKEW           at 0 range 30 .. 30;
      NOREF          at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  SysTick timer
   type STK_Peripheral is record
      --  SysTick control and status register
      CSR   : aliased CSR_Register;
      --  SysTick reload value register
      RVR   : aliased RVR_Register;
      --  SysTick current value register
      CVR   : aliased CVR_Register;
      --  SysTick calibration value register
      CALIB : aliased CALIB_Register;
   end record
     with Volatile;

   for STK_Peripheral use record
      CSR   at 16#0# range 0 .. 31;
      RVR   at 16#4# range 0 .. 31;
      CVR   at 16#8# range 0 .. 31;
      CALIB at 16#C# range 0 .. 31;
   end record;

   --  SysTick timer
   STK_Periph : aliased STK_Peripheral
     with Import, Address => STK_Base;

end STM32_SVD.STK;
