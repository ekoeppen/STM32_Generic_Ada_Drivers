--  This spec has been automatically generated from STM32F303xE.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.COMP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype COMP1_CSR_COMP1EN_Field is STM32_SVD.Bit;
   subtype COMP1_CSR_COMP1_INP_DAC_Field is STM32_SVD.Bit;
   subtype COMP1_CSR_COMP1MODE_Field is STM32_SVD.UInt2;
   subtype COMP1_CSR_COMP1INSEL_Field is STM32_SVD.UInt3;
   subtype COMP1_CSR_COMP1_OUT_SEL_Field is STM32_SVD.UInt4;
   subtype COMP1_CSR_COMP1POL_Field is STM32_SVD.Bit;
   subtype COMP1_CSR_COMP1HYST_Field is STM32_SVD.UInt2;
   subtype COMP1_CSR_COMP1_BLANKING_Field is STM32_SVD.UInt3;
   subtype COMP1_CSR_COMP1OUT_Field is STM32_SVD.Bit;
   subtype COMP1_CSR_COMP1LOCK_Field is STM32_SVD.Bit;

   --  control and status register
   type COMP1_CSR_Register is record
      --  Comparator 1 enable
      COMP1EN        : COMP1_CSR_COMP1EN_Field := 16#0#;
      --  COMP1_INP_DAC
      COMP1_INP_DAC  : COMP1_CSR_COMP1_INP_DAC_Field := 16#0#;
      --  Comparator 1 mode
      COMP1MODE      : COMP1_CSR_COMP1MODE_Field := 16#0#;
      --  Comparator 1 inverting input selection
      COMP1INSEL     : COMP1_CSR_COMP1INSEL_Field := 16#0#;
      --  unspecified
      Reserved_7_9   : STM32_SVD.UInt3 := 16#0#;
      --  Comparator 1 output selection
      COMP1_OUT_SEL  : COMP1_CSR_COMP1_OUT_SEL_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Comparator 1 output polarity
      COMP1POL       : COMP1_CSR_COMP1POL_Field := 16#0#;
      --  Comparator 1 hysteresis
      COMP1HYST      : COMP1_CSR_COMP1HYST_Field := 16#0#;
      --  Comparator 1 blanking source
      COMP1_BLANKING : COMP1_CSR_COMP1_BLANKING_Field := 16#0#;
      --  unspecified
      Reserved_21_29 : STM32_SVD.UInt9 := 16#0#;
      --  Read-only. Comparator 1 output
      COMP1OUT       : COMP1_CSR_COMP1OUT_Field := 16#0#;
      --  Comparator 1 lock
      COMP1LOCK      : COMP1_CSR_COMP1LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP1_CSR_Register use record
      COMP1EN        at 0 range 0 .. 0;
      COMP1_INP_DAC  at 0 range 1 .. 1;
      COMP1MODE      at 0 range 2 .. 3;
      COMP1INSEL     at 0 range 4 .. 6;
      Reserved_7_9   at 0 range 7 .. 9;
      COMP1_OUT_SEL  at 0 range 10 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      COMP1POL       at 0 range 15 .. 15;
      COMP1HYST      at 0 range 16 .. 17;
      COMP1_BLANKING at 0 range 18 .. 20;
      Reserved_21_29 at 0 range 21 .. 29;
      COMP1OUT       at 0 range 30 .. 30;
      COMP1LOCK      at 0 range 31 .. 31;
   end record;

   subtype COMP2_CSR_COMP2EN_Field is STM32_SVD.Bit;
   subtype COMP2_CSR_COMP2MODE_Field is STM32_SVD.UInt2;
   subtype COMP2_CSR_COMP2INSEL_Field is STM32_SVD.UInt3;
   subtype COMP2_CSR_COMP2INPSEL_Field is STM32_SVD.Bit;
   subtype COMP2_CSR_COMP2INMSEL_Field is STM32_SVD.Bit;
   subtype COMP2_CSR_COMP2_OUT_SEL_Field is STM32_SVD.UInt4;
   subtype COMP2_CSR_COMP2POL_Field is STM32_SVD.Bit;
   subtype COMP2_CSR_COMP2HYST_Field is STM32_SVD.UInt2;
   subtype COMP2_CSR_COMP2_BLANKING_Field is STM32_SVD.UInt3;
   subtype COMP2_CSR_COMP2LOCK_Field is STM32_SVD.Bit;

   --  control and status register
   type COMP2_CSR_Register is record
      --  Comparator 2 enable
      COMP2EN        : COMP2_CSR_COMP2EN_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Comparator 2 mode
      COMP2MODE      : COMP2_CSR_COMP2MODE_Field := 16#0#;
      --  Comparator 2 inverting input selection
      COMP2INSEL     : COMP2_CSR_COMP2INSEL_Field := 16#0#;
      --  Comparator 2 non inverted input selection
      COMP2INPSEL    : COMP2_CSR_COMP2INPSEL_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : STM32_SVD.Bit := 16#0#;
      --  Comparator 1inverting input selection
      COMP2INMSEL    : COMP2_CSR_COMP2INMSEL_Field := 16#0#;
      --  Comparator 2 output selection
      COMP2_OUT_SEL  : COMP2_CSR_COMP2_OUT_SEL_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Comparator 2 output polarity
      COMP2POL       : COMP2_CSR_COMP2POL_Field := 16#0#;
      --  Comparator 2 hysteresis
      COMP2HYST      : COMP2_CSR_COMP2HYST_Field := 16#0#;
      --  Comparator 2 blanking source
      COMP2_BLANKING : COMP2_CSR_COMP2_BLANKING_Field := 16#0#;
      --  unspecified
      Reserved_21_30 : STM32_SVD.UInt10 := 16#0#;
      --  Comparator 2 lock
      COMP2LOCK      : COMP2_CSR_COMP2LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP2_CSR_Register use record
      COMP2EN        at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      COMP2MODE      at 0 range 2 .. 3;
      COMP2INSEL     at 0 range 4 .. 6;
      COMP2INPSEL    at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      COMP2INMSEL    at 0 range 9 .. 9;
      COMP2_OUT_SEL  at 0 range 10 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      COMP2POL       at 0 range 15 .. 15;
      COMP2HYST      at 0 range 16 .. 17;
      COMP2_BLANKING at 0 range 18 .. 20;
      Reserved_21_30 at 0 range 21 .. 30;
      COMP2LOCK      at 0 range 31 .. 31;
   end record;

   subtype COMP3_CSR_COMP3EN_Field is STM32_SVD.Bit;
   subtype COMP3_CSR_COMP3MODE_Field is STM32_SVD.UInt2;
   subtype COMP3_CSR_COMP3INSEL_Field is STM32_SVD.UInt3;
   subtype COMP3_CSR_COMP3INPSEL_Field is STM32_SVD.Bit;
   subtype COMP3_CSR_COMP3_OUT_SEL_Field is STM32_SVD.UInt4;
   subtype COMP3_CSR_COMP3POL_Field is STM32_SVD.Bit;
   subtype COMP3_CSR_COMP3HYST_Field is STM32_SVD.UInt2;
   subtype COMP3_CSR_COMP3_BLANKING_Field is STM32_SVD.UInt3;
   subtype COMP3_CSR_COMP3OUT_Field is STM32_SVD.Bit;
   subtype COMP3_CSR_COMP3LOCK_Field is STM32_SVD.Bit;

   --  control and status register
   type COMP3_CSR_Register is record
      --  Comparator 3 enable
      COMP3EN        : COMP3_CSR_COMP3EN_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Comparator 3 mode
      COMP3MODE      : COMP3_CSR_COMP3MODE_Field := 16#0#;
      --  Comparator 3 inverting input selection
      COMP3INSEL     : COMP3_CSR_COMP3INSEL_Field := 16#0#;
      --  Comparator 3 non inverted input selection
      COMP3INPSEL    : COMP3_CSR_COMP3INPSEL_Field := 16#0#;
      --  unspecified
      Reserved_8_9   : STM32_SVD.UInt2 := 16#0#;
      --  Comparator 3 output selection
      COMP3_OUT_SEL  : COMP3_CSR_COMP3_OUT_SEL_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Comparator 3 output polarity
      COMP3POL       : COMP3_CSR_COMP3POL_Field := 16#0#;
      --  Comparator 3 hysteresis
      COMP3HYST      : COMP3_CSR_COMP3HYST_Field := 16#0#;
      --  Comparator 3 blanking source
      COMP3_BLANKING : COMP3_CSR_COMP3_BLANKING_Field := 16#0#;
      --  unspecified
      Reserved_21_29 : STM32_SVD.UInt9 := 16#0#;
      --  Read-only. Comparator 3 output
      COMP3OUT       : COMP3_CSR_COMP3OUT_Field := 16#0#;
      --  Comparator 3 lock
      COMP3LOCK      : COMP3_CSR_COMP3LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP3_CSR_Register use record
      COMP3EN        at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      COMP3MODE      at 0 range 2 .. 3;
      COMP3INSEL     at 0 range 4 .. 6;
      COMP3INPSEL    at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      COMP3_OUT_SEL  at 0 range 10 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      COMP3POL       at 0 range 15 .. 15;
      COMP3HYST      at 0 range 16 .. 17;
      COMP3_BLANKING at 0 range 18 .. 20;
      Reserved_21_29 at 0 range 21 .. 29;
      COMP3OUT       at 0 range 30 .. 30;
      COMP3LOCK      at 0 range 31 .. 31;
   end record;

   subtype COMP4_CSR_COMP4EN_Field is STM32_SVD.Bit;
   subtype COMP4_CSR_COMP4MODE_Field is STM32_SVD.UInt2;
   subtype COMP4_CSR_COMP4INSEL_Field is STM32_SVD.UInt3;
   subtype COMP4_CSR_COMP4INPSEL_Field is STM32_SVD.Bit;
   subtype COMP4_CSR_COM4WINMODE_Field is STM32_SVD.Bit;
   subtype COMP4_CSR_COMP4_OUT_SEL_Field is STM32_SVD.UInt4;
   subtype COMP4_CSR_COMP4POL_Field is STM32_SVD.Bit;
   subtype COMP4_CSR_COMP4HYST_Field is STM32_SVD.UInt2;
   subtype COMP4_CSR_COMP4_BLANKING_Field is STM32_SVD.UInt3;
   subtype COMP4_CSR_COMP4OUT_Field is STM32_SVD.Bit;
   subtype COMP4_CSR_COMP4LOCK_Field is STM32_SVD.Bit;

   --  control and status register
   type COMP4_CSR_Register is record
      --  Comparator 4 enable
      COMP4EN        : COMP4_CSR_COMP4EN_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Comparator 4 mode
      COMP4MODE      : COMP4_CSR_COMP4MODE_Field := 16#0#;
      --  Comparator 4 inverting input selection
      COMP4INSEL     : COMP4_CSR_COMP4INSEL_Field := 16#0#;
      --  Comparator 4 non inverted input selection
      COMP4INPSEL    : COMP4_CSR_COMP4INPSEL_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : STM32_SVD.Bit := 16#0#;
      --  Comparator 4 window mode
      COM4WINMODE    : COMP4_CSR_COM4WINMODE_Field := 16#0#;
      --  Comparator 4 output selection
      COMP4_OUT_SEL  : COMP4_CSR_COMP4_OUT_SEL_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Comparator 4 output polarity
      COMP4POL       : COMP4_CSR_COMP4POL_Field := 16#0#;
      --  Comparator 4 hysteresis
      COMP4HYST      : COMP4_CSR_COMP4HYST_Field := 16#0#;
      --  Comparator 4 blanking source
      COMP4_BLANKING : COMP4_CSR_COMP4_BLANKING_Field := 16#0#;
      --  unspecified
      Reserved_21_29 : STM32_SVD.UInt9 := 16#0#;
      --  Read-only. Comparator 4 output
      COMP4OUT       : COMP4_CSR_COMP4OUT_Field := 16#0#;
      --  Comparator 4 lock
      COMP4LOCK      : COMP4_CSR_COMP4LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP4_CSR_Register use record
      COMP4EN        at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      COMP4MODE      at 0 range 2 .. 3;
      COMP4INSEL     at 0 range 4 .. 6;
      COMP4INPSEL    at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      COM4WINMODE    at 0 range 9 .. 9;
      COMP4_OUT_SEL  at 0 range 10 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      COMP4POL       at 0 range 15 .. 15;
      COMP4HYST      at 0 range 16 .. 17;
      COMP4_BLANKING at 0 range 18 .. 20;
      Reserved_21_29 at 0 range 21 .. 29;
      COMP4OUT       at 0 range 30 .. 30;
      COMP4LOCK      at 0 range 31 .. 31;
   end record;

   subtype COMP5_CSR_COMP5EN_Field is STM32_SVD.Bit;
   subtype COMP5_CSR_COMP5MODE_Field is STM32_SVD.UInt2;
   subtype COMP5_CSR_COMP5INSEL_Field is STM32_SVD.UInt3;
   subtype COMP5_CSR_COMP5INPSEL_Field is STM32_SVD.Bit;
   subtype COMP5_CSR_COMP5_OUT_SEL_Field is STM32_SVD.UInt4;
   subtype COMP5_CSR_COMP5POL_Field is STM32_SVD.Bit;
   subtype COMP5_CSR_COMP5HYST_Field is STM32_SVD.UInt2;
   subtype COMP5_CSR_COMP5_BLANKING_Field is STM32_SVD.UInt3;
   subtype COMP5_CSR_COMP5OUT_Field is STM32_SVD.Bit;
   subtype COMP5_CSR_COMP5LOCK_Field is STM32_SVD.Bit;

   --  control and status register
   type COMP5_CSR_Register is record
      --  Comparator 5 enable
      COMP5EN        : COMP5_CSR_COMP5EN_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Comparator 5 mode
      COMP5MODE      : COMP5_CSR_COMP5MODE_Field := 16#0#;
      --  Comparator 5 inverting input selection
      COMP5INSEL     : COMP5_CSR_COMP5INSEL_Field := 16#0#;
      --  Comparator 5 non inverted input selection
      COMP5INPSEL    : COMP5_CSR_COMP5INPSEL_Field := 16#0#;
      --  unspecified
      Reserved_8_9   : STM32_SVD.UInt2 := 16#0#;
      --  Comparator 5 output selection
      COMP5_OUT_SEL  : COMP5_CSR_COMP5_OUT_SEL_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Comparator 5 output polarity
      COMP5POL       : COMP5_CSR_COMP5POL_Field := 16#0#;
      --  Comparator 5 hysteresis
      COMP5HYST      : COMP5_CSR_COMP5HYST_Field := 16#0#;
      --  Comparator 5 blanking source
      COMP5_BLANKING : COMP5_CSR_COMP5_BLANKING_Field := 16#0#;
      --  unspecified
      Reserved_21_29 : STM32_SVD.UInt9 := 16#0#;
      --  Read-only. Comparator51 output
      COMP5OUT       : COMP5_CSR_COMP5OUT_Field := 16#0#;
      --  Comparator 5 lock
      COMP5LOCK      : COMP5_CSR_COMP5LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP5_CSR_Register use record
      COMP5EN        at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      COMP5MODE      at 0 range 2 .. 3;
      COMP5INSEL     at 0 range 4 .. 6;
      COMP5INPSEL    at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      COMP5_OUT_SEL  at 0 range 10 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      COMP5POL       at 0 range 15 .. 15;
      COMP5HYST      at 0 range 16 .. 17;
      COMP5_BLANKING at 0 range 18 .. 20;
      Reserved_21_29 at 0 range 21 .. 29;
      COMP5OUT       at 0 range 30 .. 30;
      COMP5LOCK      at 0 range 31 .. 31;
   end record;

   subtype COMP6_CSR_COMP6EN_Field is STM32_SVD.Bit;
   subtype COMP6_CSR_COMP6MODE_Field is STM32_SVD.UInt2;
   subtype COMP6_CSR_COMP6INSEL_Field is STM32_SVD.UInt3;
   subtype COMP6_CSR_COMP6INPSEL_Field is STM32_SVD.Bit;
   subtype COMP6_CSR_COM6WINMODE_Field is STM32_SVD.Bit;
   subtype COMP6_CSR_COMP6_OUT_SEL_Field is STM32_SVD.UInt4;
   subtype COMP6_CSR_COMP6POL_Field is STM32_SVD.Bit;
   subtype COMP6_CSR_COMP6HYST_Field is STM32_SVD.UInt2;
   subtype COMP6_CSR_COMP6_BLANKING_Field is STM32_SVD.UInt3;
   subtype COMP6_CSR_COMP6OUT_Field is STM32_SVD.Bit;
   subtype COMP6_CSR_COMP6LOCK_Field is STM32_SVD.Bit;

   --  control and status register
   type COMP6_CSR_Register is record
      --  Comparator 6 enable
      COMP6EN        : COMP6_CSR_COMP6EN_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Comparator 6 mode
      COMP6MODE      : COMP6_CSR_COMP6MODE_Field := 16#0#;
      --  Comparator 6 inverting input selection
      COMP6INSEL     : COMP6_CSR_COMP6INSEL_Field := 16#0#;
      --  Comparator 6 non inverted input selection
      COMP6INPSEL    : COMP6_CSR_COMP6INPSEL_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : STM32_SVD.Bit := 16#0#;
      --  Comparator 6 window mode
      COM6WINMODE    : COMP6_CSR_COM6WINMODE_Field := 16#0#;
      --  Comparator 6 output selection
      COMP6_OUT_SEL  : COMP6_CSR_COMP6_OUT_SEL_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Comparator 6 output polarity
      COMP6POL       : COMP6_CSR_COMP6POL_Field := 16#0#;
      --  Comparator 6 hysteresis
      COMP6HYST      : COMP6_CSR_COMP6HYST_Field := 16#0#;
      --  Comparator 6 blanking source
      COMP6_BLANKING : COMP6_CSR_COMP6_BLANKING_Field := 16#0#;
      --  unspecified
      Reserved_21_29 : STM32_SVD.UInt9 := 16#0#;
      --  Read-only. Comparator 6 output
      COMP6OUT       : COMP6_CSR_COMP6OUT_Field := 16#0#;
      --  Comparator 6 lock
      COMP6LOCK      : COMP6_CSR_COMP6LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP6_CSR_Register use record
      COMP6EN        at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      COMP6MODE      at 0 range 2 .. 3;
      COMP6INSEL     at 0 range 4 .. 6;
      COMP6INPSEL    at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      COM6WINMODE    at 0 range 9 .. 9;
      COMP6_OUT_SEL  at 0 range 10 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      COMP6POL       at 0 range 15 .. 15;
      COMP6HYST      at 0 range 16 .. 17;
      COMP6_BLANKING at 0 range 18 .. 20;
      Reserved_21_29 at 0 range 21 .. 29;
      COMP6OUT       at 0 range 30 .. 30;
      COMP6LOCK      at 0 range 31 .. 31;
   end record;

   subtype COMP7_CSR_COMP7EN_Field is STM32_SVD.Bit;
   subtype COMP7_CSR_COMP7MODE_Field is STM32_SVD.UInt2;
   subtype COMP7_CSR_COMP7INSEL_Field is STM32_SVD.UInt3;
   subtype COMP7_CSR_COMP7INPSEL_Field is STM32_SVD.Bit;
   subtype COMP7_CSR_COMP7_OUT_SEL_Field is STM32_SVD.UInt4;
   subtype COMP7_CSR_COMP7POL_Field is STM32_SVD.Bit;
   subtype COMP7_CSR_COMP7HYST_Field is STM32_SVD.UInt2;
   subtype COMP7_CSR_COMP7_BLANKING_Field is STM32_SVD.UInt3;
   subtype COMP7_CSR_COMP7OUT_Field is STM32_SVD.Bit;
   subtype COMP7_CSR_COMP7LOCK_Field is STM32_SVD.Bit;

   --  control and status register
   type COMP7_CSR_Register is record
      --  Comparator 7 enable
      COMP7EN        : COMP7_CSR_COMP7EN_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Comparator 7 mode
      COMP7MODE      : COMP7_CSR_COMP7MODE_Field := 16#0#;
      --  Comparator 7 inverting input selection
      COMP7INSEL     : COMP7_CSR_COMP7INSEL_Field := 16#0#;
      --  Comparator 7 non inverted input selection
      COMP7INPSEL    : COMP7_CSR_COMP7INPSEL_Field := 16#0#;
      --  unspecified
      Reserved_8_9   : STM32_SVD.UInt2 := 16#0#;
      --  Comparator 7 output selection
      COMP7_OUT_SEL  : COMP7_CSR_COMP7_OUT_SEL_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Comparator 7 output polarity
      COMP7POL       : COMP7_CSR_COMP7POL_Field := 16#0#;
      --  Comparator 7 hysteresis
      COMP7HYST      : COMP7_CSR_COMP7HYST_Field := 16#0#;
      --  Comparator 7 blanking source
      COMP7_BLANKING : COMP7_CSR_COMP7_BLANKING_Field := 16#0#;
      --  unspecified
      Reserved_21_29 : STM32_SVD.UInt9 := 16#0#;
      --  Read-only. Comparator 7 output
      COMP7OUT       : COMP7_CSR_COMP7OUT_Field := 16#0#;
      --  Comparator 7 lock
      COMP7LOCK      : COMP7_CSR_COMP7LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP7_CSR_Register use record
      COMP7EN        at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      COMP7MODE      at 0 range 2 .. 3;
      COMP7INSEL     at 0 range 4 .. 6;
      COMP7INPSEL    at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      COMP7_OUT_SEL  at 0 range 10 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      COMP7POL       at 0 range 15 .. 15;
      COMP7HYST      at 0 range 16 .. 17;
      COMP7_BLANKING at 0 range 18 .. 20;
      Reserved_21_29 at 0 range 21 .. 29;
      COMP7OUT       at 0 range 30 .. 30;
      COMP7LOCK      at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Comparator
   type COMP_Peripheral is record
      --  control and status register
      COMP1_CSR : aliased COMP1_CSR_Register;
      --  control and status register
      COMP2_CSR : aliased COMP2_CSR_Register;
      --  control and status register
      COMP3_CSR : aliased COMP3_CSR_Register;
      --  control and status register
      COMP4_CSR : aliased COMP4_CSR_Register;
      --  control and status register
      COMP5_CSR : aliased COMP5_CSR_Register;
      --  control and status register
      COMP6_CSR : aliased COMP6_CSR_Register;
      --  control and status register
      COMP7_CSR : aliased COMP7_CSR_Register;
   end record
     with Volatile;

   for COMP_Peripheral use record
      COMP1_CSR at 16#0# range 0 .. 31;
      COMP2_CSR at 16#4# range 0 .. 31;
      COMP3_CSR at 16#8# range 0 .. 31;
      COMP4_CSR at 16#C# range 0 .. 31;
      COMP5_CSR at 16#10# range 0 .. 31;
      COMP6_CSR at 16#14# range 0 .. 31;
      COMP7_CSR at 16#18# range 0 .. 31;
   end record;

   --  Comparator
   COMP_Periph : aliased COMP_Peripheral
     with Import, Address => System'To_Address (16#4001001C#);

end STM32_SVD.COMP;
