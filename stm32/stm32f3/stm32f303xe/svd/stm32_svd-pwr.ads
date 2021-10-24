--  This spec has been automatically generated from STM32F303xE.svd

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

   --  power control register
   type CR_Register is record
      --  Low-power deep sleep
      LPDS          : CR_LPDS_Field := 16#0#;
      --  Power down deepsleep
      PDDS          : CR_PDDS_Field := 16#0#;
      --  Clear wakeup flag
      CWUF          : CR_CWUF_Field := 16#0#;
      --  Clear standby flag
      CSBF          : CR_CSBF_Field := 16#0#;
      --  Power voltage detector enable
      PVDE          : CR_PVDE_Field := 16#0#;
      --  PVD level selection
      PLS           : CR_PLS_Field := 16#0#;
      --  Disable backup domain write protection
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
   --  CSR_EWUP array element
   subtype CSR_EWUP_Element is STM32_SVD.Bit;

   --  CSR_EWUP array
   type CSR_EWUP_Field_Array is array (1 .. 2) of CSR_EWUP_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CSR_EWUP
   type CSR_EWUP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EWUP as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  EWUP as an array
            Arr : CSR_EWUP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CSR_EWUP_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  power control/status register
   type CSR_Register is record
      --  Read-only. Wakeup flag
      WUF            : CSR_WUF_Field := 16#0#;
      --  Read-only. Standby flag
      SBF            : CSR_SBF_Field := 16#0#;
      --  Read-only. PVD output
      PVDO           : CSR_PVDO_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : STM32_SVD.UInt5 := 16#0#;
      --  Enable WKUP1 pin
      EWUP           : CSR_EWUP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_31 : STM32_SVD.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      WUF            at 0 range 0 .. 0;
      SBF            at 0 range 1 .. 1;
      PVDO           at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      EWUP           at 0 range 8 .. 9;
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
     with Import, Address => System'To_Address (16#40007000#);

end STM32_SVD.PWR;
