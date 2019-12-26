--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.ADC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  interrupt and status register
   type ISR_Register is record
      --  ADC ready
      ADRDY          : STM32_SVD.Bit;
      --  End of sampling flag
      EOSMP          : STM32_SVD.Bit;
      --  End of conversion flag
      EOC            : STM32_SVD.Bit;
      --  End of sequence flag
      EOS            : STM32_SVD.Bit;
      --  ADC overrun
      OVR            : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_6   : STM32_SVD.UInt2;
      --  Analog watchdog flag
      AWD            : STM32_SVD.Bit;
      --  unspecified
      Reserved_8_10  : STM32_SVD.UInt3;
      --  End Of Calibration flag
      EOCAL          : STM32_SVD.Bit;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      ADRDY          at 0 range 0 .. 0;
      EOSMP          at 0 range 1 .. 1;
      EOC            at 0 range 2 .. 2;
      EOS            at 0 range 3 .. 3;
      OVR            at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      AWD            at 0 range 7 .. 7;
      Reserved_8_10  at 0 range 8 .. 10;
      EOCAL          at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  interrupt enable register
   type IER_Register is record
      --  ADC ready interrupt enable
      ADRDYIE        : STM32_SVD.Bit;
      --  End of sampling flag interrupt enable
      EOSMPIE        : STM32_SVD.Bit;
      --  End of conversion interrupt enable
      EOCIE          : STM32_SVD.Bit;
      --  End of conversion sequence interrupt enable
      EOSIE          : STM32_SVD.Bit;
      --  Overrun interrupt enable
      OVRIE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_6   : STM32_SVD.UInt2;
      --  Analog watchdog interrupt enable
      AWDIE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_8_10  : STM32_SVD.UInt3;
      --  End of calibration interrupt enable
      EOCALIE        : STM32_SVD.Bit;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IER_Register use record
      ADRDYIE        at 0 range 0 .. 0;
      EOSMPIE        at 0 range 1 .. 1;
      EOCIE          at 0 range 2 .. 2;
      EOSIE          at 0 range 3 .. 3;
      OVRIE          at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      AWDIE          at 0 range 7 .. 7;
      Reserved_8_10  at 0 range 8 .. 10;
      EOCALIE        at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  control register
   type CR_Register is record
      --  ADC enable command
      ADEN           : STM32_SVD.Bit;
      --  ADC disable command
      ADDIS          : STM32_SVD.Bit;
      --  ADC start conversion command
      ADSTART        : STM32_SVD.Bit;
      --  unspecified
      Reserved_3_3   : STM32_SVD.Bit;
      --  ADC stop conversion command
      ADSTP          : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_27  : STM32_SVD.UInt23;
      --  ADC Voltage Regulator Enable
      ADVREGEN       : STM32_SVD.Bit;
      --  unspecified
      Reserved_29_30 : STM32_SVD.UInt2;
      --  ADC calibration
      ADCAL          : STM32_SVD.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      ADEN           at 0 range 0 .. 0;
      ADDIS          at 0 range 1 .. 1;
      ADSTART        at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      ADSTP          at 0 range 4 .. 4;
      Reserved_5_27  at 0 range 5 .. 27;
      ADVREGEN       at 0 range 28 .. 28;
      Reserved_29_30 at 0 range 29 .. 30;
      ADCAL          at 0 range 31 .. 31;
   end record;

   --  configuration register 1
   type CFGR1_Register is record
      --  Direct memory access enable
      DMAEN          : STM32_SVD.Bit;
      --  Direct memery access configuration
      DMACFG         : STM32_SVD.Bit;
      --  Scan sequence direction
      SCANDIR        : STM32_SVD.Bit;
      --  Data resolution
      RES            : STM32_SVD.UInt2;
      --  Data alignment
      ALIGN          : STM32_SVD.Bit;
      --  External trigger selection
      EXTSEL         : STM32_SVD.UInt3;
      --  unspecified
      Reserved_9_9   : STM32_SVD.Bit;
      --  External trigger enable and polarity selection
      EXTEN          : STM32_SVD.UInt2;
      --  Overrun management mode
      OVRMOD         : STM32_SVD.Bit;
      --  Single / continuous conversion mode
      CONT           : STM32_SVD.Bit;
      --  Auto-delayed conversion mode
      AUTDLY         : STM32_SVD.Bit;
      --  Auto-off mode
      AUTOFF         : STM32_SVD.Bit;
      --  Discontinuous mode
      DISCEN         : STM32_SVD.Bit;
      --  unspecified
      Reserved_17_21 : STM32_SVD.UInt5;
      --  Enable the watchdog on a single channel or on all channels
      AWDSGL         : STM32_SVD.Bit;
      --  Analog watchdog enable
      AWDEN          : STM32_SVD.Bit;
      --  unspecified
      Reserved_24_25 : STM32_SVD.UInt2;
      --  Analog watchdog channel selection
      AWDCH          : STM32_SVD.UInt5;
      --  unspecified
      Reserved_31_31 : STM32_SVD.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR1_Register use record
      DMAEN          at 0 range 0 .. 0;
      DMACFG         at 0 range 1 .. 1;
      SCANDIR        at 0 range 2 .. 2;
      RES            at 0 range 3 .. 4;
      ALIGN          at 0 range 5 .. 5;
      EXTSEL         at 0 range 6 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      EXTEN          at 0 range 10 .. 11;
      OVRMOD         at 0 range 12 .. 12;
      CONT           at 0 range 13 .. 13;
      AUTDLY         at 0 range 14 .. 14;
      AUTOFF         at 0 range 15 .. 15;
      DISCEN         at 0 range 16 .. 16;
      Reserved_17_21 at 0 range 17 .. 21;
      AWDSGL         at 0 range 22 .. 22;
      AWDEN          at 0 range 23 .. 23;
      Reserved_24_25 at 0 range 24 .. 25;
      AWDCH          at 0 range 26 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   --  configuration register 2
   type CFGR2_Register is record
      --  Oversampler Enable
      OVSE           : STM32_SVD.Bit;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit;
      --  Oversampling ratio
      OVSR           : STM32_SVD.UInt3;
      --  Oversampling shift
      OVSS           : STM32_SVD.UInt4;
      --  Triggered Oversampling
      TOVS           : STM32_SVD.Bit;
      --  unspecified
      Reserved_10_29 : STM32_SVD.UInt20;
      --  ADC clock mode
      CKMODE         : STM32_SVD.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR2_Register use record
      OVSE           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      OVSR           at 0 range 2 .. 4;
      OVSS           at 0 range 5 .. 8;
      TOVS           at 0 range 9 .. 9;
      Reserved_10_29 at 0 range 10 .. 29;
      CKMODE         at 0 range 30 .. 31;
   end record;

   --  sampling time register
   type SMPR_Register is record
      --  Sampling time selection
      SMPR          : STM32_SVD.UInt3;
      --  unspecified
      Reserved_3_31 : STM32_SVD.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMPR_Register use record
      SMPR          at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  watchdog threshold register
   type TR_Register is record
      --  Analog watchdog lower threshold
      LT             : STM32_SVD.UInt12;
      --  unspecified
      Reserved_12_15 : STM32_SVD.UInt4;
      --  Analog watchdog higher threshold
      HT             : STM32_SVD.UInt12;
      --  unspecified
      Reserved_28_31 : STM32_SVD.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TR_Register use record
      LT             at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      HT             at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  CHSELR_CHSEL array
   type CHSELR_CHSEL_Field_Array is array (0 .. 18) of STM32_SVD.Bit
     with Component_Size => 1, Size => 19;

   --  Type definition for CHSELR_CHSEL
   type CHSELR_CHSEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHSEL as a value
            Val : STM32_SVD.UInt19;
         when True =>
            --  CHSEL as an array
            Arr : CHSELR_CHSEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 19;

   for CHSELR_CHSEL_Field use record
      Val at 0 range 0 .. 18;
      Arr at 0 range 0 .. 18;
   end record;

   --  channel selection register
   type CHSELR_Register is record
      --  Channel-x selection
      CHSEL          : CHSELR_CHSEL_Field;
      --  unspecified
      Reserved_19_31 : STM32_SVD.UInt13;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHSELR_Register use record
      CHSEL          at 0 range 0 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   --  data register
   type DR_Register is record
      --  Read-only. Converted data
      DATA           : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DATA           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  ADC Calibration factor
   type CALFACT_Register is record
      --  Calibration factor
      CALFACT       : STM32_SVD.UInt7;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CALFACT_Register use record
      CALFACT       at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  ADC common configuration register
   type CCR_Register is record
      --  unspecified
      Reserved_0_17  : STM32_SVD.UInt18;
      --  ADC prescaler
      PRESC          : STM32_SVD.UInt4;
      --  VREFINT enable
      VREFEN         : STM32_SVD.Bit;
      --  Temperature sensor enable
      TSEN           : STM32_SVD.Bit;
      --  VLCD enable
      VLCDEN         : STM32_SVD.Bit;
      --  Low Frequency Mode enable
      LFMEN          : STM32_SVD.Bit;
      --  unspecified
      Reserved_26_31 : STM32_SVD.UInt6;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      Reserved_0_17  at 0 range 0 .. 17;
      PRESC          at 0 range 18 .. 21;
      VREFEN         at 0 range 22 .. 22;
      TSEN           at 0 range 23 .. 23;
      VLCDEN         at 0 range 24 .. 24;
      LFMEN          at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Analog-to-digital converter
   type ADC_Peripheral is record
      --  interrupt and status register
      ISR     : aliased ISR_Register;
      --  interrupt enable register
      IER     : aliased IER_Register;
      --  control register
      CR      : aliased CR_Register;
      --  configuration register 1
      CFGR1   : aliased CFGR1_Register;
      --  configuration register 2
      CFGR2   : aliased CFGR2_Register;
      --  sampling time register
      SMPR    : aliased SMPR_Register;
      --  watchdog threshold register
      TR      : aliased TR_Register;
      --  channel selection register
      CHSELR  : aliased CHSELR_Register;
      --  data register
      DR      : aliased DR_Register;
      --  ADC Calibration factor
      CALFACT : aliased CALFACT_Register;
      --  ADC common configuration register
      CCR     : aliased CCR_Register;
   end record
     with Volatile;

   for ADC_Peripheral use record
      ISR     at 16#0# range 0 .. 31;
      IER     at 16#4# range 0 .. 31;
      CR      at 16#8# range 0 .. 31;
      CFGR1   at 16#C# range 0 .. 31;
      CFGR2   at 16#10# range 0 .. 31;
      SMPR    at 16#14# range 0 .. 31;
      TR      at 16#20# range 0 .. 31;
      CHSELR  at 16#28# range 0 .. 31;
      DR      at 16#40# range 0 .. 31;
      CALFACT at 16#B4# range 0 .. 31;
      CCR     at 16#308# range 0 .. 31;
   end record;

   --  Analog-to-digital converter
   ADC_Periph : aliased ADC_Peripheral
     with Import, Address => ADC_Base;

end STM32_SVD.ADC;
