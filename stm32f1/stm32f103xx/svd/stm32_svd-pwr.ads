--  This spec has been automatically generated from STM32F103xx.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.PWR is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_LPDS_Field is STM32_SVD.Bit;
   subtype CR_PDDS_Field is STM32_SVD.Bit;
   subtype CR_CWUF_Field is STM32_SVD.Bit;
   subtype CR_CSBF_Field is STM32_SVD.Bit;
   subtype CR_PVDE_Field is STM32_SVD.Bit;
   subtype CR_PLS_Field is STM32_SVD.UInt3;
   subtype CR_DBP_Field is STM32_SVD.Bit;

   --  Power control register (PWR_CR)
   type CR_Register is record
      --  Low Power Deep Sleep
      LPDS          : CR_LPDS_Field := 16#0#;
      --  Power Down Deep Sleep
      PDDS          : CR_PDDS_Field := 16#0#;
      --  Clear Wake-up Flag
      CWUF          : CR_CWUF_Field := 16#0#;
      --  Clear STANDBY Flag
      CSBF          : CR_CSBF_Field := 16#0#;
      --  Power Voltage Detector Enable
      PVDE          : CR_PVDE_Field := 16#0#;
      --  PVD Level Selection
      PLS           : CR_PLS_Field := 16#0#;
      --  Disable Backup Domain write protection
      DBP           : CR_DBP_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      LPDS          at 0 range 0 .. 0;
      PDDS          at 0 range 1 .. 1;
      CWUF          at 0 range 2 .. 2;
      CSBF          at 0 range 3 .. 3;
      PVDE          at 0 range 4 .. 4;
      PLS           at 0 range 5 .. 7;
      DBP           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype CSR_WUF_Field is STM32_SVD.Bit;
   subtype CSR_SBF_Field is STM32_SVD.Bit;
   subtype CSR_PVDO_Field is STM32_SVD.Bit;
   subtype CSR_EWUP_Field is STM32_SVD.Bit;

   --  Power control register (PWR_CR)
   type CSR_Register is record
      --  Read-only. Wake-Up Flag
      WUF           : CSR_WUF_Field := 16#0#;
      --  Read-only. STANDBY Flag
      SBF           : CSR_SBF_Field := 16#0#;
      --  Read-only. PVD Output
      PVDO          : CSR_PVDO_Field := 16#0#;
      --  unspecified
      Reserved_3_7  : STM32_SVD.UInt5 := 16#0#;
      --  Enable WKUP pin
      EWUP          : CSR_EWUP_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      WUF           at 0 range 0 .. 0;
      SBF           at 0 range 1 .. 1;
      PVDO          at 0 range 2 .. 2;
      Reserved_3_7  at 0 range 3 .. 7;
      EWUP          at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Power control
   type PWR_Peripheral is record
      --  Power control register (PWR_CR)
      CR  : aliased CR_Register;
      --  Power control register (PWR_CR)
      CSR : aliased CSR_Register;
   end record
     with Volatile;

   for PWR_Peripheral use record
      CR  at 16#0# range 0 .. 31;
      CSR at 16#4# range 0 .. 31;
   end record;

   --  Power control
   PWR_Periph : aliased PWR_Peripheral
     with Import, Address => System'To_Address (16#40007000#);

end STM32_SVD.PWR;
