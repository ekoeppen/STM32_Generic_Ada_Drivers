--  This spec has been automatically generated from STM32F103.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.SCB is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CPUID_Revision_Field is STM32_SVD.UInt4;
   subtype CPUID_PartNo_Field is STM32_SVD.UInt12;
   subtype CPUID_Constant_Field is STM32_SVD.UInt4;
   subtype CPUID_Variant_Field is STM32_SVD.UInt4;
   subtype CPUID_Implementer_Field is STM32_SVD.Byte;

   --  CPUID base register
   type CPUID_Register is record
      --  Read-only. Revision number
      Revision    : CPUID_Revision_Field;
      --  Read-only. Part number of the processor
      PartNo      : CPUID_PartNo_Field;
      --  Read-only. Reads as 0xF
      Constant_k  : CPUID_Constant_Field;
      --  Read-only. Variant number
      Variant     : CPUID_Variant_Field;
      --  Read-only. Implementer code
      Implementer : CPUID_Implementer_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CPUID_Register use record
      Revision    at 0 range 0 .. 3;
      PartNo      at 0 range 4 .. 15;
      Constant_k  at 0 range 16 .. 19;
      Variant     at 0 range 20 .. 23;
      Implementer at 0 range 24 .. 31;
   end record;

   subtype ICSR_VECTACTIVE_Field is STM32_SVD.UInt9;
   subtype ICSR_VECTPENDING_Field is STM32_SVD.UInt7;
   subtype ICSR_ISRPENDING_Field is STM32_SVD.Bit;
   subtype ICSR_PENDSTCLR_Field is STM32_SVD.Bit;
   subtype ICSR_PENDSTSET_Field is STM32_SVD.Bit;
   subtype ICSR_PENDSVCLR_Field is STM32_SVD.Bit;
   subtype ICSR_PENDSVSET_Field is STM32_SVD.Bit;
   subtype ICSR_NMIPENDSET_Field is STM32_SVD.Bit;

   --  Interrupt control and state register
   type ICSR_Register is record
      --  Active vector
      VECTACTIVE     : ICSR_VECTACTIVE_Field := 16#0#;
      --  unspecified
      Reserved_9_10  : STM32_SVD.UInt2 := 16#0#;
      --  Pending vector
      VECTPENDING    : ICSR_VECTPENDING_Field := 16#0#;
      --  unspecified
      Reserved_19_21 : STM32_SVD.UInt3 := 16#0#;
      --  Interrupt pending flag
      ISRPENDING     : ICSR_ISRPENDING_Field := 16#0#;
      --  unspecified
      Reserved_23_24 : STM32_SVD.UInt2 := 16#0#;
      --  SysTick exception clear-pending bit
      PENDSTCLR      : ICSR_PENDSTCLR_Field := 16#0#;
      --  SysTick exception set-pending bit
      PENDSTSET      : ICSR_PENDSTSET_Field := 16#0#;
      --  PendSV clear-pending bit
      PENDSVCLR      : ICSR_PENDSVCLR_Field := 16#0#;
      --  PendSV set-pending bit
      PENDSVSET      : ICSR_PENDSVSET_Field := 16#0#;
      --  unspecified
      Reserved_29_30 : STM32_SVD.UInt2 := 16#0#;
      --  NMI set-pending bit.
      NMIPENDSET     : ICSR_NMIPENDSET_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICSR_Register use record
      VECTACTIVE     at 0 range 0 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      VECTPENDING    at 0 range 12 .. 18;
      Reserved_19_21 at 0 range 19 .. 21;
      ISRPENDING     at 0 range 22 .. 22;
      Reserved_23_24 at 0 range 23 .. 24;
      PENDSTCLR      at 0 range 25 .. 25;
      PENDSTSET      at 0 range 26 .. 26;
      PENDSVCLR      at 0 range 27 .. 27;
      PENDSVSET      at 0 range 28 .. 28;
      Reserved_29_30 at 0 range 29 .. 30;
      NMIPENDSET     at 0 range 31 .. 31;
   end record;

   subtype AIRCR_VECTRESET_Field is STM32_SVD.Bit;
   subtype AIRCR_VECTCLRACTIVE_Field is STM32_SVD.Bit;
   subtype AIRCR_SYSRESETREQ_Field is STM32_SVD.Bit;
   subtype AIRCR_PRIGROUP_Field is STM32_SVD.UInt3;
   subtype AIRCR_ENDIANESS_Field is STM32_SVD.Bit;
   subtype AIRCR_VECTKEYSTAT_Field is STM32_SVD.UInt16;

   --  Application interrupt and reset control register
   type AIRCR_Register is record
      --  VECTCLRACTIVE
      VECTCLRACTIVE  : AIRCR_VECTCLRACTIVE_Field := 16#0#;
      --  SYSRESETREQ
      SYSRESETREQ    : AIRCR_SYSRESETREQ_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : STM32_SVD.UInt5 := 16#0#;
      --  unspecified
      Reserved_11_14 : STM32_SVD.UInt4 := 16#0#;
      --  ENDIANESS
      ENDIANESS      : AIRCR_ENDIANESS_Field := 16#0#;
      --  Register key
      VECTKEYSTAT    : AIRCR_VECTKEYSTAT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AIRCR_Register use record
      VECTCLRACTIVE  at 0 range 1 .. 1;
      SYSRESETREQ    at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      Reserved_11_14 at 0 range 11 .. 14;
      ENDIANESS      at 0 range 15 .. 15;
      VECTKEYSTAT    at 0 range 16 .. 31;
   end record;

   subtype SCR_SLEEPONEXIT_Field is STM32_SVD.Bit;
   subtype SCR_SLEEPDEEP_Field is STM32_SVD.Bit;
   subtype SCR_SEVEONPEND_Field is STM32_SVD.Bit;

   --  System control register
   type SCR_Register is record
      --  unspecified
      Reserved_0_0  : STM32_SVD.Bit := 16#0#;
      --  SLEEPONEXIT
      SLEEPONEXIT   : SCR_SLEEPONEXIT_Field := 16#0#;
      --  SLEEPDEEP
      SLEEPDEEP     : SCR_SLEEPDEEP_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : STM32_SVD.Bit := 16#0#;
      --  Send Event on Pending bit
      SEVEONPEND    : SCR_SEVEONPEND_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : STM32_SVD.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      SLEEPONEXIT   at 0 range 1 .. 1;
      SLEEPDEEP     at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      SEVEONPEND    at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype CCR_NONBASETHRDENA_Field is STM32_SVD.Bit;
   subtype CCR_USERSETMPEND_Field is STM32_SVD.Bit;
   subtype CCR_UNALIGN_TRP_Field is STM32_SVD.Bit;
   subtype CCR_DIV_0_TRP_Field is STM32_SVD.Bit;
   subtype CCR_BFHFNMIGN_Field is STM32_SVD.Bit;
   subtype CCR_STKALIGN_Field is STM32_SVD.Bit;

   --  Configuration and control register
   type CCR_Register is record
      --  unspecified
      Reserved_2_2   : STM32_SVD.Bit := 16#0#;
      --  UNALIGN_ TRP
      UNALIGN_TRP    : CCR_UNALIGN_TRP_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : STM32_SVD.UInt3 := 16#0#;
      --  STKALIGN
      STKALIGN       : CCR_STKALIGN_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : STM32_SVD.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      Reserved_2_2   at 0 range 2 .. 2;
      UNALIGN_TRP    at 0 range 3 .. 3;
      Reserved_5_7   at 0 range 5 .. 7;
      STKALIGN       at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype SHPR1_PRI_4_Field is STM32_SVD.Byte;
   subtype SHPR1_PRI_5_Field is STM32_SVD.Byte;
   subtype SHPR1_PRI_6_Field is STM32_SVD.Byte;

   --  System handler priority registers
   type SHPR1_Register is record
      --  Priority of system handler 4
      PRI_4          : SHPR1_PRI_4_Field := 16#0#;
      --  Priority of system handler 5
      PRI_5          : SHPR1_PRI_5_Field := 16#0#;
      --  Priority of system handler 6
      PRI_6          : SHPR1_PRI_6_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR1_Register use record
      PRI_4          at 0 range 0 .. 7;
      PRI_5          at 0 range 8 .. 15;
      PRI_6          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SHPR2_PRI_11_Field is STM32_SVD.Byte;

   --  System handler priority registers
   type SHPR2_Register is record
      --  unspecified
      Reserved_0_23 : STM32_SVD.UInt24 := 16#0#;
      --  Priority of system handler 11
      PRI_11        : SHPR2_PRI_11_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR2_Register use record
      Reserved_0_23 at 0 range 0 .. 23;
      PRI_11        at 0 range 24 .. 31;
   end record;

   subtype SHPR3_PRI_14_Field is STM32_SVD.Byte;
   subtype SHPR3_PRI_15_Field is STM32_SVD.Byte;

   --  System handler priority registers
   type SHPR3_Register is record
      --  unspecified
      Reserved_0_15 : STM32_SVD.UInt16 := 16#0#;
      --  Priority of system handler 14
      PRI_14        : SHPR3_PRI_14_Field := 16#0#;
      --  Priority of system handler 15
      PRI_15        : SHPR3_PRI_15_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR3_Register use record
      Reserved_0_15 at 0 range 0 .. 15;
      PRI_14        at 0 range 16 .. 23;
      PRI_15        at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System control block
   type SCB_Peripheral is record
      --  CPUID base register
      CPUID                : aliased CPUID_Register;
      --  Interrupt control and state register
      ICSR                 : aliased ICSR_Register;
      --  Vector table offset register
      AIRCR                : aliased AIRCR_Register;
      --  System control register
      SCR                  : aliased SCR_Register;
      --  Configuration and control register
      CCR                  : aliased CCR_Register;
      --  System handler priority registers
      SHPR1                : aliased SHPR1_Register;
      --  System handler priority registers
      SHPR2                : aliased SHPR2_Register;
      --  System handler priority registers
      SHPR3                : aliased SHPR3_Register;
   end record
     with Volatile;

   for SCB_Peripheral use record
      CPUID                at 16#0# range 0 .. 31;
      ICSR                 at 16#4# range 0 .. 31;
      AIRCR                at 16#C# range 0 .. 31;
      SCR                  at 16#10# range 0 .. 31;
      CCR                  at 16#14# range 0 .. 31;
      SHPR1                at 16#18# range 0 .. 31;
      SHPR2                at 16#1C# range 0 .. 31;
      SHPR3                at 16#20# range 0 .. 31;
   end record;

   --  System control block
   SCB_Periph : aliased SCB_Peripheral
     with Import, Address => System'To_Address (16#E000ED00#);

end STM32_SVD.SCB;
