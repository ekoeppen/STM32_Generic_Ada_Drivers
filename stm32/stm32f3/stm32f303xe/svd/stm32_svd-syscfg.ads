--  This spec has been automatically generated from STM32F303xE.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.SYSCFG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CFGR1_MEM_MODE_Field is STM32_SVD.UInt2;
   subtype CFGR1_USB_IT_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_TIM1_ITR_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_DAC_TRIG_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_ADC24_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_TIM16_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_TIM17_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_TIM6_DAC1_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_TIM7_DAC2_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C_PB6_FM_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C_PB7_FM_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C_PB8_FM_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C_PB9_FM_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C1_FM_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C2_FM_Field is STM32_SVD.Bit;
   subtype CFGR1_ENCODER_MODE_Field is STM32_SVD.UInt2;
   subtype CFGR1_FPU_IT_Field is STM32_SVD.UInt6;

   --  configuration register 1
   type CFGR1_Register is record
      --  Memory mapping selection bits
      MEM_MODE          : CFGR1_MEM_MODE_Field := 16#0#;
      --  unspecified
      Reserved_2_4      : STM32_SVD.UInt3 := 16#0#;
      --  USB interrupt remap
      USB_IT_RMP        : CFGR1_USB_IT_RMP_Field := 16#0#;
      --  Timer 1 ITR3 selection
      TIM1_ITR_RMP      : CFGR1_TIM1_ITR_RMP_Field := 16#0#;
      --  DAC trigger remap (when TSEL = 001)
      DAC_TRIG_RMP      : CFGR1_DAC_TRIG_RMP_Field := 16#0#;
      --  ADC24 DMA remapping bit
      ADC24_DMA_RMP     : CFGR1_ADC24_DMA_RMP_Field := 16#0#;
      --  unspecified
      Reserved_9_10     : STM32_SVD.UInt2 := 16#0#;
      --  TIM16 DMA request remapping bit
      TIM16_DMA_RMP     : CFGR1_TIM16_DMA_RMP_Field := 16#0#;
      --  TIM17 DMA request remapping bit
      TIM17_DMA_RMP     : CFGR1_TIM17_DMA_RMP_Field := 16#0#;
      --  TIM6 and DAC1 DMA request remapping bit
      TIM6_DAC1_DMA_RMP : CFGR1_TIM6_DAC1_DMA_RMP_Field := 16#0#;
      --  TIM7 and DAC2 DMA request remapping bit
      TIM7_DAC2_DMA_RMP : CFGR1_TIM7_DAC2_DMA_RMP_Field := 16#0#;
      --  unspecified
      Reserved_15_15    : STM32_SVD.Bit := 16#0#;
      --  Fast Mode Plus (FM+) driving capability activation bits.
      I2C_PB6_FM        : CFGR1_I2C_PB6_FM_Field := 16#0#;
      --  Fast Mode Plus (FM+) driving capability activation bits.
      I2C_PB7_FM        : CFGR1_I2C_PB7_FM_Field := 16#0#;
      --  Fast Mode Plus (FM+) driving capability activation bits.
      I2C_PB8_FM        : CFGR1_I2C_PB8_FM_Field := 16#0#;
      --  Fast Mode Plus (FM+) driving capability activation bits.
      I2C_PB9_FM        : CFGR1_I2C_PB9_FM_Field := 16#0#;
      --  I2C1 Fast Mode Plus
      I2C1_FM           : CFGR1_I2C1_FM_Field := 16#0#;
      --  I2C2 Fast Mode Plus
      I2C2_FM           : CFGR1_I2C2_FM_Field := 16#0#;
      --  Encoder mode
      ENCODER_MODE      : CFGR1_ENCODER_MODE_Field := 16#0#;
      --  unspecified
      Reserved_24_25    : STM32_SVD.UInt2 := 16#0#;
      --  Interrupt enable bits from FPU
      FPU_IT            : CFGR1_FPU_IT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR1_Register use record
      MEM_MODE          at 0 range 0 .. 1;
      Reserved_2_4      at 0 range 2 .. 4;
      USB_IT_RMP        at 0 range 5 .. 5;
      TIM1_ITR_RMP      at 0 range 6 .. 6;
      DAC_TRIG_RMP      at 0 range 7 .. 7;
      ADC24_DMA_RMP     at 0 range 8 .. 8;
      Reserved_9_10     at 0 range 9 .. 10;
      TIM16_DMA_RMP     at 0 range 11 .. 11;
      TIM17_DMA_RMP     at 0 range 12 .. 12;
      TIM6_DAC1_DMA_RMP at 0 range 13 .. 13;
      TIM7_DAC2_DMA_RMP at 0 range 14 .. 14;
      Reserved_15_15    at 0 range 15 .. 15;
      I2C_PB6_FM        at 0 range 16 .. 16;
      I2C_PB7_FM        at 0 range 17 .. 17;
      I2C_PB8_FM        at 0 range 18 .. 18;
      I2C_PB9_FM        at 0 range 19 .. 19;
      I2C1_FM           at 0 range 20 .. 20;
      I2C2_FM           at 0 range 21 .. 21;
      ENCODER_MODE      at 0 range 22 .. 23;
      Reserved_24_25    at 0 range 24 .. 25;
      FPU_IT            at 0 range 26 .. 31;
   end record;

   subtype RCR_PAGE0_WP_Field is STM32_SVD.Bit;
   subtype RCR_PAGE1_WP_Field is STM32_SVD.Bit;
   subtype RCR_PAGE2_WP_Field is STM32_SVD.Bit;
   subtype RCR_PAGE3_WP_Field is STM32_SVD.Bit;
   subtype RCR_PAGE4_WP_Field is STM32_SVD.Bit;
   subtype RCR_PAGE5_WP_Field is STM32_SVD.Bit;
   subtype RCR_PAGE6_WP_Field is STM32_SVD.Bit;
   subtype RCR_PAGE7_WP_Field is STM32_SVD.Bit;

   --  CCM SRAM protection register
   type RCR_Register is record
      --  CCM SRAM page write protection bit
      PAGE0_WP      : RCR_PAGE0_WP_Field := 16#0#;
      --  CCM SRAM page write protection bit
      PAGE1_WP      : RCR_PAGE1_WP_Field := 16#0#;
      --  CCM SRAM page write protection bit
      PAGE2_WP      : RCR_PAGE2_WP_Field := 16#0#;
      --  CCM SRAM page write protection bit
      PAGE3_WP      : RCR_PAGE3_WP_Field := 16#0#;
      --  CCM SRAM page write protection bit
      PAGE4_WP      : RCR_PAGE4_WP_Field := 16#0#;
      --  CCM SRAM page write protection bit
      PAGE5_WP      : RCR_PAGE5_WP_Field := 16#0#;
      --  CCM SRAM page write protection bit
      PAGE6_WP      : RCR_PAGE6_WP_Field := 16#0#;
      --  CCM SRAM page write protection bit
      PAGE7_WP      : RCR_PAGE7_WP_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RCR_Register use record
      PAGE0_WP      at 0 range 0 .. 0;
      PAGE1_WP      at 0 range 1 .. 1;
      PAGE2_WP      at 0 range 2 .. 2;
      PAGE3_WP      at 0 range 3 .. 3;
      PAGE4_WP      at 0 range 4 .. 4;
      PAGE5_WP      at 0 range 5 .. 5;
      PAGE6_WP      at 0 range 6 .. 6;
      PAGE7_WP      at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  EXTICR1_EXTI array element
   subtype EXTICR1_EXTI_Element is STM32_SVD.UInt4;

   --  EXTICR1_EXTI array
   type EXTICR1_EXTI_Field_Array is array (0 .. 3) of EXTICR1_EXTI_Element
     with Component_Size => 4, Size => 16;

   --  Type definition for EXTICR1_EXTI
   type EXTICR1_EXTI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTI as a value
            Val : STM32_SVD.UInt16;
         when True =>
            --  EXTI as an array
            Arr : EXTICR1_EXTI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EXTICR1_EXTI_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  external interrupt configuration register 1
   type EXTICR1_Register is record
      --  EXTI 0 configuration bits
      EXTI           : EXTICR1_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR1_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EXTICR2_EXTI array element
   subtype EXTICR2_EXTI_Element is STM32_SVD.UInt4;

   --  EXTICR2_EXTI array
   type EXTICR2_EXTI_Field_Array is array (4 .. 7) of EXTICR2_EXTI_Element
     with Component_Size => 4, Size => 16;

   --  Type definition for EXTICR2_EXTI
   type EXTICR2_EXTI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTI as a value
            Val : STM32_SVD.UInt16;
         when True =>
            --  EXTI as an array
            Arr : EXTICR2_EXTI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EXTICR2_EXTI_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  external interrupt configuration register 2
   type EXTICR2_Register is record
      --  EXTI 4 configuration bits
      EXTI           : EXTICR2_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR2_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EXTICR3_EXTI array element
   subtype EXTICR3_EXTI_Element is STM32_SVD.UInt4;

   --  EXTICR3_EXTI array
   type EXTICR3_EXTI_Field_Array is array (8 .. 11) of EXTICR3_EXTI_Element
     with Component_Size => 4, Size => 16;

   --  Type definition for EXTICR3_EXTI
   type EXTICR3_EXTI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTI as a value
            Val : STM32_SVD.UInt16;
         when True =>
            --  EXTI as an array
            Arr : EXTICR3_EXTI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EXTICR3_EXTI_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  external interrupt configuration register 3
   type EXTICR3_Register is record
      --  EXTI 8 configuration bits
      EXTI           : EXTICR3_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR3_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EXTICR4_EXTI array element
   subtype EXTICR4_EXTI_Element is STM32_SVD.UInt4;

   --  EXTICR4_EXTI array
   type EXTICR4_EXTI_Field_Array is array (12 .. 15) of EXTICR4_EXTI_Element
     with Component_Size => 4, Size => 16;

   --  Type definition for EXTICR4_EXTI
   type EXTICR4_EXTI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTI as a value
            Val : STM32_SVD.UInt16;
         when True =>
            --  EXTI as an array
            Arr : EXTICR4_EXTI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for EXTICR4_EXTI_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  external interrupt configuration register 4
   type EXTICR4_Register is record
      --  EXTI 12 configuration bits
      EXTI           : EXTICR4_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR4_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CFGR2_LOCUP_LOCK_Field is STM32_SVD.Bit;
   subtype CFGR2_SRAM_PARITY_LOCK_Field is STM32_SVD.Bit;
   subtype CFGR2_PVD_LOCK_Field is STM32_SVD.Bit;
   subtype CFGR2_BYP_ADD_PAR_Field is STM32_SVD.Bit;
   subtype CFGR2_SRAM_PEF_Field is STM32_SVD.Bit;

   --  configuration register 2
   type CFGR2_Register is record
      --  Cortex-M0 LOCKUP bit enable bit
      LOCUP_LOCK       : CFGR2_LOCUP_LOCK_Field := 16#0#;
      --  SRAM parity lock bit
      SRAM_PARITY_LOCK : CFGR2_SRAM_PARITY_LOCK_Field := 16#0#;
      --  PVD lock enable bit
      PVD_LOCK         : CFGR2_PVD_LOCK_Field := 16#0#;
      --  unspecified
      Reserved_3_3     : STM32_SVD.Bit := 16#0#;
      --  Bypass address bit 29 in parity calculation
      BYP_ADD_PAR      : CFGR2_BYP_ADD_PAR_Field := 16#0#;
      --  unspecified
      Reserved_5_7     : STM32_SVD.UInt3 := 16#0#;
      --  SRAM parity flag
      SRAM_PEF         : CFGR2_SRAM_PEF_Field := 16#0#;
      --  unspecified
      Reserved_9_31    : STM32_SVD.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR2_Register use record
      LOCUP_LOCK       at 0 range 0 .. 0;
      SRAM_PARITY_LOCK at 0 range 1 .. 1;
      PVD_LOCK         at 0 range 2 .. 2;
      Reserved_3_3     at 0 range 3 .. 3;
      BYP_ADD_PAR      at 0 range 4 .. 4;
      Reserved_5_7     at 0 range 5 .. 7;
      SRAM_PEF         at 0 range 8 .. 8;
      Reserved_9_31    at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System configuration controller
   type SYSCFG_Peripheral is record
      --  configuration register 1
      CFGR1   : aliased CFGR1_Register;
      --  CCM SRAM protection register
      RCR     : aliased RCR_Register;
      --  external interrupt configuration register 1
      EXTICR1 : aliased EXTICR1_Register;
      --  external interrupt configuration register 2
      EXTICR2 : aliased EXTICR2_Register;
      --  external interrupt configuration register 3
      EXTICR3 : aliased EXTICR3_Register;
      --  external interrupt configuration register 4
      EXTICR4 : aliased EXTICR4_Register;
      --  configuration register 2
      CFGR2   : aliased CFGR2_Register;
   end record
     with Volatile;

   for SYSCFG_Peripheral use record
      CFGR1   at 16#0# range 0 .. 31;
      RCR     at 16#4# range 0 .. 31;
      EXTICR1 at 16#8# range 0 .. 31;
      EXTICR2 at 16#C# range 0 .. 31;
      EXTICR3 at 16#10# range 0 .. 31;
      EXTICR4 at 16#14# range 0 .. 31;
      CFGR2   at 16#18# range 0 .. 31;
   end record;

   --  System configuration controller
   SYSCFG_Periph : aliased SYSCFG_Peripheral
     with Import, Address => System'To_Address (16#40010000#);

end STM32_SVD.SYSCFG;
