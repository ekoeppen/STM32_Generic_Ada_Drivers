pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x3.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.DAC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_EN1_Field is STM32_SVD.Bit;
   subtype CR_BOFF1_Field is STM32_SVD.Bit;
   subtype CR_TEN1_Field is STM32_SVD.Bit;
   subtype CR_TSEL1_Field is STM32_SVD.UInt3;
   subtype CR_WAVE1_Field is STM32_SVD.UInt2;
   subtype CR_MAMP1_Field is STM32_SVD.UInt4;
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
      TSEL1          : CR_TSEL1_Field := 16#0#;
      --  DAC channel1 noise/triangle wave generation enable
      WAVE1          : CR_WAVE1_Field := 16#0#;
      --  DAC channel1 mask/amplitude selector
      MAMP1          : CR_MAMP1_Field := 16#0#;
      --  DAC channel1 DMA enable
      DMAEN1         : CR_DMAEN1_Field := 16#0#;
      --  DAC channel1 DMA Underrun Interrupt enable
      DMAUDRIE1      : CR_DMAUDRIE1_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      EN1            at 0 range 0 .. 0;
      BOFF1          at 0 range 1 .. 1;
      TEN1           at 0 range 2 .. 2;
      TSEL1          at 0 range 3 .. 5;
      WAVE1          at 0 range 6 .. 7;
      MAMP1          at 0 range 8 .. 11;
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
     with Volatile_Full_Access, Object_Size => 32,
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
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR12R1_Register use record
      DACC1DHR       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype DHR12L1_DACC1DHR_Field is STM32_SVD.UInt12;

   --  channel1 12-bit left-aligned data holding register
   type DHR12L1_Register is record
      --  unspecified
      Reserved_0_3   : STM32_SVD.UInt4 := 16#0#;
      --  DAC channel1 12-bit left-aligned data
      DACC1DHR       : DHR12L1_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR12L1_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      DACC1DHR       at 0 range 4 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DHR8R1_DACC1DHR_Field is STM32_SVD.Byte;

   --  channel1 8-bit right-aligned data holding register
   type DHR8R1_Register is record
      --  DAC channel1 8-bit right-aligned data
      DACC1DHR      : DHR8R1_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR8R1_Register use record
      DACC1DHR      at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DHR12R2_DACC2DHR_Field is STM32_SVD.UInt12;

   --  channel2 12-bit right-aligned data holding register
   type DHR12R2_Register is record
      --  DAC channel2 12-bit right-aligned data
      DACC2DHR       : DHR12R2_DACC2DHR_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR12R2_Register use record
      DACC2DHR       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype DHR12L2_DACC2DHR_Field is STM32_SVD.UInt12;

   --  channel2 12-bit left-aligned data holding register
   type DHR12L2_Register is record
      --  unspecified
      Reserved_0_3   : STM32_SVD.UInt4 := 16#0#;
      --  DAC channel2 12-bit left-aligned data
      DACC2DHR       : DHR12L2_DACC2DHR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR12L2_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      DACC2DHR       at 0 range 4 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DHR8R2_DACC2DHR_Field is STM32_SVD.Byte;

   --  channel2 8-bit right-aligned data holding register
   type DHR8R2_Register is record
      --  DAC channel2 8-bit right-aligned data
      DACC2DHR      : DHR8R2_DACC2DHR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR8R2_Register use record
      DACC2DHR      at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DHR12RD_DACC1DHR_Field is STM32_SVD.UInt12;
   subtype DHR12RD_DACC2DHR_Field is STM32_SVD.UInt12;

   --  Dual DAC 12-bit right-aligned data holding register
   type DHR12RD_Register is record
      --  DAC channel1 12-bit right-aligned data
      DACC1DHR       : DHR12RD_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : STM32_SVD.UInt4 := 16#0#;
      --  DAC channel2 12-bit right-aligned data
      DACC2DHR       : DHR12RD_DACC2DHR_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : STM32_SVD.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR12RD_Register use record
      DACC1DHR       at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DACC2DHR       at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype DHR12LD_DACC1DHR_Field is STM32_SVD.UInt12;
   subtype DHR12LD_DACC2DHR_Field is STM32_SVD.UInt12;

   --  Dual DAC 12-bit left-aligned data holding register
   type DHR12LD_Register is record
      --  unspecified
      Reserved_0_3   : STM32_SVD.UInt4 := 16#0#;
      --  DAC channel1 12-bit left-aligned data
      DACC1DHR       : DHR12LD_DACC1DHR_Field := 16#0#;
      --  unspecified
      Reserved_16_19 : STM32_SVD.UInt4 := 16#0#;
      --  DAC channel2 12-bit left-aligned data
      DACC2DHR       : DHR12LD_DACC2DHR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR12LD_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      DACC1DHR       at 0 range 4 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      DACC2DHR       at 0 range 20 .. 31;
   end record;

   subtype DHR8RD_DACC1DHR_Field is STM32_SVD.Byte;
   subtype DHR8RD_DACC2DHR_Field is STM32_SVD.Byte;

   --  Dual DAC 8-bit right-aligned data holding register
   type DHR8RD_Register is record
      --  DAC channel1 8-bit right-aligned data
      DACC1DHR       : DHR8RD_DACC1DHR_Field := 16#0#;
      --  DAC channel2 8-bit right-aligned data
      DACC2DHR       : DHR8RD_DACC2DHR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHR8RD_Register use record
      DACC1DHR       at 0 range 0 .. 7;
      DACC2DHR       at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype DOR1_DACC1DOR_Field is STM32_SVD.UInt12;

   --  channel1 data output register
   type DOR1_Register is record
      --  Read-only. DAC channel1 data output
      DACC1DOR       : DOR1_DACC1DOR_Field;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DOR1_Register use record
      DACC1DOR       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype DOR2_DACC2DOR_Field is STM32_SVD.UInt12;

   --  channel2 data output register
   type DOR2_Register is record
      --  Read-only. DAC channel2 data output
      DACC2DOR       : DOR2_DACC2DOR_Field;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DOR2_Register use record
      DACC2DOR       at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype SR_DMAUDR1_Field is STM32_SVD.Bit;

   --  status register
   type SR_Register is record
      --  unspecified
      Reserved_0_12  : STM32_SVD.UInt13 := 16#0#;
      --  DAC channel1 DMA underrun flag
      DMAUDR1        : SR_DMAUDR1_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      Reserved_0_12  at 0 range 0 .. 12;
      DMAUDR1        at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
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
      --  channel1 12-bit left-aligned data holding register
      DHR12L1 : aliased DHR12L1_Register;
      --  channel1 8-bit right-aligned data holding register
      DHR8R1  : aliased DHR8R1_Register;
      --  channel2 12-bit right-aligned data holding register
      DHR12R2 : aliased DHR12R2_Register;
      --  channel2 12-bit left-aligned data holding register
      DHR12L2 : aliased DHR12L2_Register;
      --  channel2 8-bit right-aligned data holding register
      DHR8R2  : aliased DHR8R2_Register;
      --  Dual DAC 12-bit right-aligned data holding register
      DHR12RD : aliased DHR12RD_Register;
      --  Dual DAC 12-bit left-aligned data holding register
      DHR12LD : aliased DHR12LD_Register;
      --  Dual DAC 8-bit right-aligned data holding register
      DHR8RD  : aliased DHR8RD_Register;
      --  channel1 data output register
      DOR1    : aliased DOR1_Register;
      --  channel2 data output register
      DOR2    : aliased DOR2_Register;
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
      DHR12R2 at 16#14# range 0 .. 31;
      DHR12L2 at 16#18# range 0 .. 31;
      DHR8R2  at 16#1C# range 0 .. 31;
      DHR12RD at 16#20# range 0 .. 31;
      DHR12LD at 16#24# range 0 .. 31;
      DHR8RD  at 16#28# range 0 .. 31;
      DOR1    at 16#2C# range 0 .. 31;
      DOR2    at 16#30# range 0 .. 31;
      SR      at 16#34# range 0 .. 31;
   end record;

   --  Digital-to-analog converter
   DAC_Periph : aliased DAC_Peripheral
     with Import, Address => DAC_Base;

end STM32_SVD.DAC;
