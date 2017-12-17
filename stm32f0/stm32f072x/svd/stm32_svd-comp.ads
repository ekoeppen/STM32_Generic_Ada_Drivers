--  This spec has been automatically generated from STM32F072x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.COMP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CSR_COMP1EN_Field is STM32_SVD.Bit;
   subtype CSR_COMP1_INP_DAC_Field is STM32_SVD.Bit;
   subtype CSR_COMP1MODE_Field is STM32_SVD.UInt2;
   subtype CSR_COMP1INSEL_Field is STM32_SVD.UInt3;
   subtype CSR_COMP1OUTSEL_Field is STM32_SVD.UInt3;
   subtype CSR_COMP1POL_Field is STM32_SVD.Bit;
   subtype CSR_COMP1HYST_Field is STM32_SVD.UInt2;
   subtype CSR_COMP1OUT_Field is STM32_SVD.Bit;
   subtype CSR_COMP1LOCK_Field is STM32_SVD.Bit;
   subtype CSR_COMP2EN_Field is STM32_SVD.Bit;
   subtype CSR_COMP2MODE_Field is STM32_SVD.UInt2;
   subtype CSR_COMP2INSEL_Field is STM32_SVD.UInt3;
   subtype CSR_WNDWEN_Field is STM32_SVD.Bit;
   subtype CSR_COMP2OUTSEL_Field is STM32_SVD.UInt3;
   subtype CSR_COMP2POL_Field is STM32_SVD.Bit;
   subtype CSR_COMP2HYST_Field is STM32_SVD.UInt2;
   subtype CSR_COMP2OUT_Field is STM32_SVD.Bit;
   subtype CSR_COMP2LOCK_Field is STM32_SVD.Bit;

   --  control and status register
   type CSR_Register is record
      --  Comparator 1 enable
      COMP1EN        : CSR_COMP1EN_Field := 16#0#;
      --  COMP1_INP_DAC
      COMP1_INP_DAC  : CSR_COMP1_INP_DAC_Field := 16#0#;
      --  Comparator 1 mode
      COMP1MODE      : CSR_COMP1MODE_Field := 16#0#;
      --  Comparator 1 inverting input selection
      COMP1INSEL     : CSR_COMP1INSEL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit := 16#0#;
      --  Comparator 1 output selection
      COMP1OUTSEL    : CSR_COMP1OUTSEL_Field := 16#0#;
      --  Comparator 1 output polarity
      COMP1POL       : CSR_COMP1POL_Field := 16#0#;
      --  Comparator 1 hysteresis
      COMP1HYST      : CSR_COMP1HYST_Field := 16#0#;
      --  Read-only. Comparator 1 output
      COMP1OUT       : CSR_COMP1OUT_Field := 16#0#;
      --  Comparator 1 lock
      COMP1LOCK      : CSR_COMP1LOCK_Field := 16#0#;
      --  Comparator 2 enable
      COMP2EN        : CSR_COMP2EN_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : STM32_SVD.Bit := 16#0#;
      --  Comparator 2 mode
      COMP2MODE      : CSR_COMP2MODE_Field := 16#0#;
      --  Comparator 2 inverting input selection
      COMP2INSEL     : CSR_COMP2INSEL_Field := 16#0#;
      --  Window mode enable
      WNDWEN         : CSR_WNDWEN_Field := 16#0#;
      --  Comparator 2 output selection
      COMP2OUTSEL    : CSR_COMP2OUTSEL_Field := 16#0#;
      --  Comparator 2 output polarity
      COMP2POL       : CSR_COMP2POL_Field := 16#0#;
      --  Comparator 2 hysteresis
      COMP2HYST      : CSR_COMP2HYST_Field := 16#0#;
      --  Read-only. Comparator 2 output
      COMP2OUT       : CSR_COMP2OUT_Field := 16#0#;
      --  Comparator 2 lock
      COMP2LOCK      : CSR_COMP2LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      COMP1EN        at 0 range 0 .. 0;
      COMP1_INP_DAC  at 0 range 1 .. 1;
      COMP1MODE      at 0 range 2 .. 3;
      COMP1INSEL     at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      COMP1OUTSEL    at 0 range 8 .. 10;
      COMP1POL       at 0 range 11 .. 11;
      COMP1HYST      at 0 range 12 .. 13;
      COMP1OUT       at 0 range 14 .. 14;
      COMP1LOCK      at 0 range 15 .. 15;
      COMP2EN        at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      COMP2MODE      at 0 range 18 .. 19;
      COMP2INSEL     at 0 range 20 .. 22;
      WNDWEN         at 0 range 23 .. 23;
      COMP2OUTSEL    at 0 range 24 .. 26;
      COMP2POL       at 0 range 27 .. 27;
      COMP2HYST      at 0 range 28 .. 29;
      COMP2OUT       at 0 range 30 .. 30;
      COMP2LOCK      at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Comparator
   type COMP_Peripheral is record
      --  control and status register
      CSR : aliased CSR_Register;
   end record
     with Volatile;

   for COMP_Peripheral use record
      CSR at 0 range 0 .. 31;
   end record;

   --  Comparator
   COMP_Periph : aliased COMP_Peripheral
     with Import, Address => System'To_Address (16#4001001C#);

end STM32_SVD.COMP;
