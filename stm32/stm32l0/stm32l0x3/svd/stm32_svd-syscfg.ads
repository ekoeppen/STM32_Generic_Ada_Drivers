pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x3.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.SYSCFG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CFGR1_MEM_MODE_Field is STM32_SVD.UInt2;
   subtype CFGR1_BOOT_MODE_Field is STM32_SVD.UInt2;

   --  SYSCFG configuration register 1
   type CFGR1_Register is record
      --  Memory mapping selection bits
      MEM_MODE       : CFGR1_MEM_MODE_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : STM32_SVD.UInt6 := 16#0#;
      --  Read-only. Boot mode selected by the boot pins status bits
      BOOT_MODE      : CFGR1_BOOT_MODE_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : STM32_SVD.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR1_Register use record
      MEM_MODE       at 0 range 0 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      BOOT_MODE      at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype CFGR2_FWDISEN_Field is STM32_SVD.Bit;
   subtype CFGR2_I2C_PB6_FMP_Field is STM32_SVD.Bit;
   subtype CFGR2_I2C_PB7_FMP_Field is STM32_SVD.Bit;
   subtype CFGR2_I2C_PB8_FMP_Field is STM32_SVD.Bit;
   subtype CFGR2_I2C_PB9_FMP_Field is STM32_SVD.Bit;
   subtype CFGR2_I2C1_FMP_Field is STM32_SVD.Bit;
   subtype CFGR2_I2C2_FMP_Field is STM32_SVD.Bit;

   --  SYSCFG configuration register 2
   type CFGR2_Register is record
      --  Firewall disable bit
      FWDISEN        : CFGR2_FWDISEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : STM32_SVD.UInt7 := 16#0#;
      --  Fm+ drive capability on PB6 enable bit
      I2C_PB6_FMP    : CFGR2_I2C_PB6_FMP_Field := 16#0#;
      --  Fm+ drive capability on PB7 enable bit
      I2C_PB7_FMP    : CFGR2_I2C_PB7_FMP_Field := 16#0#;
      --  Fm+ drive capability on PB8 enable bit
      I2C_PB8_FMP    : CFGR2_I2C_PB8_FMP_Field := 16#0#;
      --  Fm+ drive capability on PB9 enable bit
      I2C_PB9_FMP    : CFGR2_I2C_PB9_FMP_Field := 16#0#;
      --  I2C1 Fm+ drive capability enable bit
      I2C1_FMP       : CFGR2_I2C1_FMP_Field := 16#0#;
      --  I2C2 Fm+ drive capability enable bit
      I2C2_FMP       : CFGR2_I2C2_FMP_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR2_Register use record
      FWDISEN        at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      I2C_PB6_FMP    at 0 range 8 .. 8;
      I2C_PB7_FMP    at 0 range 9 .. 9;
      I2C_PB8_FMP    at 0 range 10 .. 10;
      I2C_PB9_FMP    at 0 range 11 .. 11;
      I2C1_FMP       at 0 range 12 .. 12;
      I2C2_FMP       at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
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
      --  EXTI x configuration (x = 0 to 3)
      EXTI           : EXTICR1_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
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
      --  EXTI x configuration (x = 4 to 7)
      EXTI           : EXTICR2_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
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
      --  EXTI x configuration (x = 8 to 11)
      EXTI           : EXTICR3_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
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
      --  EXTI12
      EXTI           : EXTICR4_EXTI_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR4_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype COMP1_CSR_COMP1EN_Field is STM32_SVD.Bit;
   subtype COMP1_CSR_COMP1INNSEL_Field is STM32_SVD.UInt2;
   subtype COMP1_CSR_COMP1WM_Field is STM32_SVD.Bit;
   subtype COMP1_CSR_COMP1LPTIMIN1_Field is STM32_SVD.Bit;
   subtype COMP1_CSR_COMP1POLARITY_Field is STM32_SVD.Bit;
   subtype COMP1_CSR_COMP1VALUE_Field is STM32_SVD.Bit;
   subtype COMP1_CSR_COMP1LOCK_Field is STM32_SVD.Bit;

   --  Comparator 1 control and status register
   type COMP1_CSR_Register is record
      --  Comparator 1 enable bit
      COMP1EN        : COMP1_CSR_COMP1EN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : STM32_SVD.UInt3 := 16#0#;
      --  Comparator 1 Input Minus connection configuration bit
      COMP1INNSEL    : COMP1_CSR_COMP1INNSEL_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : STM32_SVD.UInt2 := 16#0#;
      --  Comparator 1 window mode selection bit
      COMP1WM        : COMP1_CSR_COMP1WM_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : STM32_SVD.UInt3 := 16#0#;
      --  Comparator 1 LPTIM input propagation bit
      COMP1LPTIMIN1  : COMP1_CSR_COMP1LPTIMIN1_Field := 16#0#;
      --  unspecified
      Reserved_13_14 : STM32_SVD.UInt2 := 16#0#;
      --  Comparator 1 polarity selection bit
      COMP1POLARITY  : COMP1_CSR_COMP1POLARITY_Field := 16#0#;
      --  unspecified
      Reserved_16_29 : STM32_SVD.UInt14 := 16#0#;
      --  Read-only. Comparator 1 output status bit
      COMP1VALUE     : COMP1_CSR_COMP1VALUE_Field := 16#0#;
      --  Read-only. COMP1_CSR register lock bit
      COMP1LOCK      : COMP1_CSR_COMP1LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP1_CSR_Register use record
      COMP1EN        at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      COMP1INNSEL    at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      COMP1WM        at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      COMP1LPTIMIN1  at 0 range 12 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      COMP1POLARITY  at 0 range 15 .. 15;
      Reserved_16_29 at 0 range 16 .. 29;
      COMP1VALUE     at 0 range 30 .. 30;
      COMP1LOCK      at 0 range 31 .. 31;
   end record;

   subtype COMP2_CSR_COMP2EN_Field is STM32_SVD.Bit;
   subtype COMP2_CSR_COMP2SPEED_Field is STM32_SVD.Bit;
   subtype COMP2_CSR_COMP2INNSEL_Field is STM32_SVD.UInt3;
   subtype COMP2_CSR_COMP2INPSEL_Field is STM32_SVD.UInt3;
   subtype COMP2_CSR_COMP2LPTIMIN2_Field is STM32_SVD.Bit;
   subtype COMP2_CSR_COMP2LPTIMIN1_Field is STM32_SVD.Bit;
   subtype COMP2_CSR_COMP2POLARITY_Field is STM32_SVD.Bit;
   subtype COMP2_CSR_COMP2VALUE_Field is STM32_SVD.Bit;
   subtype COMP2_CSR_COMP2LOCK_Field is STM32_SVD.Bit;

   --  Comparator 2 control and status register
   type COMP2_CSR_Register is record
      --  Comparator 2 enable bit
      COMP2EN        : COMP2_CSR_COMP2EN_Field := 16#0#;
      --  unspecified
      Reserved_1_2   : STM32_SVD.UInt2 := 16#0#;
      --  Comparator 2 power mode selection bit
      COMP2SPEED     : COMP2_CSR_COMP2SPEED_Field := 16#0#;
      --  Comparator 2 Input Minus connection configuration bit
      COMP2INNSEL    : COMP2_CSR_COMP2INNSEL_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit := 16#0#;
      --  Comparator 2 Input Plus connection configuration bit
      COMP2INPSEL    : COMP2_CSR_COMP2INPSEL_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : STM32_SVD.Bit := 16#0#;
      --  Comparator 2 LPTIM input 2 propagation bit
      COMP2LPTIMIN2  : COMP2_CSR_COMP2LPTIMIN2_Field := 16#0#;
      --  Comparator 2 LPTIM input 1 propagation bit
      COMP2LPTIMIN1  : COMP2_CSR_COMP2LPTIMIN1_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Comparator 2 polarity selection bit
      COMP2POLARITY  : COMP2_CSR_COMP2POLARITY_Field := 16#0#;
      --  unspecified
      Reserved_16_19 : STM32_SVD.UInt4 := 16#0#;
      --  Read-only. Comparator 2 output status bit
      COMP2VALUE     : COMP2_CSR_COMP2VALUE_Field := 16#0#;
      --  unspecified
      Reserved_21_30 : STM32_SVD.UInt10 := 16#0#;
      --  Read-only. COMP2_CSR register lock bit
      COMP2LOCK      : COMP2_CSR_COMP2LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP2_CSR_Register use record
      COMP2EN        at 0 range 0 .. 0;
      Reserved_1_2   at 0 range 1 .. 2;
      COMP2SPEED     at 0 range 3 .. 3;
      COMP2INNSEL    at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      COMP2INPSEL    at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      COMP2LPTIMIN2  at 0 range 12 .. 12;
      COMP2LPTIMIN1  at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      COMP2POLARITY  at 0 range 15 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      COMP2VALUE     at 0 range 20 .. 20;
      Reserved_21_30 at 0 range 21 .. 30;
      COMP2LOCK      at 0 range 31 .. 31;
   end record;

   subtype CFGR3_EN_BGAP_Field is STM32_SVD.Bit;
   subtype CFGR3_SEL_VREF_OUT_Field is STM32_SVD.UInt2;
   subtype CFGR3_ENBUF_BGAP_ADC_Field is STM32_SVD.Bit;
   subtype CFGR3_ENBUF_SENSOR_ADC_Field is STM32_SVD.Bit;
   subtype CFGR3_ENBUF_VREFINT_COMP_Field is STM32_SVD.Bit;
   subtype CFGR3_ENREF_RC48MHz_Field is STM32_SVD.Bit;
   subtype CFGR3_REF_RC48MHz_RDYF_Field is STM32_SVD.Bit;
   subtype CFGR3_SENSOR_ADC_RDYF_Field is STM32_SVD.Bit;
   subtype CFGR3_VREFINT_ADC_RDYF_Field is STM32_SVD.Bit;
   subtype CFGR3_VREFINT_COMP_RDYF_Field is STM32_SVD.Bit;
   subtype CFGR3_VREFINT_RDYF_Field is STM32_SVD.Bit;
   subtype CFGR3_REF_LOCK_Field is STM32_SVD.Bit;

   --  SYSCFG configuration register 3
   type CFGR3_Register is record
      --  Vref Enable bit
      EN_BGAP            : CFGR3_EN_BGAP_Field := 16#0#;
      --  unspecified
      Reserved_1_3       : STM32_SVD.UInt3 := 16#0#;
      --  BGAP_ADC connection bit
      SEL_VREF_OUT       : CFGR3_SEL_VREF_OUT_Field := 16#0#;
      --  unspecified
      Reserved_6_7       : STM32_SVD.UInt2 := 16#0#;
      --  VREFINT reference for ADC enable bit
      ENBUF_BGAP_ADC     : CFGR3_ENBUF_BGAP_ADC_Field := 16#0#;
      --  Sensor reference for ADC enable bit
      ENBUF_SENSOR_ADC   : CFGR3_ENBUF_SENSOR_ADC_Field := 16#0#;
      --  unspecified
      Reserved_10_11     : STM32_SVD.UInt2 := 16#0#;
      --  VREFINT reference for comparator 2 enable bit
      ENBUF_VREFINT_COMP : CFGR3_ENBUF_VREFINT_COMP_Field := 16#0#;
      --  VREFINT reference for 48 MHz RC oscillator enable bit
      ENREF_RC48MHz      : CFGR3_ENREF_RC48MHz_Field := 16#0#;
      --  unspecified
      Reserved_14_25     : STM32_SVD.UInt12 := 16#0#;
      --  Read-only. VREFINT for 48 MHz RC oscillator ready flag
      REF_RC48MHz_RDYF   : CFGR3_REF_RC48MHz_RDYF_Field := 16#0#;
      --  Read-only. Sensor for ADC ready flag
      SENSOR_ADC_RDYF    : CFGR3_SENSOR_ADC_RDYF_Field := 16#0#;
      --  Read-only. VREFINT for ADC ready flag
      VREFINT_ADC_RDYF   : CFGR3_VREFINT_ADC_RDYF_Field := 16#0#;
      --  Read-only. VREFINT for comparator ready flag
      VREFINT_COMP_RDYF  : CFGR3_VREFINT_COMP_RDYF_Field := 16#0#;
      --  Read-only. VREFINT ready flag
      VREFINT_RDYF       : CFGR3_VREFINT_RDYF_Field := 16#0#;
      --  Write-only. REF_CTRL lock bit
      REF_LOCK           : CFGR3_REF_LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR3_Register use record
      EN_BGAP            at 0 range 0 .. 0;
      Reserved_1_3       at 0 range 1 .. 3;
      SEL_VREF_OUT       at 0 range 4 .. 5;
      Reserved_6_7       at 0 range 6 .. 7;
      ENBUF_BGAP_ADC     at 0 range 8 .. 8;
      ENBUF_SENSOR_ADC   at 0 range 9 .. 9;
      Reserved_10_11     at 0 range 10 .. 11;
      ENBUF_VREFINT_COMP at 0 range 12 .. 12;
      ENREF_RC48MHz      at 0 range 13 .. 13;
      Reserved_14_25     at 0 range 14 .. 25;
      REF_RC48MHz_RDYF   at 0 range 26 .. 26;
      SENSOR_ADC_RDYF    at 0 range 27 .. 27;
      VREFINT_ADC_RDYF   at 0 range 28 .. 28;
      VREFINT_COMP_RDYF  at 0 range 29 .. 29;
      VREFINT_RDYF       at 0 range 30 .. 30;
      REF_LOCK           at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System configuration controller and Comparator
   type SYSCFG_COMP_Peripheral is record
      --  SYSCFG configuration register 1
      CFGR1     : aliased CFGR1_Register;
      --  SYSCFG configuration register 2
      CFGR2     : aliased CFGR2_Register;
      --  external interrupt configuration register 1
      EXTICR1   : aliased EXTICR1_Register;
      --  external interrupt configuration register 2
      EXTICR2   : aliased EXTICR2_Register;
      --  external interrupt configuration register 3
      EXTICR3   : aliased EXTICR3_Register;
      --  external interrupt configuration register 4
      EXTICR4   : aliased EXTICR4_Register;
      --  Comparator 1 control and status register
      COMP1_CSR : aliased COMP1_CSR_Register;
      --  Comparator 2 control and status register
      COMP2_CSR : aliased COMP2_CSR_Register;
      --  SYSCFG configuration register 3
      CFGR3     : aliased CFGR3_Register;
   end record
     with Volatile;

   for SYSCFG_COMP_Peripheral use record
      CFGR1     at 16#0# range 0 .. 31;
      CFGR2     at 16#4# range 0 .. 31;
      EXTICR1   at 16#8# range 0 .. 31;
      EXTICR2   at 16#C# range 0 .. 31;
      EXTICR3   at 16#10# range 0 .. 31;
      EXTICR4   at 16#14# range 0 .. 31;
      COMP1_CSR at 16#18# range 0 .. 31;
      COMP2_CSR at 16#1C# range 0 .. 31;
      CFGR3     at 16#20# range 0 .. 31;
   end record;

   --  System configuration controller and Comparator
   SYSCFG_COMP_Periph : aliased SYSCFG_COMP_Peripheral
     with Import, Address => SYSCFG_COMP_Base;

end STM32_SVD.SYSCFG;
