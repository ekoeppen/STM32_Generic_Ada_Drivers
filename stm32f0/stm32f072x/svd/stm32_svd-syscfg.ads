--  This spec has been automatically generated from STM32F072x.svd

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
   subtype CFGR1_ADC_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_USART1_TX_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_USART1_RX_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_TIM16_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_TIM17_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C_PB6_FM_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C_PB7_FM_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C_PB8_FM_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C_PB9_FM_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C1_FM_plus_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C2_FM_plus_Field is STM32_SVD.Bit;
   subtype CFGR1_SPI2_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_USART2_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_USART3_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_I2C1_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_TIM1_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_TIM2_DMA_RMP_Field is STM32_SVD.Bit;
   subtype CFGR1_TIM3_DMA_RMP_Field is STM32_SVD.Bit;

   --  configuration register 1
   type CFGR1_Register is record
      --  Memory mapping selection bits
      MEM_MODE          : CFGR1_MEM_MODE_Field := 16#0#;
      --  unspecified
      Reserved_2_7      : STM32_SVD.UInt6 := 16#0#;
      --  ADC DMA remapping bit
      ADC_DMA_RMP       : CFGR1_ADC_DMA_RMP_Field := 16#0#;
      --  USART1_TX DMA remapping bit
      USART1_TX_DMA_RMP : CFGR1_USART1_TX_DMA_RMP_Field := 16#0#;
      --  USART1_RX DMA request remapping bit
      USART1_RX_DMA_RMP : CFGR1_USART1_RX_DMA_RMP_Field := 16#0#;
      --  TIM16 DMA request remapping bit
      TIM16_DMA_RMP     : CFGR1_TIM16_DMA_RMP_Field := 16#0#;
      --  TIM17 DMA request remapping bit
      TIM17_DMA_RMP     : CFGR1_TIM17_DMA_RMP_Field := 16#0#;
      --  unspecified
      Reserved_13_15    : STM32_SVD.UInt3 := 16#0#;
      --  Fast Mode Plus (FM plus) driving capability activation bits.
      I2C_PB6_FM        : CFGR1_I2C_PB6_FM_Field := 16#0#;
      --  Fast Mode Plus (FM+) driving capability activation bits.
      I2C_PB7_FM        : CFGR1_I2C_PB7_FM_Field := 16#0#;
      --  Fast Mode Plus (FM+) driving capability activation bits.
      I2C_PB8_FM        : CFGR1_I2C_PB8_FM_Field := 16#0#;
      --  Fast Mode Plus (FM+) driving capability activation bits.
      I2C_PB9_FM        : CFGR1_I2C_PB9_FM_Field := 16#0#;
      --  FM+ driving capability activation for I2C1
      I2C1_FM_plus      : CFGR1_I2C1_FM_plus_Field := 16#0#;
      --  FM+ driving capability activation for I2C2
      I2C2_FM_plus      : CFGR1_I2C2_FM_plus_Field := 16#0#;
      --  unspecified
      Reserved_22_23    : STM32_SVD.UInt2 := 16#0#;
      --  SPI2 DMA request remapping bit
      SPI2_DMA_RMP      : CFGR1_SPI2_DMA_RMP_Field := 16#0#;
      --  USART2 DMA request remapping bit
      USART2_DMA_RMP    : CFGR1_USART2_DMA_RMP_Field := 16#0#;
      --  USART3 DMA request remapping bit
      USART3_DMA_RMP    : CFGR1_USART3_DMA_RMP_Field := 16#0#;
      --  I2C1 DMA request remapping bit
      I2C1_DMA_RMP      : CFGR1_I2C1_DMA_RMP_Field := 16#0#;
      --  TIM1 DMA request remapping bit
      TIM1_DMA_RMP      : CFGR1_TIM1_DMA_RMP_Field := 16#0#;
      --  TIM2 DMA request remapping bit
      TIM2_DMA_RMP      : CFGR1_TIM2_DMA_RMP_Field := 16#0#;
      --  TIM3 DMA request remapping bit
      TIM3_DMA_RMP      : CFGR1_TIM3_DMA_RMP_Field := 16#0#;
      --  unspecified
      Reserved_31_31    : STM32_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR1_Register use record
      MEM_MODE          at 0 range 0 .. 1;
      Reserved_2_7      at 0 range 2 .. 7;
      ADC_DMA_RMP       at 0 range 8 .. 8;
      USART1_TX_DMA_RMP at 0 range 9 .. 9;
      USART1_RX_DMA_RMP at 0 range 10 .. 10;
      TIM16_DMA_RMP     at 0 range 11 .. 11;
      TIM17_DMA_RMP     at 0 range 12 .. 12;
      Reserved_13_15    at 0 range 13 .. 15;
      I2C_PB6_FM        at 0 range 16 .. 16;
      I2C_PB7_FM        at 0 range 17 .. 17;
      I2C_PB8_FM        at 0 range 18 .. 18;
      I2C_PB9_FM        at 0 range 19 .. 19;
      I2C1_FM_plus      at 0 range 20 .. 20;
      I2C2_FM_plus      at 0 range 21 .. 21;
      Reserved_22_23    at 0 range 22 .. 23;
      SPI2_DMA_RMP      at 0 range 24 .. 24;
      USART2_DMA_RMP    at 0 range 25 .. 25;
      USART3_DMA_RMP    at 0 range 26 .. 26;
      I2C1_DMA_RMP      at 0 range 27 .. 27;
      TIM1_DMA_RMP      at 0 range 28 .. 28;
      TIM2_DMA_RMP      at 0 range 29 .. 29;
      TIM3_DMA_RMP      at 0 range 30 .. 30;
      Reserved_31_31    at 0 range 31 .. 31;
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
      Reserved_3_7     : STM32_SVD.UInt5 := 16#0#;
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
      Reserved_3_7     at 0 range 3 .. 7;
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
