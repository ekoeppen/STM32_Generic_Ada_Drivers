--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.PWR is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  power control register
   type CR_Register is record
      --  Low-power deep sleep
      LPDS           : STM32_SVD.Bit;
      --  Power down deepsleep
      PDDS           : STM32_SVD.Bit;
      --  Clear wakeup flag
      CWUF           : STM32_SVD.Bit;
      --  Clear standby flag
      CSBF           : STM32_SVD.Bit;
      --  Power voltage detector enable
      PVDE           : STM32_SVD.Bit;
      --  PVD level selection
      PLS            : STM32_SVD.UInt3;
      --  Disable backup domain write protection
      DBP            : STM32_SVD.Bit;
      --  Ultra-low-power mode
      ULP            : STM32_SVD.Bit;
      --  Fast wakeup
      FWU            : STM32_SVD.Bit;
      --  Voltage scaling range selection
      VOS            : STM32_SVD.UInt2;
      --  Deep sleep mode with Flash memory kept off
      DS_EE_KOFF     : STM32_SVD.Bit;
      --  Low power run mode
      LPRUN          : STM32_SVD.Bit;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      LPDS           at 0 range 0 .. 0;
      PDDS           at 0 range 1 .. 1;
      CWUF           at 0 range 2 .. 2;
      CSBF           at 0 range 3 .. 3;
      PVDE           at 0 range 4 .. 4;
      PLS            at 0 range 5 .. 7;
      DBP            at 0 range 8 .. 8;
      ULP            at 0 range 9 .. 9;
      FWU            at 0 range 10 .. 10;
      VOS            at 0 range 11 .. 12;
      DS_EE_KOFF     at 0 range 13 .. 13;
      LPRUN          at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  power control/status register
   type CSR_Register is record
      --  Read-only. Wakeup flag
      WUF            : STM32_SVD.Bit;
      --  Read-only. Standby flag
      SBF            : STM32_SVD.Bit;
      --  Read-only. PVD output
      PVDO           : STM32_SVD.Bit;
      --  Read-only. Backup regulator ready
      BRR            : STM32_SVD.Bit;
      --  Read-only. Voltage Scaling select flag
      VOSF           : STM32_SVD.Bit;
      --  Read-only. Regulator LP flag
      REGLPF         : STM32_SVD.Bit;
      --  unspecified
      Reserved_6_7   : STM32_SVD.UInt2;
      --  Enable WKUP pin
      EWUP           : STM32_SVD.Bit;
      --  Backup regulator enable
      BRE            : STM32_SVD.Bit;
      --  unspecified
      Reserved_10_31 : STM32_SVD.UInt22;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      WUF            at 0 range 0 .. 0;
      SBF            at 0 range 1 .. 1;
      PVDO           at 0 range 2 .. 2;
      BRR            at 0 range 3 .. 3;
      VOSF           at 0 range 4 .. 4;
      REGLPF         at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      EWUP           at 0 range 8 .. 8;
      BRE            at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Power control
   type PWR_Peripheral is record
      --  power control register
      CR  : aliased CR_Register;
      --  power control/status register
      CSR : aliased CSR_Register;
   end record
     with Volatile;

   for PWR_Peripheral use record
      CR  at 16#0# range 0 .. 31;
      CSR at 16#4# range 0 .. 31;
   end record;

   --  Power control
   PWR_Periph : aliased PWR_Peripheral
     with Import, Address => PWR_Base;

end STM32_SVD.PWR;
