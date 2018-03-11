--  This spec has been automatically generated from STM32F0xx.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.DAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_EN1_Field is STM32_SVD.Bit;
   subtype CR_BOFF1_Field is STM32_SVD.Bit;
   subtype CR_TEN1_Field is STM32_SVD.Bit;
   --  CR_TSEL array element
   subtype CR_TSEL_Element is STM32_SVD.Bit;

   --  CR_TSEL array
   type CR_TSEL_Field_Array is array (10 .. 12) of CR_TSEL_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for CR_TSEL
   type CR_TSEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TSEL as a value
            Val : STM32_SVD.UInt3;
         when True =>
            --  TSEL as an array
            Arr : CR_TSEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for CR_TSEL_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   subtype CR_DMAEN1_Field is STM32_SVD.Bit;
   subtype CR_DMAUDRIE1_Field is STM32_SVD.Bit;

   --  control register
   type CR_Register is record
      --  DAC channel1 enable
      EN1            : CR_EN1_Field := 16#0#;
      --  DAC channel1 output buffer disable
      BOFF1          : CR_BOFF1_Field := 16#0#;
      --  DAC channel1 trigger enable
      TEN1           : CR_TEN1_Field := 16#0#;
      --  DAC channel1 trigger selection
      TSEL           : CR_TSEL_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_11  : STM32_SVD.UInt6 := 16#0#;
      --  DAC channel1 DMA enable
      DMAEN1         : CR_DMAEN1_Field := 16#0#;
      --  DAC channel1 DMA Underrun Interrupt enable
      DMAUDRIE1      : CR_DMAUDRIE1_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      EN1            at 0 range 0 .. 0;
      BOFF1          at 0 range 1 .. 1;
      TEN1           at 0 range 2 .. 2;
      TSEL           at 0 range 3 .. 5;
      Reserved_6_11  at 0 range 6 .. 11;
      DMAEN1         at 0 range 12 .. 12;
      DMAUDRIE1      at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype SWTRIGR_SWTRIG1_Field is STM32_SVD.Bit;

   --  software trigger register
   type SWTRIGR_Register is record
      --  Write-only. DAC channel1 software trigger
      SWTRIG1       : SWTRIGR_SWTRIG1_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : STM32_SVD.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SWTRIGR_Register use record
      SWTRIG1       at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype DHR12R1_DACC1DHR_Field is STM32_SVD.UInt12;

   --  channel1 12-bit right-aligned data holding register
   type DHR12R1_Register is record
      --  DAC channel1 12-bit right-aligned data
      DACC1DHR       : DHR12R1_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR12R1_Register use record
      DACC1DHR       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype DHR12L1_DACC1DHR_Field is STM32_SVD.UInt12;

   --  channel1 12-bit left aligned data holding register
   type DHR12L1_Register is record
      --  unspecified
      Reserved_0_3   : STM32_SVD.UInt4 := 16#0#;
      --  DAC channel1 12-bit left-aligned data
      DACC1DHR       : DHR12L1_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR12L1_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      DACC1DHR       at 0 range 4 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DHR8R1_DACC1DHR_Field is STM32_SVD.Byte;

   --  channel1 8-bit right aligned data holding register
   type DHR8R1_Register is record
      --  DAC channel1 8-bit right-aligned data
      DACC1DHR      : DHR8R1_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR8R1_Register use record
      DACC1DHR      at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DOR1_DACC1DOR_Field is STM32_SVD.UInt12;

   --  channel1 data output register
   type DOR1_Register is record
      --  Read-only. DAC channel1 data output
      DACC1DOR       : DOR1_DACC1DOR_Field;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DOR1_Register use record
      DACC1DOR       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype SR_DMAUDR1_Field is STM32_SVD.Bit;
   subtype SR_DMAUDR2_Field is STM32_SVD.Bit;

   --  status register
   type SR_Register is record
      --  unspecified
      Reserved_0_12  : STM32_SVD.UInt13 := 16#0#;
      --  DAC channel1 DMA underrun flag
      DMAUDR1        : SR_DMAUDR1_Field := 16#0#;
      --  unspecified
      Reserved_14_28 : STM32_SVD.UInt15 := 16#0#;
      --  DAC channel2 DMA underrun flag
      DMAUDR2        : SR_DMAUDR2_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : STM32_SVD.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      Reserved_0_12  at 0 range 0 .. 12;
      DMAUDR1        at 0 range 13 .. 13;
      Reserved_14_28 at 0 range 14 .. 28;
      DMAUDR2        at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Digital-to-analog converter
   type DAC_Peripheral is record
      --  control register
      CR      : aliased CR_Register;
      --  software trigger register
      SWTRIGR : aliased SWTRIGR_Register;
      --  channel1 12-bit right-aligned data holding register
      DHR12R1 : aliased DHR12R1_Register;
      --  channel1 12-bit left aligned data holding register
      DHR12L1 : aliased DHR12L1_Register;
      --  channel1 8-bit right aligned data holding register
      DHR8R1  : aliased DHR8R1_Register;
      --  channel1 data output register
      DOR1    : aliased DOR1_Register;
      --  status register
      SR      : aliased SR_Register;
   end record
     with Volatile;

   for DAC_Peripheral use record
      CR      at 16#0# range 0 .. 31;
      SWTRIGR at 16#4# range 0 .. 31;
      DHR12R1 at 16#8# range 0 .. 31;
      DHR12L1 at 16#C# range 0 .. 31;
      DHR8R1  at 16#10# range 0 .. 31;
      DOR1    at 16#2C# range 0 .. 31;
      SR      at 16#34# range 0 .. 31;
   end record;

   --  Digital-to-analog converter
   DAC_Periph : aliased DAC_Peripheral
     with Import, Address => System'To_Address (16#40007400#);

end STM32_SVD.DAC;
