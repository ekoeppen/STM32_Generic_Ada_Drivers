--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.STK is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  SysTick control and status register
   type CSR_Register is record
      --  Counter enable
      ENABLE         : STM32_SVD.Bit;
      --  SysTick exception request enable
      TICKINT        : STM32_SVD.Bit;
      --  Clock source selection
      CLKSOURCE      : STM32_SVD.Bit;
      --  unspecified
      Reserved_3_15  : STM32_SVD.UInt13;
      --  COUNTFLAG
      COUNTFLAG      : STM32_SVD.Bit;
      --  unspecified
      Reserved_17_31 : STM32_SVD.UInt15;
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

   --  SysTick reload value register
   type RVR_Register is record
      --  RELOAD value
      RELOAD         : STM32_SVD.UInt24;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RVR_Register use record
      RELOAD         at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  SysTick current value register
   type CVR_Register is record
      --  Current counter value
      CURRENT        : STM32_SVD.UInt24;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CVR_Register use record
      CURRENT        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  SysTick calibration value register
   type CALIB_Register is record
      --  Calibration value
      TENMS          : STM32_SVD.UInt24;
      --  unspecified
      Reserved_24_29 : STM32_SVD.UInt6;
      --  SKEW flag: Indicates whether the TENMS value is exact
      SKEW           : STM32_SVD.Bit;
      --  NOREF flag. Reads as zero
      NOREF          : STM32_SVD.Bit;
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
