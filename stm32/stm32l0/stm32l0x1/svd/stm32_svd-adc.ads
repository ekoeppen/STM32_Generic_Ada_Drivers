pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.ADC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ISR_ADRDY_Field is STM32_SVD.Bit;
   subtype ISR_EOSMP_Field is STM32_SVD.Bit;
   subtype ISR_EOC_Field is STM32_SVD.Bit;
   subtype ISR_EOS_Field is STM32_SVD.Bit;
   subtype ISR_OVR_Field is STM32_SVD.Bit;
   subtype ISR_AWD_Field is STM32_SVD.Bit;
   subtype ISR_EOCAL_Field is STM32_SVD.Bit;

   --  interrupt and status register
   type ISR_Register is record
      --  ADC ready
      ADRDY          : ISR_ADRDY_Field := 16#0#;
      --  End of sampling flag
      EOSMP          : ISR_EOSMP_Field := 16#0#;
      --  End of conversion flag
      EOC            : ISR_EOC_Field := 16#0#;
      --  End of sequence flag
      EOS            : ISR_EOS_Field := 16#0#;
      --  ADC overrun
      OVR            : ISR_OVR_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : STM32_SVD.UInt2 := 16#0#;
      --  Analog watchdog flag
      AWD            : ISR_AWD_Field := 16#0#;
      --  unspecified
      Reserved_8_10  : STM32_SVD.UInt3 := 16#0#;
      --  End Of Calibration flag
      EOCAL          : ISR_EOCAL_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20 := 16#0#;
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

   subtype IER_ADRDYIE_Field is STM32_SVD.Bit;
   subtype IER_EOSMPIE_Field is STM32_SVD.Bit;
   subtype IER_EOCIE_Field is STM32_SVD.Bit;
   subtype IER_EOSIE_Field is STM32_SVD.Bit;
   subtype IER_OVRIE_Field is STM32_SVD.Bit;
   subtype IER_AWDIE_Field is STM32_SVD.Bit;
   subtype IER_EOCALIE_Field is STM32_SVD.Bit;

   --  interrupt enable register
   type IER_Register is record
      --  ADC ready interrupt enable
      ADRDYIE        : IER_ADRDYIE_Field := 16#0#;
      --  End of sampling flag interrupt enable
      EOSMPIE        : IER_EOSMPIE_Field := 16#0#;
      --  End of conversion interrupt enable
      EOCIE          : IER_EOCIE_Field := 16#0#;
      --  End of conversion sequence interrupt enable
      EOSIE          : IER_EOSIE_Field := 16#0#;
      --  Overrun interrupt enable
      OVRIE          : IER_OVRIE_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : STM32_SVD.UInt2 := 16#0#;
      --  Analog watchdog interrupt enable
      AWDIE          : IER_AWDIE_Field := 16#0#;
      --  unspecified
      Reserved_8_10  : STM32_SVD.UInt3 := 16#0#;
      --  End of calibration interrupt enable
      EOCALIE        : IER_EOCALIE_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20 := 16#0#;
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

   subtype CR_ADEN_Field is STM32_SVD.Bit;
   subtype CR_ADDIS_Field is STM32_SVD.Bit;
   subtype CR_ADSTART_Field is STM32_SVD.Bit;
   subtype CR_ADSTP_Field is STM32_SVD.Bit;
   subtype CR_ADVREGEN_Field is STM32_SVD.Bit;
   subtype CR_ADCAL_Field is STM32_SVD.Bit;

   --  control register
   type CR_Register is record
      --  ADC enable command
      ADEN           : CR_ADEN_Field := 16#0#;
      --  ADC disable command
      ADDIS          : CR_ADDIS_Field := 16#0#;
      --  ADC start conversion command
      ADSTART        : CR_ADSTART_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : STM32_SVD.Bit := 16#0#;
      --  ADC stop conversion command
      ADSTP          : CR_ADSTP_Field := 16#0#;
      --  unspecified
      Reserved_5_27  : STM32_SVD.UInt23 := 16#0#;
      --  ADC Voltage Regulator Enable
      ADVREGEN       : CR_ADVREGEN_Field := 16#0#;
      --  unspecified
      Reserved_29_30 : STM32_SVD.UInt2 := 16#0#;
      --  ADC calibration
      ADCAL          : CR_ADCAL_Field := 16#0#;
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

   subtype CFGR1_DMAEN_Field is STM32_SVD.Bit;
   subtype CFGR1_DMACFG_Field is STM32_SVD.Bit;
   subtype CFGR1_SCANDIR_Field is STM32_SVD.Bit;
   subtype CFGR1_RES_Field is STM32_SVD.UInt2;
   subtype CFGR1_ALIGN_Field is STM32_SVD.Bit;
   subtype CFGR1_EXTSEL_Field is STM32_SVD.UInt3;
   subtype CFGR1_EXTEN_Field is STM32_SVD.UInt2;
   subtype CFGR1_OVRMOD_Field is STM32_SVD.Bit;
   subtype CFGR1_CONT_Field is STM32_SVD.Bit;
   subtype CFGR1_AUTDLY_Field is STM32_SVD.Bit;
   subtype CFGR1_AUTOFF_Field is STM32_SVD.Bit;
   subtype CFGR1_DISCEN_Field is STM32_SVD.Bit;
   subtype CFGR1_AWDSGL_Field is STM32_SVD.Bit;
   subtype CFGR1_AWDEN_Field is STM32_SVD.Bit;
   subtype CFGR1_AWDCH_Field is STM32_SVD.UInt5;

   --  configuration register 1
   type CFGR1_Register is record
      --  Direct memory access enable
      DMAEN          : CFGR1_DMAEN_Field := 16#0#;
      --  Direct memery access configuration
      DMACFG         : CFGR1_DMACFG_Field := 16#0#;
      --  Scan sequence direction
      SCANDIR        : CFGR1_SCANDIR_Field := 16#0#;
      --  Data resolution
      RES            : CFGR1_RES_Field := 16#0#;
      --  Data alignment
      ALIGN          : CFGR1_ALIGN_Field := 16#0#;
      --  External trigger selection
      EXTSEL         : CFGR1_EXTSEL_Field := 16#0#;
      --  unspecified
      Reserved_9_9   : STM32_SVD.Bit := 16#0#;
      --  External trigger enable and polarity selection
      EXTEN          : CFGR1_EXTEN_Field := 16#0#;
      --  Overrun management mode
      OVRMOD         : CFGR1_OVRMOD_Field := 16#0#;
      --  Single / continuous conversion mode
      CONT           : CFGR1_CONT_Field := 16#0#;
      --  Auto-delayed conversion mode
      AUTDLY         : CFGR1_AUTDLY_Field := 16#0#;
      --  Auto-off mode
      AUTOFF         : CFGR1_AUTOFF_Field := 16#0#;
      --  Discontinuous mode
      DISCEN         : CFGR1_DISCEN_Field := 16#0#;
      --  unspecified
      Reserved_17_21 : STM32_SVD.UInt5 := 16#0#;
      --  Enable the watchdog on a single channel or on all channels
      AWDSGL         : CFGR1_AWDSGL_Field := 16#0#;
      --  Analog watchdog enable
      AWDEN          : CFGR1_AWDEN_Field := 16#0#;
      --  unspecified
      Reserved_24_25 : STM32_SVD.UInt2 := 16#0#;
      --  Analog watchdog channel selection
      AWDCH          : CFGR1_AWDCH_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : STM32_SVD.Bit := 16#0#;
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

   subtype CFGR2_OVSE_Field is STM32_SVD.Bit;
   subtype CFGR2_OVSR_Field is STM32_SVD.UInt3;
   subtype CFGR2_OVSS_Field is STM32_SVD.UInt4;
   subtype CFGR2_TOVS_Field is STM32_SVD.Bit;
   subtype CFGR2_CKMODE_Field is STM32_SVD.UInt2;

   --  configuration register 2
   type CFGR2_Register is record
      --  Oversampler Enable
      OVSE           : CFGR2_OVSE_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Oversampling ratio
      OVSR           : CFGR2_OVSR_Field := 16#0#;
      --  Oversampling shift
      OVSS           : CFGR2_OVSS_Field := 16#0#;
      --  Triggered Oversampling
      TOVS           : CFGR2_TOVS_Field := 16#0#;
      --  unspecified
      Reserved_10_29 : STM32_SVD.UInt20 := 16#0#;
      --  ADC clock mode
      CKMODE         : CFGR2_CKMODE_Field := 16#0#;
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

   subtype SMPR_SMPR_Field is STM32_SVD.UInt3;

   --  sampling time register
   type SMPR_Register is record
      --  Sampling time selection
      SMPR          : SMPR_SMPR_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : STM32_SVD.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMPR_Register use record
      SMPR          at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype TR_LT_Field is STM32_SVD.UInt12;
   subtype TR_HT_Field is STM32_SVD.UInt12;

   --  watchdog threshold register
   type TR_Register is record
      --  Analog watchdog lower threshold
      LT             : TR_LT_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : STM32_SVD.UInt4 := 16#0#;
      --  Analog watchdog higher threshold
      HT             : TR_HT_Field := 16#FFF#;
      --  unspecified
      Reserved_28_31 : STM32_SVD.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TR_Register use record
      LT             at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      HT             at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  CHSELR_CHSEL array element
   subtype CHSELR_CHSEL_Element is STM32_SVD.Bit;

   --  CHSELR_CHSEL array
   type CHSELR_CHSEL_Field_Array is array (0 .. 18) of CHSELR_CHSEL_Element
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
      CHSEL          : CHSELR_CHSEL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_19_31 : STM32_SVD.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CHSELR_Register use record
      CHSEL          at 0 range 0 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype DR_DATA_Field is STM32_SVD.UInt16;

   --  data register
   type DR_Register is record
      --  Read-only. Converted data
      DATA           : DR_DATA_Field;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DATA           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CALFACT_CALFACT_Field is STM32_SVD.UInt7;

   --  ADC Calibration factor
   type CALFACT_Register is record
      --  Calibration factor
      CALFACT       : CALFACT_CALFACT_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CALFACT_Register use record
      CALFACT       at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype CCR_PRESC_Field is STM32_SVD.UInt4;
   subtype CCR_VREFEN_Field is STM32_SVD.Bit;
   subtype CCR_TSEN_Field is STM32_SVD.Bit;
   subtype CCR_VLCDEN_Field is STM32_SVD.Bit;
   subtype CCR_LFMEN_Field is STM32_SVD.Bit;

   --  ADC common configuration register
   type CCR_Register is record
      --  unspecified
      Reserved_0_17  : STM32_SVD.UInt18 := 16#0#;
      --  ADC prescaler
      PRESC          : CCR_PRESC_Field := 16#0#;
      --  VREFINT enable
      VREFEN         : CCR_VREFEN_Field := 16#0#;
      --  Temperature sensor enable
      TSEN           : CCR_TSEN_Field := 16#0#;
      --  VLCD enable
      VLCDEN         : CCR_VLCDEN_Field := 16#0#;
      --  Low Frequency Mode enable
      LFMEN          : CCR_LFMEN_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : STM32_SVD.UInt6 := 16#0#;
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
