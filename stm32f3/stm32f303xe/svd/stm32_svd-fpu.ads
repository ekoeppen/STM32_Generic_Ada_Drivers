--  This spec has been automatically generated from STM32F303xE.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.FPU is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CPACR_CP0_Field is STM32_SVD.Bit;
   subtype CPACR_CP1_Field is STM32_SVD.Bit;
   subtype CPACR_CP2_Field is STM32_SVD.Bit;
   subtype CPACR_CP3_Field is STM32_SVD.Bit;
   subtype CPACR_CP4_Field is STM32_SVD.Bit;
   subtype CPACR_CP5_Field is STM32_SVD.Bit;
   subtype CPACR_CP6_Field is STM32_SVD.UInt2;
   subtype CPACR_CP7_Field is STM32_SVD.Bit;
   subtype CPACR_CP10_Field is STM32_SVD.Bit;
   subtype CPACR_CP11_Field is STM32_SVD.Bit;

   --  Coprocessor Access Control Register
   type CPACR_Register is record
      --  Access privileges for coprocessor 0
      CP0            : CPACR_CP0_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Access privileges for coprocessor 1
      CP1            : CPACR_CP1_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : STM32_SVD.Bit := 16#0#;
      --  Access privileges for coprocessor 2
      CP2            : CPACR_CP2_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : STM32_SVD.Bit := 16#0#;
      --  Access privileges for coprocessor 3
      CP3            : CPACR_CP3_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit := 16#0#;
      --  Access privileges for coprocessor 4
      CP4            : CPACR_CP4_Field := 16#0#;
      --  unspecified
      Reserved_9_9   : STM32_SVD.Bit := 16#0#;
      --  Access privileges for coprocessor 5
      CP5            : CPACR_CP5_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : STM32_SVD.Bit := 16#0#;
      --  Access privileges for coprocessor 6
      CP6            : CPACR_CP6_Field := 16#0#;
      --  Access privileges for coprocessor 7
      CP7            : CPACR_CP7_Field := 16#0#;
      --  unspecified
      Reserved_15_19 : STM32_SVD.UInt5 := 16#0#;
      --  Access privileges for coprocessor 10
      CP10           : CPACR_CP10_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : STM32_SVD.Bit := 16#0#;
      --  Access privileges for coprocessor 11
      CP11           : CPACR_CP11_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CPACR_Register use record
      CP0            at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CP1            at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      CP2            at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      CP3            at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      CP4            at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      CP5            at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      CP6            at 0 range 12 .. 13;
      CP7            at 0 range 14 .. 14;
      Reserved_15_19 at 0 range 15 .. 19;
      CP10           at 0 range 20 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      CP11           at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype FPCCR_LSPACT_Field is STM32_SVD.Bit;
   subtype FPCCR_USER_Field is STM32_SVD.Bit;
   subtype FPCCR_THREAD_Field is STM32_SVD.Bit;
   subtype FPCCR_HFRDY_Field is STM32_SVD.Bit;
   subtype FPCCR_MMRDY_Field is STM32_SVD.Bit;
   subtype FPCCR_BFRDY_Field is STM32_SVD.Bit;
   subtype FPCCR_MONRDY_Field is STM32_SVD.Bit;
   subtype FPCCR_LSPEN_Field is STM32_SVD.Bit;
   subtype FPCCR_ASPEN_Field is STM32_SVD.Bit;

   --  FP Context Control Register
   type FPCCR_Register is record
      --  LSPACT
      LSPACT        : FPCCR_LSPACT_Field := 16#0#;
      --  USER
      USER          : FPCCR_USER_Field := 16#0#;
      --  unspecified
      Reserved_2_2  : STM32_SVD.Bit := 16#0#;
      --  THREAD
      THREAD        : FPCCR_THREAD_Field := 16#0#;
      --  HFRDY
      HFRDY         : FPCCR_HFRDY_Field := 16#0#;
      --  MMRDY
      MMRDY         : FPCCR_MMRDY_Field := 16#0#;
      --  BFRDY
      BFRDY         : FPCCR_BFRDY_Field := 16#0#;
      --  unspecified
      Reserved_7_7  : STM32_SVD.Bit := 16#0#;
      --  MONRDY
      MONRDY        : FPCCR_MONRDY_Field := 16#0#;
      --  unspecified
      Reserved_9_29 : STM32_SVD.UInt21 := 16#0#;
      --  LSPEN
      LSPEN         : FPCCR_LSPEN_Field := 16#1#;
      --  ASPEN
      ASPEN         : FPCCR_ASPEN_Field := 16#1#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPCCR_Register use record
      LSPACT        at 0 range 0 .. 0;
      USER          at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      THREAD        at 0 range 3 .. 3;
      HFRDY         at 0 range 4 .. 4;
      MMRDY         at 0 range 5 .. 5;
      BFRDY         at 0 range 6 .. 6;
      Reserved_7_7  at 0 range 7 .. 7;
      MONRDY        at 0 range 8 .. 8;
      Reserved_9_29 at 0 range 9 .. 29;
      LSPEN         at 0 range 30 .. 30;
      ASPEN         at 0 range 31 .. 31;
   end record;

   subtype FPCAR_ADDRESS_Field is STM32_SVD.UInt29;

   --  FP Context Address Register
   type FPCAR_Register is record
      --  unspecified
      Reserved_0_2 : STM32_SVD.UInt3 := 16#0#;
      --  ADDRESS
      ADDRESS      : FPCAR_ADDRESS_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPCAR_Register use record
      Reserved_0_2 at 0 range 0 .. 2;
      ADDRESS      at 0 range 3 .. 31;
   end record;

   subtype FPDSCR_RMode_Field is STM32_SVD.UInt2;
   subtype FPDSCR_FZ_Field is STM32_SVD.Bit;
   subtype FPDSCR_DN_Field is STM32_SVD.Bit;
   subtype FPDSCR_AHP_Field is STM32_SVD.Bit;

   --  FP Default Status Control Register
   type FPDSCR_Register is record
      --  unspecified
      Reserved_0_21  : STM32_SVD.UInt22 := 16#0#;
      --  RMode
      RMode          : FPDSCR_RMode_Field := 16#0#;
      --  FZ
      FZ             : FPDSCR_FZ_Field := 16#0#;
      --  DN
      DN             : FPDSCR_DN_Field := 16#0#;
      --  AHP
      AHP            : FPDSCR_AHP_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : STM32_SVD.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPDSCR_Register use record
      Reserved_0_21  at 0 range 0 .. 21;
      RMode          at 0 range 22 .. 23;
      FZ             at 0 range 24 .. 24;
      DN             at 0 range 25 .. 25;
      AHP            at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype MVFR0_A_SIMD_Field is STM32_SVD.UInt4;
   subtype MVFR0_Single_precision_Field is STM32_SVD.UInt4;
   subtype MVFR0_Double_precision_Field is STM32_SVD.UInt4;
   subtype MVFR0_FP_exception_trapping_Field is STM32_SVD.UInt4;
   subtype MVFR0_Divide_Field is STM32_SVD.UInt4;
   subtype MVFR0_Square_root_Field is STM32_SVD.UInt4;
   subtype MVFR0_Short_vectors_Field is STM32_SVD.UInt4;
   subtype MVFR0_FP_rounding_modes_Field is STM32_SVD.UInt4;

   --  Media and VFP Feature Register 0
   type MVFR0_Register is record
      --  Read-only. A_SIMD registers
      A_SIMD                : MVFR0_A_SIMD_Field;
      --  Read-only. Single_precision
      Single_precision      : MVFR0_Single_precision_Field;
      --  Read-only. Double_precision
      Double_precision      : MVFR0_Double_precision_Field;
      --  Read-only. FP exception trapping
      FP_exception_trapping : MVFR0_FP_exception_trapping_Field;
      --  Read-only. Divide
      Divide                : MVFR0_Divide_Field;
      --  Read-only. Square root
      Square_root           : MVFR0_Square_root_Field;
      --  Read-only. Short vectors
      Short_vectors         : MVFR0_Short_vectors_Field;
      --  Read-only. FP rounding modes
      FP_rounding_modes     : MVFR0_FP_rounding_modes_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MVFR0_Register use record
      A_SIMD                at 0 range 0 .. 3;
      Single_precision      at 0 range 4 .. 7;
      Double_precision      at 0 range 8 .. 11;
      FP_exception_trapping at 0 range 12 .. 15;
      Divide                at 0 range 16 .. 19;
      Square_root           at 0 range 20 .. 23;
      Short_vectors         at 0 range 24 .. 27;
      FP_rounding_modes     at 0 range 28 .. 31;
   end record;

   subtype MVFR1_FtZ_mode_Field is STM32_SVD.UInt4;
   subtype MVFR1_D_NaN_mode_Field is STM32_SVD.UInt4;
   subtype MVFR1_FP_HPFP_Field is STM32_SVD.UInt4;
   subtype MVFR1_FP_fused_MAC_Field is STM32_SVD.UInt4;

   --  Media and VFP Feature Register 1
   type MVFR1_Register is record
      --  Read-only. FtZ mode
      FtZ_mode      : MVFR1_FtZ_mode_Field;
      --  Read-only. D_NaN mode
      D_NaN_mode    : MVFR1_D_NaN_mode_Field;
      --  unspecified
      Reserved_8_23 : STM32_SVD.UInt16;
      --  Read-only. FP HPFP
      FP_HPFP       : MVFR1_FP_HPFP_Field;
      --  Read-only. FP fused MAC
      FP_fused_MAC  : MVFR1_FP_fused_MAC_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MVFR1_Register use record
      FtZ_mode      at 0 range 0 .. 3;
      D_NaN_mode    at 0 range 4 .. 7;
      Reserved_8_23 at 0 range 8 .. 23;
      FP_HPFP       at 0 range 24 .. 27;
      FP_fused_MAC  at 0 range 28 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Floting point unit
   type FPU_Peripheral is record
      --  Coprocessor Access Control Register
      CPACR  : aliased CPACR_Register;
      --  FP Context Control Register
      FPCCR  : aliased FPCCR_Register;
      --  FP Context Address Register
      FPCAR  : aliased FPCAR_Register;
      --  FP Default Status Control Register
      FPDSCR : aliased FPDSCR_Register;
      --  Media and VFP Feature Register 0
      MVFR0  : aliased MVFR0_Register;
      --  Media and VFP Feature Register 1
      MVFR1  : aliased MVFR1_Register;
   end record
     with Volatile;

   for FPU_Peripheral use record
      CPACR  at 16#0# range 0 .. 31;
      FPCCR  at 16#1AC# range 0 .. 31;
      FPCAR  at 16#1B0# range 0 .. 31;
      FPDSCR at 16#1B4# range 0 .. 31;
      MVFR0  at 16#1B8# range 0 .. 31;
      MVFR1  at 16#1BC# range 0 .. 31;
   end record;

   --  Floting point unit
   FPU_Periph : aliased FPU_Peripheral
     with Import, Address => System'To_Address (16#E000ED88#);

end STM32_SVD.FPU;
