--  This spec has been automatically generated from STM32F103.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.STK is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CTRL_ENABLE_Field is STM32_SVD.Bit;
   subtype CTRL_TICKINT_Field is STM32_SVD.Bit;
   subtype CTRL_CLKSOURCE_Field is STM32_SVD.Bit;
   subtype CTRL_COUNTFLAG_Field is STM32_SVD.Bit;

   --  SysTick control and status register
   type CTRL_Register is record
      --  Counter enable
      ENABLE         : CTRL_ENABLE_Field := 16#0#;
      --  SysTick exception request enable
      TICKINT        : CTRL_TICKINT_Field := 16#0#;
      --  Clock source selection
      CLKSOURCE      : CTRL_CLKSOURCE_Field := 16#0#;
      --  unspecified
      Reserved_3_15  : STM32_SVD.UInt13 := 16#0#;
      --  COUNTFLAG
      COUNTFLAG      : CTRL_COUNTFLAG_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : STM32_SVD.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      ENABLE         at 0 range 0 .. 0;
      TICKINT        at 0 range 1 .. 1;
      CLKSOURCE      at 0 range 2 .. 2;
      Reserved_3_15  at 0 range 3 .. 15;
      COUNTFLAG      at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype LOAD_RELOAD_Field is STM32_SVD.UInt24;

   --  SysTick reload value register
   type LOAD_Register is record
      --  RELOAD value
      RELOAD         : LOAD_RELOAD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LOAD_Register use record
      RELOAD         at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype VAL_CURRENT_Field is STM32_SVD.UInt24;

   --  SysTick current value register
   type VAL_Register is record
      --  Current counter value
      CURRENT        : VAL_CURRENT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for VAL_Register use record
      CURRENT        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CALIB_TENMS_Field is STM32_SVD.UInt24;

   --  SysTick calibration value register
   type CALIB_Register is record
      --  Calibration value
      TENMS          : CALIB_TENMS_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CALIB_Register use record
      TENMS          at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  SysTick timer
   type STK_Peripheral is record
      --  SysTick control and status register
      CTRL  : aliased CTRL_Register;
      --  SysTick reload value register
      LOAD  : aliased LOAD_Register;
      --  SysTick current value register
      VAL   : aliased VAL_Register;
      --  SysTick calibration value register
      CALIB : aliased CALIB_Register;
   end record
     with Volatile;

   for STK_Peripheral use record
      CTRL  at 16#0# range 0 .. 31;
      LOAD  at 16#4# range 0 .. 31;
      VAL   at 16#8# range 0 .. 31;
      CALIB at 16#C# range 0 .. 31;
   end record;

   --  SysTick timer
   STK_Periph : aliased STK_Peripheral
     with Import, Address => System'To_Address (16#E000E010#);

end STM32_SVD.STK;
