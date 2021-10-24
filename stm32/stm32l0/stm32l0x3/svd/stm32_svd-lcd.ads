pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x3.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.LCD is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_LCDEN_Field is STM32_SVD.Bit;
   subtype CR_VSEL_Field is STM32_SVD.Bit;
   subtype CR_DUTY_Field is STM32_SVD.UInt3;
   subtype CR_BIAS_Field is STM32_SVD.UInt2;

   --  control register
   type CR_Register is record
      --  LCD controller enable
      LCDEN         : CR_LCDEN_Field := 16#0#;
      --  Voltage source selection
      VSEL          : CR_VSEL_Field := 16#0#;
      --  Duty selection
      DUTY          : CR_DUTY_Field := 16#0#;
      --  Bias selector
      BIAS          : CR_BIAS_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      LCDEN         at 0 range 0 .. 0;
      VSEL          at 0 range 1 .. 1;
      DUTY          at 0 range 2 .. 4;
      BIAS          at 0 range 5 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype FCR_HD_Field is STM32_SVD.Bit;
   subtype FCR_SOFIE_Field is STM32_SVD.Bit;
   subtype FCR_UDDIE_Field is STM32_SVD.Bit;
   subtype FCR_PON_Field is STM32_SVD.UInt3;
   subtype FCR_DEAD_Field is STM32_SVD.UInt3;
   subtype FCR_CC_Field is STM32_SVD.UInt3;
   subtype FCR_BLINKF_Field is STM32_SVD.UInt3;
   subtype FCR_BLINK_Field is STM32_SVD.UInt2;
   subtype FCR_DIV_Field is STM32_SVD.UInt4;
   subtype FCR_PS_Field is STM32_SVD.UInt4;

   --  frame control register
   type FCR_Register is record
      --  High drive enable
      HD             : FCR_HD_Field := 16#0#;
      --  Start of frame interrupt enable
      SOFIE          : FCR_SOFIE_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : STM32_SVD.Bit := 16#0#;
      --  Update display done interrupt enable
      UDDIE          : FCR_UDDIE_Field := 16#0#;
      --  Pulse ON duration
      PON            : FCR_PON_Field := 16#0#;
      --  Dead time duration
      DEAD           : FCR_DEAD_Field := 16#0#;
      --  Contrast control
      CC             : FCR_CC_Field := 16#0#;
      --  Blink frequency selection
      BLINKF         : FCR_BLINKF_Field := 16#0#;
      --  Blink mode selection
      BLINK          : FCR_BLINK_Field := 16#0#;
      --  DIV clock divider
      DIV            : FCR_DIV_Field := 16#0#;
      --  PS 16-bit prescaler
      PS             : FCR_PS_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : STM32_SVD.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FCR_Register use record
      HD             at 0 range 0 .. 0;
      SOFIE          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      UDDIE          at 0 range 3 .. 3;
      PON            at 0 range 4 .. 6;
      DEAD           at 0 range 7 .. 9;
      CC             at 0 range 10 .. 12;
      BLINKF         at 0 range 13 .. 15;
      BLINK          at 0 range 16 .. 17;
      DIV            at 0 range 18 .. 21;
      PS             at 0 range 22 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype SR_ENS_Field is STM32_SVD.Bit;
   subtype SR_SOF_Field is STM32_SVD.Bit;
   subtype SR_UDR_Field is STM32_SVD.Bit;
   subtype SR_UDD_Field is STM32_SVD.Bit;
   subtype SR_RDY_Field is STM32_SVD.Bit;
   subtype SR_FCRSF_Field is STM32_SVD.Bit;

   --  status register
   type SR_Register is record
      --  Read-only. ENS
      ENS           : SR_ENS_Field := 16#0#;
      --  Read-only. Start of frame flag
      SOF           : SR_SOF_Field := 16#0#;
      --  Write-only. Update display request
      UDR           : SR_UDR_Field := 16#0#;
      --  Read-only. Update Display Done
      UDD           : SR_UDD_Field := 16#0#;
      --  Read-only. Ready flag
      RDY           : SR_RDY_Field := 16#0#;
      --  Read-only. LCD Frame Control Register Synchronization flag
      FCRSF         : SR_FCRSF_Field := 16#1#;
      --  unspecified
      Reserved_6_31 : STM32_SVD.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      ENS           at 0 range 0 .. 0;
      SOF           at 0 range 1 .. 1;
      UDR           at 0 range 2 .. 2;
      UDD           at 0 range 3 .. 3;
      RDY           at 0 range 4 .. 4;
      FCRSF         at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype CLR_SOFC_Field is STM32_SVD.Bit;
   subtype CLR_UDDC_Field is STM32_SVD.Bit;

   --  clear register
   type CLR_Register is record
      --  unspecified
      Reserved_0_0  : STM32_SVD.Bit := 16#0#;
      --  Write-only. Start of frame flag clear
      SOFC          : CLR_SOFC_Field := 16#0#;
      --  unspecified
      Reserved_2_2  : STM32_SVD.Bit := 16#0#;
      --  Write-only. Update display done clear
      UDDC          : CLR_UDDC_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : STM32_SVD.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      SOFC          at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      UDDC          at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  RAM_COM0_S array element
   subtype RAM_COM0_S_Element is STM32_SVD.Bit;

   --  RAM_COM0_S array
   type RAM_COM0_S_Field_Array is array (0 .. 30) of RAM_COM0_S_Element
     with Component_Size => 1, Size => 31;

   --  Type definition for RAM_COM0_S
   type RAM_COM0_S_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : STM32_SVD.UInt31;
         when True =>
            --  S as an array
            Arr : RAM_COM0_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 31;

   for RAM_COM0_S_Field use record
      Val at 0 range 0 .. 30;
      Arr at 0 range 0 .. 30;
   end record;

   --  display memory
   type RAM_COM0_Register is record
      --  S00
      S              : RAM_COM0_S_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_31_31 : STM32_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAM_COM0_Register use record
      S              at 0 range 0 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  RAM_COM_S array element
   subtype RAM_COM_S_Element is STM32_SVD.Bit;

   --  RAM_COM_S array
   type RAM_COM_S_Field_Array is array (0 .. 31) of RAM_COM_S_Element
     with Component_Size => 1, Size => 32;

   --  display memory
   type RAM_COM_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : STM32_SVD.UInt32;
         when True =>
            --  S as an array
            Arr : RAM_COM_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAM_COM_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Liquid crystal display controller
   type LCD_Peripheral is record
      --  control register
      CR       : aliased CR_Register;
      --  frame control register
      FCR      : aliased FCR_Register;
      --  status register
      SR       : aliased SR_Register;
      --  clear register
      CLR      : aliased CLR_Register;
      --  display memory
      RAM_COM0 : aliased RAM_COM0_Register;
      --  display memory
      RAM_COM1 : aliased RAM_COM_Register;
      --  display memory
      RAM_COM2 : aliased RAM_COM_Register;
      --  display memory
      RAM_COM3 : aliased RAM_COM_Register;
      --  display memory
      RAM_COM4 : aliased RAM_COM_Register;
      --  display memory
      RAM_COM5 : aliased RAM_COM_Register;
      --  display memory
      RAM_COM6 : aliased RAM_COM_Register;
      --  display memory
      RAM_COM7 : aliased RAM_COM_Register;
   end record
     with Volatile;

   for LCD_Peripheral use record
      CR       at 16#0# range 0 .. 31;
      FCR      at 16#4# range 0 .. 31;
      SR       at 16#8# range 0 .. 31;
      CLR      at 16#C# range 0 .. 31;
      RAM_COM0 at 16#14# range 0 .. 31;
      RAM_COM1 at 16#1C# range 0 .. 31;
      RAM_COM2 at 16#24# range 0 .. 31;
      RAM_COM3 at 16#2C# range 0 .. 31;
      RAM_COM4 at 16#34# range 0 .. 31;
      RAM_COM5 at 16#3C# range 0 .. 31;
      RAM_COM6 at 16#44# range 0 .. 31;
      RAM_COM7 at 16#4C# range 0 .. 31;
   end record;

   --  Liquid crystal display controller
   LCD_Periph : aliased LCD_Peripheral
     with Import, Address => LCD_Base;

end STM32_SVD.LCD;
