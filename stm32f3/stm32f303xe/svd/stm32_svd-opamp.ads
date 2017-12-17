--  This spec has been automatically generated from STM32F303xE.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.OPAMP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype OPAMP1_CR_OPAMP1_EN_Field is STM32_SVD.Bit;
   subtype OPAMP1_CR_FORCE_VP_Field is STM32_SVD.Bit;
   subtype OPAMP1_CR_VP_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP1_CR_VM_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP1_CR_TCM_EN_Field is STM32_SVD.Bit;
   subtype OPAMP1_CR_VMS_SEL_Field is STM32_SVD.Bit;
   subtype OPAMP1_CR_VPS_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP1_CR_CALON_Field is STM32_SVD.Bit;
   subtype OPAMP1_CR_CALSEL_Field is STM32_SVD.UInt2;
   subtype OPAMP1_CR_PGA_GAIN_Field is STM32_SVD.UInt4;
   subtype OPAMP1_CR_USER_TRIM_Field is STM32_SVD.Bit;
   subtype OPAMP1_CR_TRIMOFFSETP_Field is STM32_SVD.UInt5;
   subtype OPAMP1_CR_TRIMOFFSETN_Field is STM32_SVD.UInt5;
   subtype OPAMP1_CR_TSTREF_Field is STM32_SVD.Bit;
   subtype OPAMP1_CR_OUTCAL_Field is STM32_SVD.Bit;
   subtype OPAMP1_CR_LOCK_Field is STM32_SVD.Bit;

   --  OPAMP1 control register
   type OPAMP1_CR_Register is record
      --  OPAMP1 enable
      OPAMP1_EN    : OPAMP1_CR_OPAMP1_EN_Field := 16#0#;
      --  FORCE_VP
      FORCE_VP     : OPAMP1_CR_FORCE_VP_Field := 16#0#;
      --  OPAMP1 Non inverting input selection
      VP_SEL       : OPAMP1_CR_VP_SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_4 : STM32_SVD.Bit := 16#0#;
      --  OPAMP1 inverting input selection
      VM_SEL       : OPAMP1_CR_VM_SEL_Field := 16#0#;
      --  Timer controlled Mux mode enable
      TCM_EN       : OPAMP1_CR_TCM_EN_Field := 16#0#;
      --  OPAMP1 inverting input secondary selection
      VMS_SEL      : OPAMP1_CR_VMS_SEL_Field := 16#0#;
      --  OPAMP1 Non inverting input secondary selection
      VPS_SEL      : OPAMP1_CR_VPS_SEL_Field := 16#0#;
      --  Calibration mode enable
      CALON        : OPAMP1_CR_CALON_Field := 16#0#;
      --  Calibration selection
      CALSEL       : OPAMP1_CR_CALSEL_Field := 16#0#;
      --  Gain in PGA mode
      PGA_GAIN     : OPAMP1_CR_PGA_GAIN_Field := 16#0#;
      --  User trimming enable
      USER_TRIM    : OPAMP1_CR_USER_TRIM_Field := 16#0#;
      --  Offset trimming value (PMOS)
      TRIMOFFSETP  : OPAMP1_CR_TRIMOFFSETP_Field := 16#0#;
      --  Offset trimming value (NMOS)
      TRIMOFFSETN  : OPAMP1_CR_TRIMOFFSETN_Field := 16#0#;
      --  TSTREF
      TSTREF       : OPAMP1_CR_TSTREF_Field := 16#0#;
      --  Read-only. OPAMP 1 ouput status flag
      OUTCAL       : OPAMP1_CR_OUTCAL_Field := 16#0#;
      --  OPAMP 1 lock
      LOCK         : OPAMP1_CR_LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPAMP1_CR_Register use record
      OPAMP1_EN    at 0 range 0 .. 0;
      FORCE_VP     at 0 range 1 .. 1;
      VP_SEL       at 0 range 2 .. 3;
      Reserved_4_4 at 0 range 4 .. 4;
      VM_SEL       at 0 range 5 .. 6;
      TCM_EN       at 0 range 7 .. 7;
      VMS_SEL      at 0 range 8 .. 8;
      VPS_SEL      at 0 range 9 .. 10;
      CALON        at 0 range 11 .. 11;
      CALSEL       at 0 range 12 .. 13;
      PGA_GAIN     at 0 range 14 .. 17;
      USER_TRIM    at 0 range 18 .. 18;
      TRIMOFFSETP  at 0 range 19 .. 23;
      TRIMOFFSETN  at 0 range 24 .. 28;
      TSTREF       at 0 range 29 .. 29;
      OUTCAL       at 0 range 30 .. 30;
      LOCK         at 0 range 31 .. 31;
   end record;

   subtype OPAMP2_CR_OPAMP2EN_Field is STM32_SVD.Bit;
   subtype OPAMP2_CR_FORCE_VP_Field is STM32_SVD.Bit;
   subtype OPAMP2_CR_VP_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP2_CR_VM_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP2_CR_TCM_EN_Field is STM32_SVD.Bit;
   subtype OPAMP2_CR_VMS_SEL_Field is STM32_SVD.Bit;
   subtype OPAMP2_CR_VPS_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP2_CR_CALON_Field is STM32_SVD.Bit;
   subtype OPAMP2_CR_CAL_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP2_CR_PGA_GAIN_Field is STM32_SVD.UInt4;
   subtype OPAMP2_CR_USER_TRIM_Field is STM32_SVD.Bit;
   subtype OPAMP2_CR_TRIMOFFSETP_Field is STM32_SVD.UInt5;
   subtype OPAMP2_CR_TRIMOFFSETN_Field is STM32_SVD.UInt5;
   subtype OPAMP2_CR_TSTREF_Field is STM32_SVD.Bit;
   subtype OPAMP2_CR_OUTCAL_Field is STM32_SVD.Bit;
   subtype OPAMP2_CR_LOCK_Field is STM32_SVD.Bit;

   --  OPAMP2 control register
   type OPAMP2_CR_Register is record
      --  OPAMP2 enable
      OPAMP2EN     : OPAMP2_CR_OPAMP2EN_Field := 16#0#;
      --  FORCE_VP
      FORCE_VP     : OPAMP2_CR_FORCE_VP_Field := 16#0#;
      --  OPAMP2 Non inverting input selection
      VP_SEL       : OPAMP2_CR_VP_SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_4 : STM32_SVD.Bit := 16#0#;
      --  OPAMP2 inverting input selection
      VM_SEL       : OPAMP2_CR_VM_SEL_Field := 16#0#;
      --  Timer controlled Mux mode enable
      TCM_EN       : OPAMP2_CR_TCM_EN_Field := 16#0#;
      --  OPAMP2 inverting input secondary selection
      VMS_SEL      : OPAMP2_CR_VMS_SEL_Field := 16#0#;
      --  OPAMP2 Non inverting input secondary selection
      VPS_SEL      : OPAMP2_CR_VPS_SEL_Field := 16#0#;
      --  Calibration mode enable
      CALON        : OPAMP2_CR_CALON_Field := 16#0#;
      --  Calibration selection
      CAL_SEL      : OPAMP2_CR_CAL_SEL_Field := 16#0#;
      --  Gain in PGA mode
      PGA_GAIN     : OPAMP2_CR_PGA_GAIN_Field := 16#0#;
      --  User trimming enable
      USER_TRIM    : OPAMP2_CR_USER_TRIM_Field := 16#0#;
      --  Offset trimming value (PMOS)
      TRIMOFFSETP  : OPAMP2_CR_TRIMOFFSETP_Field := 16#0#;
      --  Offset trimming value (NMOS)
      TRIMOFFSETN  : OPAMP2_CR_TRIMOFFSETN_Field := 16#0#;
      --  TSTREF
      TSTREF       : OPAMP2_CR_TSTREF_Field := 16#0#;
      --  Read-only. OPAMP 2 ouput status flag
      OUTCAL       : OPAMP2_CR_OUTCAL_Field := 16#0#;
      --  OPAMP 2 lock
      LOCK         : OPAMP2_CR_LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPAMP2_CR_Register use record
      OPAMP2EN     at 0 range 0 .. 0;
      FORCE_VP     at 0 range 1 .. 1;
      VP_SEL       at 0 range 2 .. 3;
      Reserved_4_4 at 0 range 4 .. 4;
      VM_SEL       at 0 range 5 .. 6;
      TCM_EN       at 0 range 7 .. 7;
      VMS_SEL      at 0 range 8 .. 8;
      VPS_SEL      at 0 range 9 .. 10;
      CALON        at 0 range 11 .. 11;
      CAL_SEL      at 0 range 12 .. 13;
      PGA_GAIN     at 0 range 14 .. 17;
      USER_TRIM    at 0 range 18 .. 18;
      TRIMOFFSETP  at 0 range 19 .. 23;
      TRIMOFFSETN  at 0 range 24 .. 28;
      TSTREF       at 0 range 29 .. 29;
      OUTCAL       at 0 range 30 .. 30;
      LOCK         at 0 range 31 .. 31;
   end record;

   subtype OPAMP3_CR_OPAMP3EN_Field is STM32_SVD.Bit;
   subtype OPAMP3_CR_FORCE_VP_Field is STM32_SVD.Bit;
   subtype OPAMP3_CR_VP_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP3_CR_VM_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP3_CR_TCM_EN_Field is STM32_SVD.Bit;
   subtype OPAMP3_CR_VMS_SEL_Field is STM32_SVD.Bit;
   subtype OPAMP3_CR_VPS_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP3_CR_CALON_Field is STM32_SVD.Bit;
   subtype OPAMP3_CR_CALSEL_Field is STM32_SVD.UInt2;
   subtype OPAMP3_CR_PGA_GAIN_Field is STM32_SVD.UInt4;
   subtype OPAMP3_CR_USER_TRIM_Field is STM32_SVD.Bit;
   subtype OPAMP3_CR_TRIMOFFSETP_Field is STM32_SVD.UInt5;
   subtype OPAMP3_CR_TRIMOFFSETN_Field is STM32_SVD.UInt5;
   subtype OPAMP3_CR_TSTREF_Field is STM32_SVD.Bit;
   subtype OPAMP3_CR_OUTCAL_Field is STM32_SVD.Bit;
   subtype OPAMP3_CR_LOCK_Field is STM32_SVD.Bit;

   --  OPAMP3 control register
   type OPAMP3_CR_Register is record
      --  OPAMP3 enable
      OPAMP3EN     : OPAMP3_CR_OPAMP3EN_Field := 16#0#;
      --  FORCE_VP
      FORCE_VP     : OPAMP3_CR_FORCE_VP_Field := 16#0#;
      --  OPAMP3 Non inverting input selection
      VP_SEL       : OPAMP3_CR_VP_SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_4 : STM32_SVD.Bit := 16#0#;
      --  OPAMP3 inverting input selection
      VM_SEL       : OPAMP3_CR_VM_SEL_Field := 16#0#;
      --  Timer controlled Mux mode enable
      TCM_EN       : OPAMP3_CR_TCM_EN_Field := 16#0#;
      --  OPAMP3 inverting input secondary selection
      VMS_SEL      : OPAMP3_CR_VMS_SEL_Field := 16#0#;
      --  OPAMP3 Non inverting input secondary selection
      VPS_SEL      : OPAMP3_CR_VPS_SEL_Field := 16#0#;
      --  Calibration mode enable
      CALON        : OPAMP3_CR_CALON_Field := 16#0#;
      --  Calibration selection
      CALSEL       : OPAMP3_CR_CALSEL_Field := 16#0#;
      --  Gain in PGA mode
      PGA_GAIN     : OPAMP3_CR_PGA_GAIN_Field := 16#0#;
      --  User trimming enable
      USER_TRIM    : OPAMP3_CR_USER_TRIM_Field := 16#0#;
      --  Offset trimming value (PMOS)
      TRIMOFFSETP  : OPAMP3_CR_TRIMOFFSETP_Field := 16#0#;
      --  Offset trimming value (NMOS)
      TRIMOFFSETN  : OPAMP3_CR_TRIMOFFSETN_Field := 16#0#;
      --  TSTREF
      TSTREF       : OPAMP3_CR_TSTREF_Field := 16#0#;
      --  Read-only. OPAMP 3 ouput status flag
      OUTCAL       : OPAMP3_CR_OUTCAL_Field := 16#0#;
      --  OPAMP 3 lock
      LOCK         : OPAMP3_CR_LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPAMP3_CR_Register use record
      OPAMP3EN     at 0 range 0 .. 0;
      FORCE_VP     at 0 range 1 .. 1;
      VP_SEL       at 0 range 2 .. 3;
      Reserved_4_4 at 0 range 4 .. 4;
      VM_SEL       at 0 range 5 .. 6;
      TCM_EN       at 0 range 7 .. 7;
      VMS_SEL      at 0 range 8 .. 8;
      VPS_SEL      at 0 range 9 .. 10;
      CALON        at 0 range 11 .. 11;
      CALSEL       at 0 range 12 .. 13;
      PGA_GAIN     at 0 range 14 .. 17;
      USER_TRIM    at 0 range 18 .. 18;
      TRIMOFFSETP  at 0 range 19 .. 23;
      TRIMOFFSETN  at 0 range 24 .. 28;
      TSTREF       at 0 range 29 .. 29;
      OUTCAL       at 0 range 30 .. 30;
      LOCK         at 0 range 31 .. 31;
   end record;

   subtype OPAMP4_CR_OPAMP4EN_Field is STM32_SVD.Bit;
   subtype OPAMP4_CR_FORCE_VP_Field is STM32_SVD.Bit;
   subtype OPAMP4_CR_VP_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP4_CR_VM_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP4_CR_TCM_EN_Field is STM32_SVD.Bit;
   subtype OPAMP4_CR_VMS_SEL_Field is STM32_SVD.Bit;
   subtype OPAMP4_CR_VPS_SEL_Field is STM32_SVD.UInt2;
   subtype OPAMP4_CR_CALON_Field is STM32_SVD.Bit;
   subtype OPAMP4_CR_CALSEL_Field is STM32_SVD.UInt2;
   subtype OPAMP4_CR_PGA_GAIN_Field is STM32_SVD.UInt4;
   subtype OPAMP4_CR_USER_TRIM_Field is STM32_SVD.Bit;
   subtype OPAMP4_CR_TRIMOFFSETP_Field is STM32_SVD.UInt5;
   subtype OPAMP4_CR_TRIMOFFSETN_Field is STM32_SVD.UInt5;
   subtype OPAMP4_CR_TSTREF_Field is STM32_SVD.Bit;
   subtype OPAMP4_CR_OUTCAL_Field is STM32_SVD.Bit;
   subtype OPAMP4_CR_LOCK_Field is STM32_SVD.Bit;

   --  OPAMP4 control register
   type OPAMP4_CR_Register is record
      --  OPAMP4 enable
      OPAMP4EN     : OPAMP4_CR_OPAMP4EN_Field := 16#0#;
      --  FORCE_VP
      FORCE_VP     : OPAMP4_CR_FORCE_VP_Field := 16#0#;
      --  OPAMP4 Non inverting input selection
      VP_SEL       : OPAMP4_CR_VP_SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_4 : STM32_SVD.Bit := 16#0#;
      --  OPAMP4 inverting input selection
      VM_SEL       : OPAMP4_CR_VM_SEL_Field := 16#0#;
      --  Timer controlled Mux mode enable
      TCM_EN       : OPAMP4_CR_TCM_EN_Field := 16#0#;
      --  OPAMP4 inverting input secondary selection
      VMS_SEL      : OPAMP4_CR_VMS_SEL_Field := 16#0#;
      --  OPAMP4 Non inverting input secondary selection
      VPS_SEL      : OPAMP4_CR_VPS_SEL_Field := 16#0#;
      --  Calibration mode enable
      CALON        : OPAMP4_CR_CALON_Field := 16#0#;
      --  Calibration selection
      CALSEL       : OPAMP4_CR_CALSEL_Field := 16#0#;
      --  Gain in PGA mode
      PGA_GAIN     : OPAMP4_CR_PGA_GAIN_Field := 16#0#;
      --  User trimming enable
      USER_TRIM    : OPAMP4_CR_USER_TRIM_Field := 16#0#;
      --  Offset trimming value (PMOS)
      TRIMOFFSETP  : OPAMP4_CR_TRIMOFFSETP_Field := 16#0#;
      --  Offset trimming value (NMOS)
      TRIMOFFSETN  : OPAMP4_CR_TRIMOFFSETN_Field := 16#0#;
      --  TSTREF
      TSTREF       : OPAMP4_CR_TSTREF_Field := 16#0#;
      --  Read-only. OPAMP 4 ouput status flag
      OUTCAL       : OPAMP4_CR_OUTCAL_Field := 16#0#;
      --  OPAMP 4 lock
      LOCK         : OPAMP4_CR_LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPAMP4_CR_Register use record
      OPAMP4EN     at 0 range 0 .. 0;
      FORCE_VP     at 0 range 1 .. 1;
      VP_SEL       at 0 range 2 .. 3;
      Reserved_4_4 at 0 range 4 .. 4;
      VM_SEL       at 0 range 5 .. 6;
      TCM_EN       at 0 range 7 .. 7;
      VMS_SEL      at 0 range 8 .. 8;
      VPS_SEL      at 0 range 9 .. 10;
      CALON        at 0 range 11 .. 11;
      CALSEL       at 0 range 12 .. 13;
      PGA_GAIN     at 0 range 14 .. 17;
      USER_TRIM    at 0 range 18 .. 18;
      TRIMOFFSETP  at 0 range 19 .. 23;
      TRIMOFFSETN  at 0 range 24 .. 28;
      TSTREF       at 0 range 29 .. 29;
      OUTCAL       at 0 range 30 .. 30;
      LOCK         at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Operational amplifier
   type OPAMP_Peripheral is record
      --  OPAMP1 control register
      OPAMP1_CR : aliased OPAMP1_CR_Register;
      --  OPAMP2 control register
      OPAMP2_CR : aliased OPAMP2_CR_Register;
      --  OPAMP3 control register
      OPAMP3_CR : aliased OPAMP3_CR_Register;
      --  OPAMP4 control register
      OPAMP4_CR : aliased OPAMP4_CR_Register;
   end record
     with Volatile;

   for OPAMP_Peripheral use record
      OPAMP1_CR at 16#0# range 0 .. 31;
      OPAMP2_CR at 16#4# range 0 .. 31;
      OPAMP3_CR at 16#8# range 0 .. 31;
      OPAMP4_CR at 16#C# range 0 .. 31;
   end record;

   --  Operational amplifier
   OPAMP_Periph : aliased OPAMP_Peripheral
     with Import, Address => System'To_Address (16#40010038#);

end STM32_SVD.OPAMP;
