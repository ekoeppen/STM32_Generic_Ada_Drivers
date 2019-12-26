--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.SYSCFG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  SYSCFG configuration register 1
   type CFGR1_Register is record
      --  Memory mapping selection bits
      MEM_MODE       : STM32_SVD.UInt2;
      --  unspecified
      Reserved_2_7   : STM32_SVD.UInt6;
      --  Read-only. Boot mode selected by the boot pins status bits
      BOOT_MODE      : STM32_SVD.UInt2;
      --  unspecified
      Reserved_10_31 : STM32_SVD.UInt22;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR1_Register use record
      MEM_MODE       at 0 range 0 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      BOOT_MODE      at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  SYSCFG configuration register 2
   type CFGR2_Register is record
      --  Firewall disable bit
      FWDISEN        : STM32_SVD.Bit;
      --  Configuration of internal VLCD rail connection to optional external
      --  capacitor
      CAPA           : STM32_SVD.UInt3;
      --  unspecified
      Reserved_4_7   : STM32_SVD.UInt4;
      --  Fm+ drive capability on PB6 enable bit
      I2C_PB6_FMP    : STM32_SVD.Bit;
      --  Fm+ drive capability on PB7 enable bit
      I2C_PB7_FMP    : STM32_SVD.Bit;
      --  Fm+ drive capability on PB8 enable bit
      I2C_PB8_FMP    : STM32_SVD.Bit;
      --  Fm+ drive capability on PB9 enable bit
      I2C_PB9_FMP    : STM32_SVD.Bit;
      --  I2C1 Fm+ drive capability enable bit
      I2C1_FMP       : STM32_SVD.Bit;
      --  I2C2 Fm+ drive capability enable bit
      I2C2_FMP       : STM32_SVD.Bit;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR2_Register use record
      FWDISEN        at 0 range 0 .. 0;
      CAPA           at 0 range 1 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      I2C_PB6_FMP    at 0 range 8 .. 8;
      I2C_PB7_FMP    at 0 range 9 .. 9;
      I2C_PB8_FMP    at 0 range 10 .. 10;
      I2C_PB9_FMP    at 0 range 11 .. 11;
      I2C1_FMP       at 0 range 12 .. 12;
      I2C2_FMP       at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  EXTICR1_EXTI array
   type EXTICR1_EXTI_Field_Array is array (0 .. 3) of STM32_SVD.UInt4
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
      EXTI           : EXTICR1_EXTI_Field;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR1_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EXTICR2_EXTI array
   type EXTICR2_EXTI_Field_Array is array (4 .. 7) of STM32_SVD.UInt4
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
      EXTI           : EXTICR2_EXTI_Field;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR2_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EXTICR3_EXTI array
   type EXTICR3_EXTI_Field_Array is array (8 .. 11) of STM32_SVD.UInt4
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
      EXTI           : EXTICR3_EXTI_Field;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR3_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  EXTICR4_EXTI array
   type EXTICR4_EXTI_Field_Array is array (12 .. 15) of STM32_SVD.UInt4
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
      EXTI           : EXTICR4_EXTI_Field;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR4_Register use record
      EXTI           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Comparator 1 control and status register
   type COMP1_CTRL_Register is record
      --  Comparator 1 enable bit
      COMP1EN        : STM32_SVD.Bit;
      --  unspecified
      Reserved_1_3   : STM32_SVD.UInt3;
      --  Comparator 1 Input Minus connection configuration bit
      COMP1INNSEL    : STM32_SVD.UInt2;
      --  unspecified
      Reserved_6_7   : STM32_SVD.UInt2;
      --  Comparator 1 window mode selection bit
      COMP1WM        : STM32_SVD.Bit;
      --  unspecified
      Reserved_9_11  : STM32_SVD.UInt3;
      --  Comparator 1 LPTIM input propagation bit
      COMP1LPTIMIN1  : STM32_SVD.Bit;
      --  unspecified
      Reserved_13_14 : STM32_SVD.UInt2;
      --  Comparator 1 polarity selection bit
      COMP1POLARITY  : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_29 : STM32_SVD.UInt14;
      --  Comparator 1 output status bit
      COMP1VALUE     : STM32_SVD.Bit;
      --  COMP1_CSR register lock bit
      COMP1LOCK      : STM32_SVD.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP1_CTRL_Register use record
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

   --  Comparator 2 control and status register
   type COMP2_CTRL_Register is record
      --  Comparator 2 enable bit
      COMP2EN        : STM32_SVD.Bit;
      --  unspecified
      Reserved_1_2   : STM32_SVD.UInt2;
      --  Comparator 2 power mode selection bit
      COMP2SPEED     : STM32_SVD.Bit;
      --  Comparator 2 Input Minus connection configuration bit
      COMP2INNSEL    : STM32_SVD.UInt3;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit;
      --  Comparator 2 Input Plus connection configuration bit
      COMP2INPSEL    : STM32_SVD.UInt3;
      --  unspecified
      Reserved_11_11 : STM32_SVD.Bit;
      --  Comparator 2 LPTIM input 2 propagation bit
      COMP2LPTIMIN2  : STM32_SVD.Bit;
      --  Comparator 2 LPTIM input 1 propagation bit
      COMP2LPTIMIN1  : STM32_SVD.Bit;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit;
      --  Comparator 2 polarity selection bit
      COMP2POLARITY  : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_29 : STM32_SVD.UInt14;
      --  Comparator 2 output status bit
      COMP2VALUE     : STM32_SVD.Bit;
      --  COMP2_CSR register lock bit
      COMP2LOCK      : STM32_SVD.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP2_CTRL_Register use record
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
      Reserved_16_29 at 0 range 16 .. 29;
      COMP2VALUE     at 0 range 30 .. 30;
      COMP2LOCK      at 0 range 31 .. 31;
   end record;

   --  SYSCFG configuration register 3
   type CFGR3_Register is record
      --  Vref Enable bit
      EN_BGAP            : STM32_SVD.Bit;
      --  unspecified
      Reserved_1_3       : STM32_SVD.UInt3;
      --  BGAP_ADC connection bit
      SEL_VREF_OUT       : STM32_SVD.UInt2;
      --  unspecified
      Reserved_6_7       : STM32_SVD.UInt2;
      --  VREFINT reference for ADC enable bit
      ENBUF_BGAP_ADC     : STM32_SVD.Bit;
      --  Sensor reference for ADC enable bit
      ENBUF_SENSOR_ADC   : STM32_SVD.Bit;
      --  unspecified
      Reserved_10_11     : STM32_SVD.UInt2;
      --  VREFINT reference for comparator 2 enable bit
      ENBUF_VREFINT_COMP : STM32_SVD.Bit;
      --  VREFINT reference for 48 MHz RC oscillator enable bit
      ENREF_RC48MHz      : STM32_SVD.Bit;
      --  unspecified
      Reserved_14_25     : STM32_SVD.UInt12;
      --  Read-only. VREFINT for 48 MHz RC oscillator ready flag
      REF_RC48MHz_RDYF   : STM32_SVD.Bit;
      --  Read-only. Sensor for ADC ready flag
      SENSOR_ADC_RDYF    : STM32_SVD.Bit;
      --  Read-only. VREFINT for ADC ready flag
      VREFINT_ADC_RDYF   : STM32_SVD.Bit;
      --  Read-only. VREFINT for comparator ready flag
      VREFINT_COMP_RDYF  : STM32_SVD.Bit;
      --  Read-only. VREFINT ready flag
      VREFINT_RDYF       : STM32_SVD.Bit;
      --  Write-only. REF_CTRL lock bit
      REF_LOCK           : STM32_SVD.Bit;
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

   --  System configuration controller and COMP register
   type SYSCFG_COMP_Peripheral is record
      --  SYSCFG configuration register 1
      CFGR1      : aliased CFGR1_Register;
      --  SYSCFG configuration register 2
      CFGR2      : aliased CFGR2_Register;
      --  external interrupt configuration register 1
      EXTICR1    : aliased EXTICR1_Register;
      --  external interrupt configuration register 2
      EXTICR2    : aliased EXTICR2_Register;
      --  external interrupt configuration register 3
      EXTICR3    : aliased EXTICR3_Register;
      --  external interrupt configuration register 4
      EXTICR4    : aliased EXTICR4_Register;
      --  Comparator 1 control and status register
      COMP1_CTRL : aliased COMP1_CTRL_Register;
      --  Comparator 2 control and status register
      COMP2_CTRL : aliased COMP2_CTRL_Register;
      --  SYSCFG configuration register 3
      CFGR3      : aliased CFGR3_Register;
   end record
     with Volatile;

   for SYSCFG_COMP_Peripheral use record
      CFGR1      at 16#0# range 0 .. 31;
      CFGR2      at 16#4# range 0 .. 31;
      EXTICR1    at 16#8# range 0 .. 31;
      EXTICR2    at 16#C# range 0 .. 31;
      EXTICR3    at 16#10# range 0 .. 31;
      EXTICR4    at 16#14# range 0 .. 31;
      COMP1_CTRL at 16#18# range 0 .. 31;
      COMP2_CTRL at 16#1C# range 0 .. 31;
      CFGR3      at 16#20# range 0 .. 31;
   end record;

   --  System configuration controller and COMP register
   SYSCFG_COMP_Periph : aliased SYSCFG_COMP_Peripheral
     with Import, Address => SYSCFG_COMP_Base;

end STM32_SVD.SYSCFG;
