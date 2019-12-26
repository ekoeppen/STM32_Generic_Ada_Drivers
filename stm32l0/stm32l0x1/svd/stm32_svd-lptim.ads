--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.LPTIM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Interrupt and Status Register
   type ISR_Register is record
      --  Read-only. Compare match
      CMPM          : STM32_SVD.Bit;
      --  Read-only. Autoreload match
      ARRM          : STM32_SVD.Bit;
      --  Read-only. External trigger edge event
      EXTTRIG       : STM32_SVD.Bit;
      --  Read-only. Compare register update OK
      CMPOK         : STM32_SVD.Bit;
      --  Read-only. Autoreload register update OK
      ARROK         : STM32_SVD.Bit;
      --  Read-only. Counter direction change down to up
      UP            : STM32_SVD.Bit;
      --  Read-only. Counter direction change up to down
      DOWN          : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      CMPM          at 0 range 0 .. 0;
      ARRM          at 0 range 1 .. 1;
      EXTTRIG       at 0 range 2 .. 2;
      CMPOK         at 0 range 3 .. 3;
      ARROK         at 0 range 4 .. 4;
      UP            at 0 range 5 .. 5;
      DOWN          at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Interrupt Clear Register
   type ICR_Register is record
      --  Write-only. compare match Clear Flag
      CMPMCF        : STM32_SVD.Bit;
      --  Write-only. Autoreload match Clear Flag
      ARRMCF        : STM32_SVD.Bit;
      --  Write-only. External trigger valid edge Clear Flag
      EXTTRIGCF     : STM32_SVD.Bit;
      --  Write-only. Compare register update OK Clear Flag
      CMPOKCF       : STM32_SVD.Bit;
      --  Write-only. Autoreload register update OK Clear Flag
      ARROKCF       : STM32_SVD.Bit;
      --  Write-only. Direction change to UP Clear Flag
      UPCF          : STM32_SVD.Bit;
      --  Write-only. Direction change to down Clear Flag
      DOWNCF        : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      CMPMCF        at 0 range 0 .. 0;
      ARRMCF        at 0 range 1 .. 1;
      EXTTRIGCF     at 0 range 2 .. 2;
      CMPOKCF       at 0 range 3 .. 3;
      ARROKCF       at 0 range 4 .. 4;
      UPCF          at 0 range 5 .. 5;
      DOWNCF        at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Interrupt Enable Register
   type IER_Register is record
      --  Compare match Interrupt Enable
      CMPMIE        : STM32_SVD.Bit;
      --  Autoreload match Interrupt Enable
      ARRMIE        : STM32_SVD.Bit;
      --  External trigger valid edge Interrupt Enable
      EXTTRIGIE     : STM32_SVD.Bit;
      --  Compare register update OK Interrupt Enable
      CMPOKIE       : STM32_SVD.Bit;
      --  Autoreload register update OK Interrupt Enable
      ARROKIE       : STM32_SVD.Bit;
      --  Direction change to UP Interrupt Enable
      UPIE          : STM32_SVD.Bit;
      --  Direction change to down Interrupt Enable
      DOWNIE        : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IER_Register use record
      CMPMIE        at 0 range 0 .. 0;
      ARRMIE        at 0 range 1 .. 1;
      EXTTRIGIE     at 0 range 2 .. 2;
      CMPOKIE       at 0 range 3 .. 3;
      ARROKIE       at 0 range 4 .. 4;
      UPIE          at 0 range 5 .. 5;
      DOWNIE        at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  Configuration Register
   type CFGR_Register is record
      --  Clock selector
      CKSEL          : STM32_SVD.Bit;
      --  Clock Polarity
      CKPOL          : STM32_SVD.UInt2;
      --  Configurable digital filter for external clock
      CKFLT          : STM32_SVD.UInt2;
      --  unspecified
      Reserved_5_5   : STM32_SVD.Bit;
      --  Configurable digital filter for trigger
      TRGFLT         : STM32_SVD.UInt2;
      --  unspecified
      Reserved_8_8   : STM32_SVD.Bit;
      --  Clock prescaler
      PRESC          : STM32_SVD.UInt3;
      --  unspecified
      Reserved_12_12 : STM32_SVD.Bit;
      --  Trigger selector
      TRIGSEL        : STM32_SVD.UInt3;
      --  unspecified
      Reserved_16_16 : STM32_SVD.Bit;
      --  Trigger enable and polarity
      TRIGEN         : STM32_SVD.UInt2;
      --  Timeout enable
      TIMOUT         : STM32_SVD.Bit;
      --  Waveform shape
      WAVE           : STM32_SVD.Bit;
      --  Waveform shape polarity
      WAVPOL         : STM32_SVD.Bit;
      --  Registers update mode
      PRELOAD        : STM32_SVD.Bit;
      --  counter mode enabled
      COUNTMODE      : STM32_SVD.Bit;
      --  Encoder mode enable
      ENC            : STM32_SVD.Bit;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      CKSEL          at 0 range 0 .. 0;
      CKPOL          at 0 range 1 .. 2;
      CKFLT          at 0 range 3 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TRGFLT         at 0 range 6 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      PRESC          at 0 range 9 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      TRIGSEL        at 0 range 13 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      TRIGEN         at 0 range 17 .. 18;
      TIMOUT         at 0 range 19 .. 19;
      WAVE           at 0 range 20 .. 20;
      WAVPOL         at 0 range 21 .. 21;
      PRELOAD        at 0 range 22 .. 22;
      COUNTMODE      at 0 range 23 .. 23;
      ENC            at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  Control Register
   type CR_Register is record
      --  LPTIM Enable
      ENABLE        : STM32_SVD.Bit;
      --  LPTIM start in single mode
      SNGSTRT       : STM32_SVD.Bit;
      --  Timer start in continuous mode
      CNTSTRT       : STM32_SVD.Bit;
      --  unspecified
      Reserved_3_31 : STM32_SVD.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      ENABLE        at 0 range 0 .. 0;
      SNGSTRT       at 0 range 1 .. 1;
      CNTSTRT       at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Compare Register
   type CMP_Register is record
      --  Compare value.
      CMP            : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMP_Register use record
      CMP            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Autoreload Register
   type ARR_Register is record
      --  Auto reload value.
      ARR            : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARR_Register use record
      ARR            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Counter Register
   type CNT_Register is record
      --  Read-only. Counter value.
      CNT            : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register use record
      CNT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Low power timer
   type LPTIM_Peripheral is record
      --  Interrupt and Status Register
      ISR  : aliased ISR_Register;
      --  Interrupt Clear Register
      ICR  : aliased ICR_Register;
      --  Interrupt Enable Register
      IER  : aliased IER_Register;
      --  Configuration Register
      CFGR : aliased CFGR_Register;
      --  Control Register
      CR   : aliased CR_Register;
      --  Compare Register
      CMP  : aliased CMP_Register;
      --  Autoreload Register
      ARR  : aliased ARR_Register;
      --  Counter Register
      CNT  : aliased CNT_Register;
   end record
     with Volatile;

   for LPTIM_Peripheral use record
      ISR  at 16#0# range 0 .. 31;
      ICR  at 16#4# range 0 .. 31;
      IER  at 16#8# range 0 .. 31;
      CFGR at 16#C# range 0 .. 31;
      CR   at 16#10# range 0 .. 31;
      CMP  at 16#14# range 0 .. 31;
      ARR  at 16#18# range 0 .. 31;
      CNT  at 16#1C# range 0 .. 31;
   end record;

   --  Low power timer
   LPTIM_Periph : aliased LPTIM_Peripheral
     with Import, Address => LPTIM_Base;

end STM32_SVD.LPTIM;
