--  This spec has been automatically generated from STM32F303xE.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.TIMs is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_CEN_Field is STM32_SVD.Bit;
   subtype CR1_UDIS_Field is STM32_SVD.Bit;
   subtype CR1_URS_Field is STM32_SVD.Bit;
   subtype CR1_OPM_Field is STM32_SVD.Bit;
   subtype CR1_DIR_Field is STM32_SVD.Bit;
   subtype CR1_CMS_Field is STM32_SVD.UInt2;
   subtype CR1_ARPE_Field is STM32_SVD.Bit;
   subtype CR1_CKD_Field is STM32_SVD.UInt2;
   subtype CR1_UIFREMAP_Field is STM32_SVD.Bit;

   --  control register 1
   type CR1_Register is record
      --  Counter enable
      CEN            : CR1_CEN_Field := 16#0#;
      --  Update disable
      UDIS           : CR1_UDIS_Field := 16#0#;
      --  Update request source
      URS            : CR1_URS_Field := 16#0#;
      --  One-pulse mode
      OPM            : CR1_OPM_Field := 16#0#;
      --  Direction
      DIR            : CR1_DIR_Field := 16#0#;
      --  Center-aligned mode selection
      CMS            : CR1_CMS_Field := 16#0#;
      --  Auto-reload preload enable
      ARPE           : CR1_ARPE_Field := 16#0#;
      --  Clock division
      CKD            : CR1_CKD_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : STM32_SVD.Bit := 16#0#;
      --  UIF status bit remapping
      UIFREMAP       : CR1_UIFREMAP_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      CEN            at 0 range 0 .. 0;
      UDIS           at 0 range 1 .. 1;
      URS            at 0 range 2 .. 2;
      OPM            at 0 range 3 .. 3;
      DIR            at 0 range 4 .. 4;
      CMS            at 0 range 5 .. 6;
      ARPE           at 0 range 7 .. 7;
      CKD            at 0 range 8 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CR2_CCPC_Field is STM32_SVD.Bit;
   subtype CR2_CCUS_Field is STM32_SVD.Bit;
   subtype CR2_CCDS_Field is STM32_SVD.Bit;
   subtype CR2_MMS_Field is STM32_SVD.UInt3;
   subtype CR2_TI1S_Field is STM32_SVD.Bit;
   subtype CR2_OIS1_Field is STM32_SVD.Bit;
   subtype CR2_OIS1N_Field is STM32_SVD.Bit;
   subtype CR2_OIS2_Field is STM32_SVD.Bit;
   subtype CR2_OIS2N_Field is STM32_SVD.Bit;
   subtype CR2_OIS3_Field is STM32_SVD.Bit;
   subtype CR2_OIS3N_Field is STM32_SVD.Bit;
   subtype CR2_OIS4_Field is STM32_SVD.Bit;
   subtype CR2_OIS5_Field is STM32_SVD.Bit;
   subtype CR2_OIS6_Field is STM32_SVD.Bit;
   subtype CR2_MMS2_Field is STM32_SVD.UInt4;

   --  control register 2
   type CR2_Register is record
      --  Capture/compare preloaded control
      CCPC           : CR2_CCPC_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Capture/compare control update selection
      CCUS           : CR2_CCUS_Field := 16#0#;
      --  Capture/compare DMA selection
      CCDS           : CR2_CCDS_Field := 16#0#;
      --  Master mode selection
      MMS            : CR2_MMS_Field := 16#0#;
      --  TI1 selection
      TI1S           : CR2_TI1S_Field := 16#0#;
      --  Output Idle state 1
      OIS1           : CR2_OIS1_Field := 16#0#;
      --  Output Idle state 1
      OIS1N          : CR2_OIS1N_Field := 16#0#;
      --  Output Idle state 2
      OIS2           : CR2_OIS2_Field := 16#0#;
      --  Output Idle state 2
      OIS2N          : CR2_OIS2N_Field := 16#0#;
      --  Output Idle state 3
      OIS3           : CR2_OIS3_Field := 16#0#;
      --  Output Idle state 3
      OIS3N          : CR2_OIS3N_Field := 16#0#;
      --  Output Idle state 4
      OIS4           : CR2_OIS4_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : STM32_SVD.Bit := 16#0#;
      --  Output Idle state 5
      OIS5           : CR2_OIS5_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : STM32_SVD.Bit := 16#0#;
      --  Output Idle state 6
      OIS6           : CR2_OIS6_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : STM32_SVD.Bit := 16#0#;
      --  Master mode selection 2
      MMS2           : CR2_MMS2_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      MMS            at 0 range 4 .. 6;
      TI1S           at 0 range 7 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      OIS2           at 0 range 10 .. 10;
      OIS2N          at 0 range 11 .. 11;
      OIS3           at 0 range 12 .. 12;
      OIS3N          at 0 range 13 .. 13;
      OIS4           at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      OIS5           at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      OIS6           at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      MMS2           at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SMCR_SMS_Field is STM32_SVD.UInt3;
   subtype SMCR_OCCS_Field is STM32_SVD.Bit;
   subtype SMCR_TS_Field is STM32_SVD.UInt3;
   subtype SMCR_MSM_Field is STM32_SVD.Bit;
   subtype SMCR_ETF_Field is STM32_SVD.UInt4;
   subtype SMCR_ETPS_Field is STM32_SVD.UInt2;
   subtype SMCR_ECE_Field is STM32_SVD.Bit;
   subtype SMCR_ETP_Field is STM32_SVD.Bit;
   subtype SMCR_SMS3_Field is STM32_SVD.Bit;

   --  slave mode control register
   type SMCR_Register is record
      --  Slave mode selection
      SMS            : SMCR_SMS_Field := 16#0#;
      --  OCREF clear selection
      OCCS           : SMCR_OCCS_Field := 16#0#;
      --  Trigger selection
      TS             : SMCR_TS_Field := 16#0#;
      --  Master/Slave mode
      MSM            : SMCR_MSM_Field := 16#0#;
      --  External trigger filter
      ETF            : SMCR_ETF_Field := 16#0#;
      --  External trigger prescaler
      ETPS           : SMCR_ETPS_Field := 16#0#;
      --  External clock enable
      ECE            : SMCR_ECE_Field := 16#0#;
      --  External trigger polarity
      ETP            : SMCR_ETP_Field := 16#0#;
      --  Slave mode selection bit 3
      SMS3           : SMCR_SMS3_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : STM32_SVD.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register use record
      SMS            at 0 range 0 .. 2;
      OCCS           at 0 range 3 .. 3;
      TS             at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      ETF            at 0 range 8 .. 11;
      ETPS           at 0 range 12 .. 13;
      ECE            at 0 range 14 .. 14;
      ETP            at 0 range 15 .. 15;
      SMS3           at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype DIER_UIE_Field is STM32_SVD.Bit;
   subtype DIER_CC1IE_Field is STM32_SVD.Bit;
   subtype DIER_CC2IE_Field is STM32_SVD.Bit;
   subtype DIER_CC3IE_Field is STM32_SVD.Bit;
   subtype DIER_CC4IE_Field is STM32_SVD.Bit;
   subtype DIER_COMIE_Field is STM32_SVD.Bit;
   subtype DIER_TIE_Field is STM32_SVD.Bit;
   subtype DIER_BIE_Field is STM32_SVD.Bit;
   subtype DIER_UDE_Field is STM32_SVD.Bit;
   subtype DIER_CC1DE_Field is STM32_SVD.Bit;
   subtype DIER_CC2DE_Field is STM32_SVD.Bit;
   subtype DIER_CC3DE_Field is STM32_SVD.Bit;
   subtype DIER_CC4DE_Field is STM32_SVD.Bit;
   subtype DIER_COMDE_Field is STM32_SVD.Bit;
   subtype DIER_TDE_Field is STM32_SVD.Bit;

   --  DMA/Interrupt enable register
   type DIER_Register is record
      --  Update interrupt enable
      UIE            : DIER_UIE_Field := 16#0#;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : DIER_CC1IE_Field := 16#0#;
      --  Capture/Compare 2 interrupt enable
      CC2IE          : DIER_CC2IE_Field := 16#0#;
      --  Capture/Compare 3 interrupt enable
      CC3IE          : DIER_CC3IE_Field := 16#0#;
      --  Capture/Compare 4 interrupt enable
      CC4IE          : DIER_CC4IE_Field := 16#0#;
      --  COM interrupt enable
      COMIE          : DIER_COMIE_Field := 16#0#;
      --  Trigger interrupt enable
      TIE            : DIER_TIE_Field := 16#0#;
      --  Break interrupt enable
      BIE            : DIER_BIE_Field := 16#0#;
      --  Update DMA request enable
      UDE            : DIER_UDE_Field := 16#0#;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : DIER_CC1DE_Field := 16#0#;
      --  Capture/Compare 2 DMA request enable
      CC2DE          : DIER_CC2DE_Field := 16#0#;
      --  Capture/Compare 3 DMA request enable
      CC3DE          : DIER_CC3DE_Field := 16#0#;
      --  Capture/Compare 4 DMA request enable
      CC4DE          : DIER_CC4DE_Field := 16#0#;
      --  Reserved
      COMDE          : DIER_COMDE_Field := 16#0#;
      --  Trigger DMA request enable
      TDE            : DIER_TDE_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      CC2IE          at 0 range 2 .. 2;
      CC3IE          at 0 range 3 .. 3;
      CC4IE          at 0 range 4 .. 4;
      COMIE          at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      CC2DE          at 0 range 10 .. 10;
      CC3DE          at 0 range 11 .. 11;
      CC4DE          at 0 range 12 .. 12;
      COMDE          at 0 range 13 .. 13;
      TDE            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype SR_UIF_Field is STM32_SVD.Bit;
   subtype SR_CC1IF_Field is STM32_SVD.Bit;
   subtype SR_CC2IF_Field is STM32_SVD.Bit;
   subtype SR_CC3IF_Field is STM32_SVD.Bit;
   subtype SR_CC4IF_Field is STM32_SVD.Bit;
   subtype SR_COMIF_Field is STM32_SVD.Bit;
   subtype SR_TIF_Field is STM32_SVD.Bit;
   subtype SR_BIF_Field is STM32_SVD.Bit;
   subtype SR_B2IF_Field is STM32_SVD.Bit;
   subtype SR_CC1OF_Field is STM32_SVD.Bit;
   subtype SR_CC2OF_Field is STM32_SVD.Bit;
   subtype SR_CC3OF_Field is STM32_SVD.Bit;
   subtype SR_CC4OF_Field is STM32_SVD.Bit;
   subtype SR_C5IF_Field is STM32_SVD.Bit;
   subtype SR_C6IF_Field is STM32_SVD.Bit;

   --  status register
   type SR_Register is record
      --  Update interrupt flag
      UIF            : SR_UIF_Field := 16#0#;
      --  Capture/compare 1 interrupt flag
      CC1IF          : SR_CC1IF_Field := 16#0#;
      --  Capture/Compare 2 interrupt flag
      CC2IF          : SR_CC2IF_Field := 16#0#;
      --  Capture/Compare 3 interrupt flag
      CC3IF          : SR_CC3IF_Field := 16#0#;
      --  Capture/Compare 4 interrupt flag
      CC4IF          : SR_CC4IF_Field := 16#0#;
      --  COM interrupt flag
      COMIF          : SR_COMIF_Field := 16#0#;
      --  Trigger interrupt flag
      TIF            : SR_TIF_Field := 16#0#;
      --  Break interrupt flag
      BIF            : SR_BIF_Field := 16#0#;
      --  Break 2 interrupt flag
      B2IF           : SR_B2IF_Field := 16#0#;
      --  Capture/Compare 1 overcapture flag
      CC1OF          : SR_CC1OF_Field := 16#0#;
      --  Capture/compare 2 overcapture flag
      CC2OF          : SR_CC2OF_Field := 16#0#;
      --  Capture/Compare 3 overcapture flag
      CC3OF          : SR_CC3OF_Field := 16#0#;
      --  Capture/Compare 4 overcapture flag
      CC4OF          : SR_CC4OF_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : STM32_SVD.UInt3 := 16#0#;
      --  Capture/Compare 5 interrupt flag
      C5IF           : SR_C5IF_Field := 16#0#;
      --  Capture/Compare 6 interrupt flag
      C6IF           : SR_C6IF_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : STM32_SVD.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      CC3IF          at 0 range 3 .. 3;
      CC4IF          at 0 range 4 .. 4;
      COMIF          at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      B2IF           at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      CC3OF          at 0 range 11 .. 11;
      CC4OF          at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      C5IF           at 0 range 16 .. 16;
      C6IF           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype EGR_UG_Field is STM32_SVD.Bit;
   subtype EGR_CC1G_Field is STM32_SVD.Bit;
   subtype EGR_CC2G_Field is STM32_SVD.Bit;
   subtype EGR_CC3G_Field is STM32_SVD.Bit;
   subtype EGR_CC4G_Field is STM32_SVD.Bit;
   subtype EGR_COMG_Field is STM32_SVD.Bit;
   subtype EGR_TG_Field is STM32_SVD.Bit;
   subtype EGR_BG_Field is STM32_SVD.Bit;
   subtype EGR_B2G_Field is STM32_SVD.Bit;

   --  event generation register
   type EGR_Register is record
      --  Write-only. Update generation
      UG            : EGR_UG_Field := 16#0#;
      --  Write-only. Capture/compare 1 generation
      CC1G          : EGR_CC1G_Field := 16#0#;
      --  Write-only. Capture/compare 2 generation
      CC2G          : EGR_CC2G_Field := 16#0#;
      --  Write-only. Capture/compare 3 generation
      CC3G          : EGR_CC3G_Field := 16#0#;
      --  Write-only. Capture/compare 4 generation
      CC4G          : EGR_CC4G_Field := 16#0#;
      --  Write-only. Capture/Compare control update generation
      COMG          : EGR_COMG_Field := 16#0#;
      --  Write-only. Trigger generation
      TG            : EGR_TG_Field := 16#0#;
      --  Write-only. Break generation
      BG            : EGR_BG_Field := 16#0#;
      --  Write-only. Break 2 generation
      B2G           : EGR_B2G_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      CC3G          at 0 range 3 .. 3;
      CC4G          at 0 range 4 .. 4;
      COMG          at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      B2G           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype CCMR1_Output_CC1S_Field is STM32_SVD.UInt2;
   subtype CCMR1_Output_OC1FE_Field is STM32_SVD.Bit;
   subtype CCMR1_Output_OC1PE_Field is STM32_SVD.Bit;
   subtype CCMR1_Output_OC1M_Field is STM32_SVD.UInt3;
   subtype CCMR1_Output_OC1CE_Field is STM32_SVD.Bit;
   subtype CCMR1_Output_CC2S_Field is STM32_SVD.UInt2;
   subtype CCMR1_Output_OC2FE_Field is STM32_SVD.Bit;
   subtype CCMR1_Output_OC2PE_Field is STM32_SVD.Bit;
   subtype CCMR1_Output_OC2M_Field is STM32_SVD.UInt3;
   subtype CCMR1_Output_OC2CE_Field is STM32_SVD.Bit;
   subtype CCMR1_Output_OC1M_3_Field is STM32_SVD.Bit;
   subtype CCMR1_Output_OC2M_3_Field is STM32_SVD.Bit;

   --  capture/compare mode register (output mode)
   type CCMR1_Output_Register is record
      --  Capture/Compare 1 selection
      CC1S           : CCMR1_Output_CC1S_Field := 16#0#;
      --  Output Compare 1 fast enable
      OC1FE          : CCMR1_Output_OC1FE_Field := 16#0#;
      --  Output Compare 1 preload enable
      OC1PE          : CCMR1_Output_OC1PE_Field := 16#0#;
      --  Output Compare 1 mode
      OC1M           : CCMR1_Output_OC1M_Field := 16#0#;
      --  Output Compare 1 clear enable
      OC1CE          : CCMR1_Output_OC1CE_Field := 16#0#;
      --  Capture/Compare 2 selection
      CC2S           : CCMR1_Output_CC2S_Field := 16#0#;
      --  Output Compare 2 fast enable
      OC2FE          : CCMR1_Output_OC2FE_Field := 16#0#;
      --  Output Compare 2 preload enable
      OC2PE          : CCMR1_Output_OC2PE_Field := 16#0#;
      --  Output Compare 2 mode
      OC2M           : CCMR1_Output_OC2M_Field := 16#0#;
      --  Output Compare 2 clear enable
      OC2CE          : CCMR1_Output_OC2CE_Field := 16#0#;
      --  Output Compare 1 mode bit 3
      OC1M_3         : CCMR1_Output_OC1M_3_Field := 16#0#;
      --  unspecified
      Reserved_17_23 : STM32_SVD.UInt7 := 16#0#;
      --  Output Compare 2 mode bit 3
      OC2M_3         : CCMR1_Output_OC2M_3_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Output_Register use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      OC1CE          at 0 range 7 .. 7;
      CC2S           at 0 range 8 .. 9;
      OC2FE          at 0 range 10 .. 10;
      OC2PE          at 0 range 11 .. 11;
      OC2M           at 0 range 12 .. 14;
      OC2CE          at 0 range 15 .. 15;
      OC1M_3         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC2M_3         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CCMR1_Input_CC1S_Field is STM32_SVD.UInt2;
   subtype CCMR1_Input_IC1PCS_Field is STM32_SVD.UInt2;
   subtype CCMR1_Input_IC1F_Field is STM32_SVD.UInt4;
   subtype CCMR1_Input_CC2S_Field is STM32_SVD.UInt2;
   subtype CCMR1_Input_IC2PCS_Field is STM32_SVD.UInt2;
   subtype CCMR1_Input_IC2F_Field is STM32_SVD.UInt4;

   --  capture/compare mode register 1 (input mode)
   type CCMR1_Input_Register is record
      --  Capture/Compare 1 selection
      CC1S           : CCMR1_Input_CC1S_Field := 16#0#;
      --  Input capture 1 prescaler
      IC1PCS         : CCMR1_Input_IC1PCS_Field := 16#0#;
      --  Input capture 1 filter
      IC1F           : CCMR1_Input_IC1F_Field := 16#0#;
      --  Capture/Compare 2 selection
      CC2S           : CCMR1_Input_CC2S_Field := 16#0#;
      --  Input capture 2 prescaler
      IC2PCS         : CCMR1_Input_IC2PCS_Field := 16#0#;
      --  Input capture 2 filter
      IC2F           : CCMR1_Input_IC2F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Input_Register use record
      CC1S           at 0 range 0 .. 1;
      IC1PCS         at 0 range 2 .. 3;
      IC1F           at 0 range 4 .. 7;
      CC2S           at 0 range 8 .. 9;
      IC2PCS         at 0 range 10 .. 11;
      IC2F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCMR2_Output_CC3S_Field is STM32_SVD.UInt2;
   subtype CCMR2_Output_OC3FE_Field is STM32_SVD.Bit;
   subtype CCMR2_Output_OC3PE_Field is STM32_SVD.Bit;
   subtype CCMR2_Output_OC3M_Field is STM32_SVD.UInt3;
   subtype CCMR2_Output_OC3CE_Field is STM32_SVD.Bit;
   subtype CCMR2_Output_CC4S_Field is STM32_SVD.UInt2;
   subtype CCMR2_Output_OC4FE_Field is STM32_SVD.Bit;
   subtype CCMR2_Output_OC4PE_Field is STM32_SVD.Bit;
   subtype CCMR2_Output_OC4M_Field is STM32_SVD.UInt3;
   subtype CCMR2_Output_OC4CE_Field is STM32_SVD.Bit;
   subtype CCMR2_Output_OC3M_3_Field is STM32_SVD.Bit;
   subtype CCMR2_Output_OC4M_3_Field is STM32_SVD.Bit;

   --  capture/compare mode register (output mode)
   type CCMR2_Output_Register is record
      --  Capture/Compare 3 selection
      CC3S           : CCMR2_Output_CC3S_Field := 16#0#;
      --  Output compare 3 fast enable
      OC3FE          : CCMR2_Output_OC3FE_Field := 16#0#;
      --  Output compare 3 preload enable
      OC3PE          : CCMR2_Output_OC3PE_Field := 16#0#;
      --  Output compare 3 mode
      OC3M           : CCMR2_Output_OC3M_Field := 16#0#;
      --  Output compare 3 clear enable
      OC3CE          : CCMR2_Output_OC3CE_Field := 16#0#;
      --  Capture/Compare 4 selection
      CC4S           : CCMR2_Output_CC4S_Field := 16#0#;
      --  Output compare 4 fast enable
      OC4FE          : CCMR2_Output_OC4FE_Field := 16#0#;
      --  Output compare 4 preload enable
      OC4PE          : CCMR2_Output_OC4PE_Field := 16#0#;
      --  Output compare 4 mode
      OC4M           : CCMR2_Output_OC4M_Field := 16#0#;
      --  Output compare 4 clear enable
      OC4CE          : CCMR2_Output_OC4CE_Field := 16#0#;
      --  Output Compare 3 mode bit 3
      OC3M_3         : CCMR2_Output_OC3M_3_Field := 16#0#;
      --  unspecified
      Reserved_17_23 : STM32_SVD.UInt7 := 16#0#;
      --  Output Compare 4 mode bit 3
      OC4M_3         : CCMR2_Output_OC4M_3_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_Output_Register use record
      CC3S           at 0 range 0 .. 1;
      OC3FE          at 0 range 2 .. 2;
      OC3PE          at 0 range 3 .. 3;
      OC3M           at 0 range 4 .. 6;
      OC3CE          at 0 range 7 .. 7;
      CC4S           at 0 range 8 .. 9;
      OC4FE          at 0 range 10 .. 10;
      OC4PE          at 0 range 11 .. 11;
      OC4M           at 0 range 12 .. 14;
      OC4CE          at 0 range 15 .. 15;
      OC3M_3         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC4M_3         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CCMR2_Input_CC3S_Field is STM32_SVD.UInt2;
   subtype CCMR2_Input_IC3PSC_Field is STM32_SVD.UInt2;
   subtype CCMR2_Input_IC3F_Field is STM32_SVD.UInt4;
   subtype CCMR2_Input_CC4S_Field is STM32_SVD.UInt2;
   subtype CCMR2_Input_IC4PSC_Field is STM32_SVD.UInt2;
   subtype CCMR2_Input_IC4F_Field is STM32_SVD.UInt4;

   --  capture/compare mode register 2 (input mode)
   type CCMR2_Input_Register is record
      --  Capture/compare 3 selection
      CC3S           : CCMR2_Input_CC3S_Field := 16#0#;
      --  Input capture 3 prescaler
      IC3PSC         : CCMR2_Input_IC3PSC_Field := 16#0#;
      --  Input capture 3 filter
      IC3F           : CCMR2_Input_IC3F_Field := 16#0#;
      --  Capture/Compare 4 selection
      CC4S           : CCMR2_Input_CC4S_Field := 16#0#;
      --  Input capture 4 prescaler
      IC4PSC         : CCMR2_Input_IC4PSC_Field := 16#0#;
      --  Input capture 4 filter
      IC4F           : CCMR2_Input_IC4F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_Input_Register use record
      CC3S           at 0 range 0 .. 1;
      IC3PSC         at 0 range 2 .. 3;
      IC3F           at 0 range 4 .. 7;
      CC4S           at 0 range 8 .. 9;
      IC4PSC         at 0 range 10 .. 11;
      IC4F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCER_CC1E_Field is STM32_SVD.Bit;
   subtype CCER_CC1P_Field is STM32_SVD.Bit;
   subtype CCER_CC1NE_Field is STM32_SVD.Bit;
   subtype CCER_CC1NP_Field is STM32_SVD.Bit;
   subtype CCER_CC2E_Field is STM32_SVD.Bit;
   subtype CCER_CC2P_Field is STM32_SVD.Bit;
   subtype CCER_CC2NE_Field is STM32_SVD.Bit;
   subtype CCER_CC2NP_Field is STM32_SVD.Bit;
   subtype CCER_CC3E_Field is STM32_SVD.Bit;
   subtype CCER_CC3P_Field is STM32_SVD.Bit;
   subtype CCER_CC3NE_Field is STM32_SVD.Bit;
   subtype CCER_CC3NP_Field is STM32_SVD.Bit;
   subtype CCER_CC4E_Field is STM32_SVD.Bit;
   subtype CCER_CC4P_Field is STM32_SVD.Bit;
   subtype CCER_CC4NP_Field is STM32_SVD.Bit;
   subtype CCER_CC5E_Field is STM32_SVD.Bit;
   subtype CCER_CC5P_Field is STM32_SVD.Bit;
   subtype CCER_CC6E_Field is STM32_SVD.Bit;
   subtype CCER_CC6P_Field is STM32_SVD.Bit;

   --  capture/compare enable register
   type CCER_Register is record
      --  Capture/Compare 1 output enable
      CC1E           : CCER_CC1E_Field := 16#0#;
      --  Capture/Compare 1 output Polarity
      CC1P           : CCER_CC1P_Field := 16#0#;
      --  Capture/Compare 1 complementary output enable
      CC1NE          : CCER_CC1NE_Field := 16#0#;
      --  Capture/Compare 1 output Polarity
      CC1NP          : CCER_CC1NP_Field := 16#0#;
      --  Capture/Compare 2 output enable
      CC2E           : CCER_CC2E_Field := 16#0#;
      --  Capture/Compare 2 output Polarity
      CC2P           : CCER_CC2P_Field := 16#0#;
      --  Capture/Compare 2 complementary output enable
      CC2NE          : CCER_CC2NE_Field := 16#0#;
      --  Capture/Compare 2 output Polarity
      CC2NP          : CCER_CC2NP_Field := 16#0#;
      --  Capture/Compare 3 output enable
      CC3E           : CCER_CC3E_Field := 16#0#;
      --  Capture/Compare 3 output Polarity
      CC3P           : CCER_CC3P_Field := 16#0#;
      --  Capture/Compare 3 complementary output enable
      CC3NE          : CCER_CC3NE_Field := 16#0#;
      --  Capture/Compare 3 output Polarity
      CC3NP          : CCER_CC3NP_Field := 16#0#;
      --  Capture/Compare 4 output enable
      CC4E           : CCER_CC4E_Field := 16#0#;
      --  Capture/Compare 3 output Polarity
      CC4P           : CCER_CC4P_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Capture/Compare 4 output Polarity
      CC4NP          : CCER_CC4NP_Field := 16#0#;
      --  Capture/Compare 5 output enable
      CC5E           : CCER_CC5E_Field := 16#0#;
      --  Capture/Compare 5 output Polarity
      CC5P           : CCER_CC5P_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : STM32_SVD.UInt2 := 16#0#;
      --  Capture/Compare 6 output enable
      CC6E           : CCER_CC6E_Field := 16#0#;
      --  Capture/Compare 6 output Polarity
      CC6P           : CCER_CC6P_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : STM32_SVD.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register use record
      CC1E           at 0 range 0 .. 0;
      CC1P           at 0 range 1 .. 1;
      CC1NE          at 0 range 2 .. 2;
      CC1NP          at 0 range 3 .. 3;
      CC2E           at 0 range 4 .. 4;
      CC2P           at 0 range 5 .. 5;
      CC2NE          at 0 range 6 .. 6;
      CC2NP          at 0 range 7 .. 7;
      CC3E           at 0 range 8 .. 8;
      CC3P           at 0 range 9 .. 9;
      CC3NE          at 0 range 10 .. 10;
      CC3NP          at 0 range 11 .. 11;
      CC4E           at 0 range 12 .. 12;
      CC4P           at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      CC4NP          at 0 range 15 .. 15;
      CC5E           at 0 range 16 .. 16;
      CC5P           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      CC6E           at 0 range 20 .. 20;
      CC6P           at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype CNT_CNT_Field is STM32_SVD.UInt16;
   subtype CNT_UIFCPY_Field is STM32_SVD.Bit;

   --  counter
   type CNT_Register is record
      --  counter value
      CNT            : CNT_CNT_Field := 16#0#;
      --  unspecified
      Reserved_16_30 : STM32_SVD.UInt15 := 16#0#;
      --  Read-only. UIF copy
      UIFCPY         : CNT_UIFCPY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register use record
      CNT            at 0 range 0 .. 15;
      Reserved_16_30 at 0 range 16 .. 30;
      UIFCPY         at 0 range 31 .. 31;
   end record;

   subtype PSC_PSC_Field is STM32_SVD.UInt16;

   --  prescaler
   type PSC_Register is record
      --  Prescaler value
      PSC            : PSC_PSC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PSC_Register use record
      PSC            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ARR_ARR_Field is STM32_SVD.UInt16;

   --  auto-reload register
   type ARR_Register is record
      --  Auto-reload value
      ARR            : ARR_ARR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARR_Register use record
      ARR            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RCR_REP_Field is STM32_SVD.UInt16;

   --  repetition counter register
   type RCR_Register is record
      --  Repetition counter value
      REP            : RCR_REP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RCR_Register use record
      REP            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR1_CCR1_Field is STM32_SVD.UInt16;

   --  capture/compare register 1
   type CCR1_Register is record
      --  Capture/Compare 1 value
      CCR1           : CCR1_CCR1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR1_Register use record
      CCR1           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR2_CCR2_Field is STM32_SVD.UInt16;

   --  capture/compare register 2
   type CCR2_Register is record
      --  Capture/Compare 2 value
      CCR2           : CCR2_CCR2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR2_Register use record
      CCR2           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR3_CCR3_Field is STM32_SVD.UInt16;

   --  capture/compare register 3
   type CCR3_Register is record
      --  Capture/Compare 3 value
      CCR3           : CCR3_CCR3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR3_Register use record
      CCR3           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR4_CCR4_Field is STM32_SVD.UInt16;

   --  capture/compare register 4
   type CCR4_Register is record
      --  Capture/Compare 3 value
      CCR4           : CCR4_CCR4_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR4_Register use record
      CCR4           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BDTR_DTG_Field is STM32_SVD.Byte;
   subtype BDTR_LOCK_Field is STM32_SVD.UInt2;
   subtype BDTR_OSSI_Field is STM32_SVD.Bit;
   subtype BDTR_OSSR_Field is STM32_SVD.Bit;
   subtype BDTR_BKE_Field is STM32_SVD.Bit;
   subtype BDTR_BKP_Field is STM32_SVD.Bit;
   subtype BDTR_AOE_Field is STM32_SVD.Bit;
   subtype BDTR_MOE_Field is STM32_SVD.Bit;
   subtype BDTR_BKF_Field is STM32_SVD.UInt4;
   subtype BDTR_BK2F_Field is STM32_SVD.UInt4;
   subtype BDTR_BK2E_Field is STM32_SVD.Bit;
   subtype BDTR_BK2P_Field is STM32_SVD.Bit;

   --  break and dead-time register
   type BDTR_Register is record
      --  Dead-time generator setup
      DTG            : BDTR_DTG_Field := 16#0#;
      --  Lock configuration
      LOCK           : BDTR_LOCK_Field := 16#0#;
      --  Off-state selection for Idle mode
      OSSI           : BDTR_OSSI_Field := 16#0#;
      --  Off-state selection for Run mode
      OSSR           : BDTR_OSSR_Field := 16#0#;
      --  Break enable
      BKE            : BDTR_BKE_Field := 16#0#;
      --  Break polarity
      BKP            : BDTR_BKP_Field := 16#0#;
      --  Automatic output enable
      AOE            : BDTR_AOE_Field := 16#0#;
      --  Main output enable
      MOE            : BDTR_MOE_Field := 16#0#;
      --  Break filter
      BKF            : BDTR_BKF_Field := 16#0#;
      --  Break 2 filter
      BK2F           : BDTR_BK2F_Field := 16#0#;
      --  Break 2 enable
      BK2E           : BDTR_BK2E_Field := 16#0#;
      --  Break 2 polarity
      BK2P           : BDTR_BK2P_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : STM32_SVD.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BDTR_Register use record
      DTG            at 0 range 0 .. 7;
      LOCK           at 0 range 8 .. 9;
      OSSI           at 0 range 10 .. 10;
      OSSR           at 0 range 11 .. 11;
      BKE            at 0 range 12 .. 12;
      BKP            at 0 range 13 .. 13;
      AOE            at 0 range 14 .. 14;
      MOE            at 0 range 15 .. 15;
      BKF            at 0 range 16 .. 19;
      BK2F           at 0 range 20 .. 23;
      BK2E           at 0 range 24 .. 24;
      BK2P           at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype DCR_DBA_Field is STM32_SVD.UInt5;
   subtype DCR_DBL_Field is STM32_SVD.UInt5;

   --  DMA control register
   type DCR_Register is record
      --  DMA base address
      DBA            : DCR_DBA_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : STM32_SVD.UInt3 := 16#0#;
      --  DMA burst length
      DBL            : DCR_DBL_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : STM32_SVD.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCR_Register use record
      DBA            at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DBL            at 0 range 8 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype DMAR_DMAB_Field is STM32_SVD.UInt16;

   --  DMA address for full transfer
   type DMAR_Register is record
      --  DMA register for burst accesses
      DMAB           : DMAR_DMAB_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAR_Register use record
      DMAB           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCMR3_Output_OC5FE_Field is STM32_SVD.Bit;
   subtype CCMR3_Output_OC5PE_Field is STM32_SVD.Bit;
   subtype CCMR3_Output_OC5M_Field is STM32_SVD.UInt3;
   subtype CCMR3_Output_OC5CE_Field is STM32_SVD.Bit;
   subtype CCMR3_Output_OC6FE_Field is STM32_SVD.Bit;
   subtype CCMR3_Output_OC6PE_Field is STM32_SVD.Bit;
   subtype CCMR3_Output_OC6M_Field is STM32_SVD.UInt3;
   subtype CCMR3_Output_OC6CE_Field is STM32_SVD.Bit;
   subtype CCMR3_Output_OC5M_3_Field is STM32_SVD.Bit;
   subtype CCMR3_Output_OC6M_3_Field is STM32_SVD.Bit;

   --  capture/compare mode register 3 (output mode)
   type CCMR3_Output_Register is record
      --  unspecified
      Reserved_0_1   : STM32_SVD.UInt2 := 16#0#;
      --  Output compare 5 fast enable
      OC5FE          : CCMR3_Output_OC5FE_Field := 16#0#;
      --  Output compare 5 preload enable
      OC5PE          : CCMR3_Output_OC5PE_Field := 16#0#;
      --  Output compare 5 mode
      OC5M           : CCMR3_Output_OC5M_Field := 16#0#;
      --  Output compare 5 clear enable
      OC5CE          : CCMR3_Output_OC5CE_Field := 16#0#;
      --  unspecified
      Reserved_8_9   : STM32_SVD.UInt2 := 16#0#;
      --  Output compare 6 fast enable
      OC6FE          : CCMR3_Output_OC6FE_Field := 16#0#;
      --  Output compare 6 preload enable
      OC6PE          : CCMR3_Output_OC6PE_Field := 16#0#;
      --  Output compare 6 mode
      OC6M           : CCMR3_Output_OC6M_Field := 16#0#;
      --  Output compare 6 clear enable
      OC6CE          : CCMR3_Output_OC6CE_Field := 16#0#;
      --  Outout Compare 5 mode bit 3
      OC5M_3         : CCMR3_Output_OC5M_3_Field := 16#0#;
      --  unspecified
      Reserved_17_23 : STM32_SVD.UInt7 := 16#0#;
      --  Outout Compare 6 mode bit 3
      OC6M_3         : CCMR3_Output_OC6M_3_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR3_Output_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      OC5FE          at 0 range 2 .. 2;
      OC5PE          at 0 range 3 .. 3;
      OC5M           at 0 range 4 .. 6;
      OC5CE          at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      OC6FE          at 0 range 10 .. 10;
      OC6PE          at 0 range 11 .. 11;
      OC6M           at 0 range 12 .. 14;
      OC6CE          at 0 range 15 .. 15;
      OC5M_3         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC6M_3         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CCR5_CCR5_Field is STM32_SVD.UInt16;
   --  CCR5_GC5C array element
   subtype CCR5_GC5C_Element is STM32_SVD.Bit;

   --  CCR5_GC5C array
   type CCR5_GC5C_Field_Array is array (1 .. 3) of CCR5_GC5C_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for CCR5_GC5C
   type CCR5_GC5C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GC5C as a value
            Val : STM32_SVD.UInt3;
         when True =>
            --  GC5C as an array
            Arr : CCR5_GC5C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for CCR5_GC5C_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  capture/compare register 5
   type CCR5_Register is record
      --  Capture/Compare 5 value
      CCR5           : CCR5_CCR5_Field := 16#0#;
      --  unspecified
      Reserved_16_28 : STM32_SVD.UInt13 := 16#0#;
      --  Group Channel 5 and Channel 1
      GC5C           : CCR5_GC5C_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR5_Register use record
      CCR5           at 0 range 0 .. 15;
      Reserved_16_28 at 0 range 16 .. 28;
      GC5C           at 0 range 29 .. 31;
   end record;

   subtype CCR6_CCR6_Field is STM32_SVD.UInt16;

   --  capture/compare register 6
   type CCR6_Register is record
      --  Capture/Compare 6 value
      CCR6           : CCR6_CCR6_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR6_Register use record
      CCR6           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OR_TIM1_ETR_ADC1_RMP_Field is STM32_SVD.UInt2;
   subtype OR_TIM1_ETR_ADC4_RMP_Field is STM32_SVD.UInt2;

   --  option registers
   type OR_Register is record
      --  TIM1_ETR_ADC1 remapping capability
      TIM1_ETR_ADC1_RMP : OR_TIM1_ETR_ADC1_RMP_Field := 16#0#;
      --  TIM1_ETR_ADC4 remapping capability
      TIM1_ETR_ADC4_RMP : OR_TIM1_ETR_ADC4_RMP_Field := 16#0#;
      --  unspecified
      Reserved_4_31     : STM32_SVD.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR_Register use record
      TIM1_ETR_ADC1_RMP at 0 range 0 .. 1;
      TIM1_ETR_ADC4_RMP at 0 range 2 .. 3;
      Reserved_4_31     at 0 range 4 .. 31;
   end record;

   --  control register 2
   type CR2_Register_1 is record
      --  unspecified
      Reserved_0_2  : STM32_SVD.UInt3 := 16#0#;
      --  Capture/compare DMA selection
      CCDS          : CR2_CCDS_Field := 16#0#;
      --  Master mode selection
      MMS           : CR2_MMS_Field := 16#0#;
      --  TI1 selection
      TI1S          : CR2_TI1S_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_1 use record
      Reserved_0_2  at 0 range 0 .. 2;
      CCDS          at 0 range 3 .. 3;
      MMS           at 0 range 4 .. 6;
      TI1S          at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SMCR_SMS_3_Field is STM32_SVD.Bit;

   --  slave mode control register
   type SMCR_Register_1 is record
      --  Slave mode selection
      SMS            : SMCR_SMS_Field := 16#0#;
      --  OCREF clear selection
      OCCS           : SMCR_OCCS_Field := 16#0#;
      --  Trigger selection
      TS             : SMCR_TS_Field := 16#0#;
      --  Master/Slave mode
      MSM            : SMCR_MSM_Field := 16#0#;
      --  External trigger filter
      ETF            : SMCR_ETF_Field := 16#0#;
      --  External trigger prescaler
      ETPS           : SMCR_ETPS_Field := 16#0#;
      --  External clock enable
      ECE            : SMCR_ECE_Field := 16#0#;
      --  External trigger polarity
      ETP            : SMCR_ETP_Field := 16#0#;
      --  Slave mode selection bit3
      SMS_3          : SMCR_SMS_3_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : STM32_SVD.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register_1 use record
      SMS            at 0 range 0 .. 2;
      OCCS           at 0 range 3 .. 3;
      TS             at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      ETF            at 0 range 8 .. 11;
      ETPS           at 0 range 12 .. 13;
      ECE            at 0 range 14 .. 14;
      ETP            at 0 range 15 .. 15;
      SMS_3          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  DMA/Interrupt enable register
   type DIER_Register_1 is record
      --  Update interrupt enable
      UIE            : DIER_UIE_Field := 16#0#;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : DIER_CC1IE_Field := 16#0#;
      --  Capture/Compare 2 interrupt enable
      CC2IE          : DIER_CC2IE_Field := 16#0#;
      --  Capture/Compare 3 interrupt enable
      CC3IE          : DIER_CC3IE_Field := 16#0#;
      --  Capture/Compare 4 interrupt enable
      CC4IE          : DIER_CC4IE_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : STM32_SVD.Bit := 16#0#;
      --  Trigger interrupt enable
      TIE            : DIER_TIE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit := 16#0#;
      --  Update DMA request enable
      UDE            : DIER_UDE_Field := 16#0#;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : DIER_CC1DE_Field := 16#0#;
      --  Capture/Compare 2 DMA request enable
      CC2DE          : DIER_CC2DE_Field := 16#0#;
      --  Capture/Compare 3 DMA request enable
      CC3DE          : DIER_CC3DE_Field := 16#0#;
      --  Capture/Compare 4 DMA request enable
      CC4DE          : DIER_CC4DE_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : STM32_SVD.Bit := 16#0#;
      --  Trigger DMA request enable
      TDE            : DIER_TDE_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_1 use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      CC2IE          at 0 range 2 .. 2;
      CC3IE          at 0 range 3 .. 3;
      CC4IE          at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      CC2DE          at 0 range 10 .. 10;
      CC3DE          at 0 range 11 .. 11;
      CC4DE          at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      TDE            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  status register
   type SR_Register_1 is record
      --  Update interrupt flag
      UIF            : SR_UIF_Field := 16#0#;
      --  Capture/compare 1 interrupt flag
      CC1IF          : SR_CC1IF_Field := 16#0#;
      --  Capture/Compare 2 interrupt flag
      CC2IF          : SR_CC2IF_Field := 16#0#;
      --  Capture/Compare 3 interrupt flag
      CC3IF          : SR_CC3IF_Field := 16#0#;
      --  Capture/Compare 4 interrupt flag
      CC4IF          : SR_CC4IF_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : STM32_SVD.Bit := 16#0#;
      --  Trigger interrupt flag
      TIF            : SR_TIF_Field := 16#0#;
      --  unspecified
      Reserved_7_8   : STM32_SVD.UInt2 := 16#0#;
      --  Capture/Compare 1 overcapture flag
      CC1OF          : SR_CC1OF_Field := 16#0#;
      --  Capture/compare 2 overcapture flag
      CC2OF          : SR_CC2OF_Field := 16#0#;
      --  Capture/Compare 3 overcapture flag
      CC3OF          : SR_CC3OF_Field := 16#0#;
      --  Capture/Compare 4 overcapture flag
      CC4OF          : SR_CC4OF_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : STM32_SVD.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register_1 use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      CC3IF          at 0 range 3 .. 3;
      CC4IF          at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      CC3OF          at 0 range 11 .. 11;
      CC4OF          at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  event generation register
   type EGR_Register_1 is record
      --  Write-only. Update generation
      UG            : EGR_UG_Field := 16#0#;
      --  Write-only. Capture/compare 1 generation
      CC1G          : EGR_CC1G_Field := 16#0#;
      --  Write-only. Capture/compare 2 generation
      CC2G          : EGR_CC2G_Field := 16#0#;
      --  Write-only. Capture/compare 3 generation
      CC3G          : EGR_CC3G_Field := 16#0#;
      --  Write-only. Capture/compare 4 generation
      CC4G          : EGR_CC4G_Field := 16#0#;
      --  unspecified
      Reserved_5_5  : STM32_SVD.Bit := 16#0#;
      --  Write-only. Trigger generation
      TG            : EGR_TG_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_1 use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      CC3G          at 0 range 3 .. 3;
      CC4G          at 0 range 4 .. 4;
      Reserved_5_5  at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype CCMR1_Input_IC1PSC_Field is STM32_SVD.UInt2;
   subtype CCMR1_Input_IC2PSC_Field is STM32_SVD.UInt2;

   --  capture/compare mode register 1 (input mode)
   type CCMR1_Input_Register_1 is record
      --  Capture/Compare 1 selection
      CC1S           : CCMR1_Input_CC1S_Field := 16#0#;
      --  Input capture 1 prescaler
      IC1PSC         : CCMR1_Input_IC1PSC_Field := 16#0#;
      --  Input capture 1 filter
      IC1F           : CCMR1_Input_IC1F_Field := 16#0#;
      --  Capture/compare 2 selection
      CC2S           : CCMR1_Input_CC2S_Field := 16#0#;
      --  Input capture 2 prescaler
      IC2PSC         : CCMR1_Input_IC2PSC_Field := 16#0#;
      --  Input capture 2 filter
      IC2F           : CCMR1_Input_IC2F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Input_Register_1 use record
      CC1S           at 0 range 0 .. 1;
      IC1PSC         at 0 range 2 .. 3;
      IC1F           at 0 range 4 .. 7;
      CC2S           at 0 range 8 .. 9;
      IC2PSC         at 0 range 10 .. 11;
      IC2F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCMR2_Output_O24CE_Field is STM32_SVD.Bit;

   --  capture/compare mode register 2 (output mode)
   type CCMR2_Output_Register_1 is record
      --  Capture/Compare 3 selection
      CC3S           : CCMR2_Output_CC3S_Field := 16#0#;
      --  Output compare 3 fast enable
      OC3FE          : CCMR2_Output_OC3FE_Field := 16#0#;
      --  Output compare 3 preload enable
      OC3PE          : CCMR2_Output_OC3PE_Field := 16#0#;
      --  Output compare 3 mode
      OC3M           : CCMR2_Output_OC3M_Field := 16#0#;
      --  Output compare 3 clear enable
      OC3CE          : CCMR2_Output_OC3CE_Field := 16#0#;
      --  Capture/Compare 4 selection
      CC4S           : CCMR2_Output_CC4S_Field := 16#0#;
      --  Output compare 4 fast enable
      OC4FE          : CCMR2_Output_OC4FE_Field := 16#0#;
      --  Output compare 4 preload enable
      OC4PE          : CCMR2_Output_OC4PE_Field := 16#0#;
      --  Output compare 4 mode
      OC4M           : CCMR2_Output_OC4M_Field := 16#0#;
      --  Output compare 4 clear enable
      O24CE          : CCMR2_Output_O24CE_Field := 16#0#;
      --  Output compare 3 mode bit3
      OC3M_3         : CCMR2_Output_OC3M_3_Field := 16#0#;
      --  unspecified
      Reserved_17_23 : STM32_SVD.UInt7 := 16#0#;
      --  Output compare 4 mode bit3
      OC4M_3         : CCMR2_Output_OC4M_3_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_Output_Register_1 use record
      CC3S           at 0 range 0 .. 1;
      OC3FE          at 0 range 2 .. 2;
      OC3PE          at 0 range 3 .. 3;
      OC3M           at 0 range 4 .. 6;
      OC3CE          at 0 range 7 .. 7;
      CC4S           at 0 range 8 .. 9;
      OC4FE          at 0 range 10 .. 10;
      OC4PE          at 0 range 11 .. 11;
      OC4M           at 0 range 12 .. 14;
      O24CE          at 0 range 15 .. 15;
      OC3M_3         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC4M_3         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  capture/compare enable register
   type CCER_Register_1 is record
      --  Capture/Compare 1 output enable
      CC1E           : CCER_CC1E_Field := 16#0#;
      --  Capture/Compare 1 output Polarity
      CC1P           : CCER_CC1P_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : STM32_SVD.Bit := 16#0#;
      --  Capture/Compare 1 output Polarity
      CC1NP          : CCER_CC1NP_Field := 16#0#;
      --  Capture/Compare 2 output enable
      CC2E           : CCER_CC2E_Field := 16#0#;
      --  Capture/Compare 2 output Polarity
      CC2P           : CCER_CC2P_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : STM32_SVD.Bit := 16#0#;
      --  Capture/Compare 2 output Polarity
      CC2NP          : CCER_CC2NP_Field := 16#0#;
      --  Capture/Compare 3 output enable
      CC3E           : CCER_CC3E_Field := 16#0#;
      --  Capture/Compare 3 output Polarity
      CC3P           : CCER_CC3P_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : STM32_SVD.Bit := 16#0#;
      --  Capture/Compare 3 output Polarity
      CC3NP          : CCER_CC3NP_Field := 16#0#;
      --  Capture/Compare 4 output enable
      CC4E           : CCER_CC4E_Field := 16#0#;
      --  Capture/Compare 3 output Polarity
      CC4P           : CCER_CC4P_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Capture/Compare 3 output Polarity
      CC4NP          : CCER_CC4NP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register_1 use record
      CC1E           at 0 range 0 .. 0;
      CC1P           at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      CC1NP          at 0 range 3 .. 3;
      CC2E           at 0 range 4 .. 4;
      CC2P           at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      CC2NP          at 0 range 7 .. 7;
      CC3E           at 0 range 8 .. 8;
      CC3P           at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      CC3NP          at 0 range 11 .. 11;
      CC4E           at 0 range 12 .. 12;
      CC4P           at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      CC4NP          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CNT_CNTL_Field is STM32_SVD.UInt16;
   subtype CNT_CNTH_Field is STM32_SVD.UInt15;
   subtype CNT_CNT_or_UIFCPY_Field is STM32_SVD.Bit;

   --  counter
   type CNT_Register_1 is record
      --  Low counter value
      CNTL          : CNT_CNTL_Field := 16#0#;
      --  High counter value
      CNTH          : CNT_CNTH_Field := 16#0#;
      --  if IUFREMAP=0 than CNT with read write access else UIFCPY with read
      --  only access
      CNT_or_UIFCPY : CNT_CNT_or_UIFCPY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register_1 use record
      CNTL          at 0 range 0 .. 15;
      CNTH          at 0 range 16 .. 30;
      CNT_or_UIFCPY at 0 range 31 .. 31;
   end record;

   subtype ARR_ARRL_Field is STM32_SVD.UInt16;
   subtype ARR_ARRH_Field is STM32_SVD.UInt16;

   --  auto-reload register
   type ARR_Register_1 is record
      --  Low Auto-reload value
      ARRL : ARR_ARRL_Field := 16#0#;
      --  High Auto-reload value
      ARRH : ARR_ARRH_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARR_Register_1 use record
      ARRL at 0 range 0 .. 15;
      ARRH at 0 range 16 .. 31;
   end record;

   subtype CCR1_CCR1L_Field is STM32_SVD.UInt16;
   subtype CCR1_CCR1H_Field is STM32_SVD.UInt16;

   --  capture/compare register 1
   type CCR1_Register_1 is record
      --  Low Capture/Compare 1 value
      CCR1L : CCR1_CCR1L_Field := 16#0#;
      --  High Capture/Compare 1 value (on TIM2)
      CCR1H : CCR1_CCR1H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR1_Register_1 use record
      CCR1L at 0 range 0 .. 15;
      CCR1H at 0 range 16 .. 31;
   end record;

   subtype CCR2_CCR2L_Field is STM32_SVD.UInt16;
   subtype CCR2_CCR2H_Field is STM32_SVD.UInt16;

   --  capture/compare register 2
   type CCR2_Register_1 is record
      --  Low Capture/Compare 2 value
      CCR2L : CCR2_CCR2L_Field := 16#0#;
      --  High Capture/Compare 2 value (on TIM2)
      CCR2H : CCR2_CCR2H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR2_Register_1 use record
      CCR2L at 0 range 0 .. 15;
      CCR2H at 0 range 16 .. 31;
   end record;

   subtype CCR3_CCR3L_Field is STM32_SVD.UInt16;
   subtype CCR3_CCR3H_Field is STM32_SVD.UInt16;

   --  capture/compare register 3
   type CCR3_Register_1 is record
      --  Low Capture/Compare value
      CCR3L : CCR3_CCR3L_Field := 16#0#;
      --  High Capture/Compare value (on TIM2)
      CCR3H : CCR3_CCR3H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR3_Register_1 use record
      CCR3L at 0 range 0 .. 15;
      CCR3H at 0 range 16 .. 31;
   end record;

   subtype CCR4_CCR4L_Field is STM32_SVD.UInt16;
   subtype CCR4_CCR4H_Field is STM32_SVD.UInt16;

   --  capture/compare register 4
   type CCR4_Register_1 is record
      --  Low Capture/Compare value
      CCR4L : CCR4_CCR4L_Field := 16#0#;
      --  High Capture/Compare value (on TIM2)
      CCR4H : CCR4_CCR4H_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR4_Register_1 use record
      CCR4L at 0 range 0 .. 15;
      CCR4H at 0 range 16 .. 31;
   end record;

   --  control register 1
   type CR1_Register_1 is record
      --  Counter enable
      CEN            : CR1_CEN_Field := 16#0#;
      --  Update disable
      UDIS           : CR1_UDIS_Field := 16#0#;
      --  Update request source
      URS            : CR1_URS_Field := 16#0#;
      --  One-pulse mode
      OPM            : CR1_OPM_Field := 16#0#;
      --  unspecified
      Reserved_4_6   : STM32_SVD.UInt3 := 16#0#;
      --  Auto-reload preload enable
      ARPE           : CR1_ARPE_Field := 16#0#;
      --  unspecified
      Reserved_8_10  : STM32_SVD.UInt3 := 16#0#;
      --  UIF status bit remapping
      UIFREMAP       : CR1_UIFREMAP_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register_1 use record
      CEN            at 0 range 0 .. 0;
      UDIS           at 0 range 1 .. 1;
      URS            at 0 range 2 .. 2;
      OPM            at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      ARPE           at 0 range 7 .. 7;
      Reserved_8_10  at 0 range 8 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  control register 2
   type CR2_Register_2 is record
      --  unspecified
      Reserved_0_3  : STM32_SVD.UInt4 := 16#0#;
      --  Master mode selection
      MMS           : CR2_MMS_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_2 use record
      Reserved_0_3  at 0 range 0 .. 3;
      MMS           at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  DMA/Interrupt enable register
   type DIER_Register_2 is record
      --  Update interrupt enable
      UIE           : DIER_UIE_Field := 16#0#;
      --  unspecified
      Reserved_1_7  : STM32_SVD.UInt7 := 16#0#;
      --  Update DMA request enable
      UDE           : DIER_UDE_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_2 use record
      UIE           at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      UDE           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  status register
   type SR_Register_2 is record
      --  Update interrupt flag
      UIF           : SR_UIF_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : STM32_SVD.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register_2 use record
      UIF           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  event generation register
   type EGR_Register_2 is record
      --  Write-only. Update generation
      UG            : EGR_UG_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : STM32_SVD.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_2 use record
      UG            at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype OR_TIM8_ETR_ADC2_RMP_Field is STM32_SVD.UInt2;
   subtype OR_TIM8_ETR_ADC3_RMP_Field is STM32_SVD.UInt2;

   --  option registers
   type OR_Register_1 is record
      --  TIM8_ETR_ADC2 remapping capability
      TIM8_ETR_ADC2_RMP : OR_TIM8_ETR_ADC2_RMP_Field := 16#0#;
      --  TIM8_ETR_ADC3 remapping capability
      TIM8_ETR_ADC3_RMP : OR_TIM8_ETR_ADC3_RMP_Field := 16#0#;
      --  unspecified
      Reserved_4_31     : STM32_SVD.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR_Register_1 use record
      TIM8_ETR_ADC2_RMP at 0 range 0 .. 1;
      TIM8_ETR_ADC3_RMP at 0 range 2 .. 3;
      Reserved_4_31     at 0 range 4 .. 31;
   end record;

   --  control register 1
   type CR1_Register_2 is record
      --  Counter enable
      CEN            : CR1_CEN_Field := 16#0#;
      --  Update disable
      UDIS           : CR1_UDIS_Field := 16#0#;
      --  Update request source
      URS            : CR1_URS_Field := 16#0#;
      --  One-pulse mode
      OPM            : CR1_OPM_Field := 16#0#;
      --  unspecified
      Reserved_4_6   : STM32_SVD.UInt3 := 16#0#;
      --  Auto-reload preload enable
      ARPE           : CR1_ARPE_Field := 16#0#;
      --  Clock division
      CKD            : CR1_CKD_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : STM32_SVD.Bit := 16#0#;
      --  UIF status bit remapping
      UIFREMAP       : CR1_UIFREMAP_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register_2 use record
      CEN            at 0 range 0 .. 0;
      UDIS           at 0 range 1 .. 1;
      URS            at 0 range 2 .. 2;
      OPM            at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      ARPE           at 0 range 7 .. 7;
      CKD            at 0 range 8 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  control register 2
   type CR2_Register_3 is record
      --  Capture/compare preloaded control
      CCPC           : CR2_CCPC_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Capture/compare control update selection
      CCUS           : CR2_CCUS_Field := 16#0#;
      --  Capture/compare DMA selection
      CCDS           : CR2_CCDS_Field := 16#0#;
      --  Master mode selection
      MMS            : CR2_MMS_Field := 16#0#;
      --  TI1 selection
      TI1S           : CR2_TI1S_Field := 16#0#;
      --  Output Idle state 1
      OIS1           : CR2_OIS1_Field := 16#0#;
      --  Output Idle state 1
      OIS1N          : CR2_OIS1N_Field := 16#0#;
      --  Output Idle state 2
      OIS2           : CR2_OIS2_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : STM32_SVD.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_3 use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      MMS            at 0 range 4 .. 6;
      TI1S           at 0 range 7 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      OIS2           at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  slave mode control register
   type SMCR_Register_2 is record
      --  Slave mode selection
      SMS            : SMCR_SMS_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : STM32_SVD.Bit := 16#0#;
      --  Trigger selection
      TS             : SMCR_TS_Field := 16#0#;
      --  Master/Slave mode
      MSM            : SMCR_MSM_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : STM32_SVD.Byte := 16#0#;
      --  Slave mode selection bit 3
      SMS_3          : SMCR_SMS_3_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : STM32_SVD.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register_2 use record
      SMS            at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      TS             at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      SMS_3          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  DMA/Interrupt enable register
   type DIER_Register_3 is record
      --  Update interrupt enable
      UIE            : DIER_UIE_Field := 16#0#;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : DIER_CC1IE_Field := 16#0#;
      --  Capture/Compare 2 interrupt enable
      CC2IE          : DIER_CC2IE_Field := 16#0#;
      --  unspecified
      Reserved_3_4   : STM32_SVD.UInt2 := 16#0#;
      --  COM interrupt enable
      COMIE          : DIER_COMIE_Field := 16#0#;
      --  Trigger interrupt enable
      TIE            : DIER_TIE_Field := 16#0#;
      --  Break interrupt enable
      BIE            : DIER_BIE_Field := 16#0#;
      --  Update DMA request enable
      UDE            : DIER_UDE_Field := 16#0#;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : DIER_CC1DE_Field := 16#0#;
      --  Capture/Compare 2 DMA request enable
      CC2DE          : DIER_CC2DE_Field := 16#0#;
      --  unspecified
      Reserved_11_12 : STM32_SVD.UInt2 := 16#0#;
      --  COM DMA request enable
      COMDE          : DIER_COMDE_Field := 16#0#;
      --  Trigger DMA request enable
      TDE            : DIER_TDE_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_3 use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      CC2IE          at 0 range 2 .. 2;
      Reserved_3_4   at 0 range 3 .. 4;
      COMIE          at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      CC2DE          at 0 range 10 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      COMDE          at 0 range 13 .. 13;
      TDE            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  status register
   type SR_Register_3 is record
      --  Update interrupt flag
      UIF            : SR_UIF_Field := 16#0#;
      --  Capture/compare 1 interrupt flag
      CC1IF          : SR_CC1IF_Field := 16#0#;
      --  Capture/Compare 2 interrupt flag
      CC2IF          : SR_CC2IF_Field := 16#0#;
      --  unspecified
      Reserved_3_4   : STM32_SVD.UInt2 := 16#0#;
      --  COM interrupt flag
      COMIF          : SR_COMIF_Field := 16#0#;
      --  Trigger interrupt flag
      TIF            : SR_TIF_Field := 16#0#;
      --  Break interrupt flag
      BIF            : SR_BIF_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : STM32_SVD.Bit := 16#0#;
      --  Capture/Compare 1 overcapture flag
      CC1OF          : SR_CC1OF_Field := 16#0#;
      --  Capture/compare 2 overcapture flag
      CC2OF          : SR_CC2OF_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : STM32_SVD.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register_3 use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      Reserved_3_4   at 0 range 3 .. 4;
      COMIF          at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  event generation register
   type EGR_Register_3 is record
      --  Write-only. Update generation
      UG            : EGR_UG_Field := 16#0#;
      --  Write-only. Capture/compare 1 generation
      CC1G          : EGR_CC1G_Field := 16#0#;
      --  Write-only. Capture/compare 2 generation
      CC2G          : EGR_CC2G_Field := 16#0#;
      --  unspecified
      Reserved_3_4  : STM32_SVD.UInt2 := 16#0#;
      --  Write-only. Capture/Compare control update generation
      COMG          : EGR_COMG_Field := 16#0#;
      --  Write-only. Trigger generation
      TG            : EGR_TG_Field := 16#0#;
      --  Write-only. Break generation
      BG            : EGR_BG_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_3 use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      Reserved_3_4  at 0 range 3 .. 4;
      COMG          at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  capture/compare mode register (output mode)
   type CCMR1_Output_Register_1 is record
      --  Capture/Compare 1 selection
      CC1S           : CCMR1_Output_CC1S_Field := 16#0#;
      --  Output Compare 1 fast enable
      OC1FE          : CCMR1_Output_OC1FE_Field := 16#0#;
      --  Output Compare 1 preload enable
      OC1PE          : CCMR1_Output_OC1PE_Field := 16#0#;
      --  Output Compare 1 mode
      OC1M           : CCMR1_Output_OC1M_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit := 16#0#;
      --  Capture/Compare 2 selection
      CC2S           : CCMR1_Output_CC2S_Field := 16#0#;
      --  Output Compare 2 fast enable
      OC2FE          : CCMR1_Output_OC2FE_Field := 16#0#;
      --  Output Compare 2 preload enable
      OC2PE          : CCMR1_Output_OC2PE_Field := 16#0#;
      --  Output Compare 2 mode
      OC2M           : CCMR1_Output_OC2M_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : STM32_SVD.Bit := 16#0#;
      --  Output Compare 1 mode bit 3
      OC1M_3         : CCMR1_Output_OC1M_3_Field := 16#0#;
      --  unspecified
      Reserved_17_23 : STM32_SVD.UInt7 := 16#0#;
      --  Output Compare 2 mode bit 3
      OC2M_3         : CCMR1_Output_OC2M_3_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Output_Register_1 use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      CC2S           at 0 range 8 .. 9;
      OC2FE          at 0 range 10 .. 10;
      OC2PE          at 0 range 11 .. 11;
      OC2M           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      OC1M_3         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC2M_3         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  capture/compare enable register
   type CCER_Register_2 is record
      --  Capture/Compare 1 output enable
      CC1E          : CCER_CC1E_Field := 16#0#;
      --  Capture/Compare 1 output Polarity
      CC1P          : CCER_CC1P_Field := 16#0#;
      --  Capture/Compare 1 complementary output enable
      CC1NE         : CCER_CC1NE_Field := 16#0#;
      --  Capture/Compare 1 output Polarity
      CC1NP         : CCER_CC1NP_Field := 16#0#;
      --  Capture/Compare 2 output enable
      CC2E          : CCER_CC2E_Field := 16#0#;
      --  Capture/Compare 2 output Polarity
      CC2P          : CCER_CC2P_Field := 16#0#;
      --  unspecified
      Reserved_6_6  : STM32_SVD.Bit := 16#0#;
      --  Capture/Compare 2 output Polarity
      CC2NP         : CCER_CC2NP_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register_2 use record
      CC1E          at 0 range 0 .. 0;
      CC1P          at 0 range 1 .. 1;
      CC1NE         at 0 range 2 .. 2;
      CC1NP         at 0 range 3 .. 3;
      CC2E          at 0 range 4 .. 4;
      CC2P          at 0 range 5 .. 5;
      Reserved_6_6  at 0 range 6 .. 6;
      CC2NP         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RCR_REP_Field_1 is STM32_SVD.Byte;

   --  repetition counter register
   type RCR_Register_1 is record
      --  Repetition counter value
      REP           : RCR_REP_Field_1 := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RCR_Register_1 use record
      REP           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  break and dead-time register
   type BDTR_Register_1 is record
      --  Dead-time generator setup
      DTG            : BDTR_DTG_Field := 16#0#;
      --  Lock configuration
      LOCK           : BDTR_LOCK_Field := 16#0#;
      --  Off-state selection for Idle mode
      OSSI           : BDTR_OSSI_Field := 16#0#;
      --  Off-state selection for Run mode
      OSSR           : BDTR_OSSR_Field := 16#0#;
      --  Break enable
      BKE            : BDTR_BKE_Field := 16#0#;
      --  Break polarity
      BKP            : BDTR_BKP_Field := 16#0#;
      --  Automatic output enable
      AOE            : BDTR_AOE_Field := 16#0#;
      --  Main output enable
      MOE            : BDTR_MOE_Field := 16#0#;
      --  Break filter
      BKF            : BDTR_BKF_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : STM32_SVD.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BDTR_Register_1 use record
      DTG            at 0 range 0 .. 7;
      LOCK           at 0 range 8 .. 9;
      OSSI           at 0 range 10 .. 10;
      OSSR           at 0 range 11 .. 11;
      BKE            at 0 range 12 .. 12;
      BKP            at 0 range 13 .. 13;
      AOE            at 0 range 14 .. 14;
      MOE            at 0 range 15 .. 15;
      BKF            at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  control register 2
   type CR2_Register_4 is record
      --  Capture/compare preloaded control
      CCPC           : CR2_CCPC_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  Capture/compare control update selection
      CCUS           : CR2_CCUS_Field := 16#0#;
      --  Capture/compare DMA selection
      CCDS           : CR2_CCDS_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : STM32_SVD.UInt4 := 16#0#;
      --  Output Idle state 1
      OIS1           : CR2_OIS1_Field := 16#0#;
      --  Output Idle state 1
      OIS1N          : CR2_OIS1N_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : STM32_SVD.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_4 use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  DMA/Interrupt enable register
   type DIER_Register_4 is record
      --  Update interrupt enable
      UIE            : DIER_UIE_Field := 16#0#;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : DIER_CC1IE_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : STM32_SVD.UInt3 := 16#0#;
      --  COM interrupt enable
      COMIE          : DIER_COMIE_Field := 16#0#;
      --  Trigger interrupt enable
      TIE            : DIER_TIE_Field := 16#0#;
      --  Break interrupt enable
      BIE            : DIER_BIE_Field := 16#0#;
      --  Update DMA request enable
      UDE            : DIER_UDE_Field := 16#0#;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : DIER_CC1DE_Field := 16#0#;
      --  unspecified
      Reserved_10_12 : STM32_SVD.UInt3 := 16#0#;
      --  COM DMA request enable
      COMDE          : DIER_COMDE_Field := 16#0#;
      --  Trigger DMA request enable
      TDE            : DIER_TDE_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_4 use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      COMIE          at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      COMDE          at 0 range 13 .. 13;
      TDE            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  status register
   type SR_Register_4 is record
      --  Update interrupt flag
      UIF            : SR_UIF_Field := 16#0#;
      --  Capture/compare 1 interrupt flag
      CC1IF          : SR_CC1IF_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : STM32_SVD.UInt3 := 16#0#;
      --  COM interrupt flag
      COMIF          : SR_COMIF_Field := 16#0#;
      --  Trigger interrupt flag
      TIF            : SR_TIF_Field := 16#0#;
      --  Break interrupt flag
      BIF            : SR_BIF_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : STM32_SVD.Bit := 16#0#;
      --  Capture/Compare 1 overcapture flag
      CC1OF          : SR_CC1OF_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : STM32_SVD.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register_4 use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      COMIF          at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  event generation register
   type EGR_Register_4 is record
      --  Write-only. Update generation
      UG            : EGR_UG_Field := 16#0#;
      --  Write-only. Capture/compare 1 generation
      CC1G          : EGR_CC1G_Field := 16#0#;
      --  unspecified
      Reserved_2_4  : STM32_SVD.UInt3 := 16#0#;
      --  Write-only. Capture/Compare control update generation
      COMG          : EGR_COMG_Field := 16#0#;
      --  Write-only. Trigger generation
      TG            : EGR_TG_Field := 16#0#;
      --  Write-only. Break generation
      BG            : EGR_BG_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_4 use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      Reserved_2_4  at 0 range 2 .. 4;
      COMG          at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  capture/compare mode register (output mode)
   type CCMR1_Output_Register_2 is record
      --  Capture/Compare 1 selection
      CC1S           : CCMR1_Output_CC1S_Field := 16#0#;
      --  Output Compare 1 fast enable
      OC1FE          : CCMR1_Output_OC1FE_Field := 16#0#;
      --  Output Compare 1 preload enable
      OC1PE          : CCMR1_Output_OC1PE_Field := 16#0#;
      --  Output Compare 1 mode
      OC1M           : CCMR1_Output_OC1M_Field := 16#0#;
      --  unspecified
      Reserved_7_15  : STM32_SVD.UInt9 := 16#0#;
      --  Output Compare 1 mode
      OC1M_3         : CCMR1_Output_OC1M_3_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : STM32_SVD.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Output_Register_2 use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      OC1M_3         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  capture/compare mode register 1 (input mode)
   type CCMR1_Input_Register_2 is record
      --  Capture/Compare 1 selection
      CC1S          : CCMR1_Input_CC1S_Field := 16#0#;
      --  Input capture 1 prescaler
      IC1PSC        : CCMR1_Input_IC1PSC_Field := 16#0#;
      --  Input capture 1 filter
      IC1F          : CCMR1_Input_IC1F_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Input_Register_2 use record
      CC1S          at 0 range 0 .. 1;
      IC1PSC        at 0 range 2 .. 3;
      IC1F          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  capture/compare enable register
   type CCER_Register_3 is record
      --  Capture/Compare 1 output enable
      CC1E          : CCER_CC1E_Field := 16#0#;
      --  Capture/Compare 1 output Polarity
      CC1P          : CCER_CC1P_Field := 16#0#;
      --  Capture/Compare 1 complementary output enable
      CC1NE         : CCER_CC1NE_Field := 16#0#;
      --  Capture/Compare 1 output Polarity
      CC1NP         : CCER_CC1NP_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : STM32_SVD.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register_3 use record
      CC1E          at 0 range 0 .. 0;
      CC1P          at 0 range 1 .. 1;
      CC1NE         at 0 range 2 .. 2;
      CC1NP         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type TIM1_Disc is
     (
      Output,
      Input);

   --  Advanced timer
   type TIM1_Peripheral
     (Discriminent : TIM1_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register;
      --  control register 2
      CR2          : aliased CR2_Register;
      --  slave mode control register
      SMCR         : aliased SMCR_Register;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register;
      --  status register
      SR           : aliased SR_Register;
      --  event generation register
      EGR          : aliased EGR_Register;
      --  capture/compare enable register
      CCER         : aliased CCER_Register;
      --  counter
      CNT          : aliased CNT_Register;
      --  prescaler
      PSC          : aliased PSC_Register;
      --  auto-reload register
      ARR          : aliased ARR_Register;
      --  repetition counter register
      RCR          : aliased RCR_Register;
      --  capture/compare register 1
      CCR1         : aliased CCR1_Register;
      --  capture/compare register 2
      CCR2         : aliased CCR2_Register;
      --  capture/compare register 3
      CCR3         : aliased CCR3_Register;
      --  capture/compare register 4
      CCR4         : aliased CCR4_Register;
      --  break and dead-time register
      BDTR         : aliased BDTR_Register;
      --  DMA control register
      DCR          : aliased DCR_Register;
      --  DMA address for full transfer
      DMAR         : aliased DMAR_Register;
      --  capture/compare mode register 3 (output mode)
      CCMR3_Output : aliased CCMR3_Output_Register;
      --  capture/compare register 5
      CCR5         : aliased CCR5_Register;
      --  capture/compare register 6
      CCR6         : aliased CCR6_Register;
      --  option registers
      OR_k         : aliased OR_Register;
      case Discriminent is
         when Output =>
            --  capture/compare mode register (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register;
            --  capture/compare mode register (output mode)
            CCMR2_Output : aliased CCMR2_Output_Register;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register;
            --  capture/compare mode register 2 (input mode)
            CCMR2_Input : aliased CCMR2_Input_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM1_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      SMCR         at 16#8# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      RCR          at 16#30# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      CCR2         at 16#38# range 0 .. 31;
      CCR3         at 16#3C# range 0 .. 31;
      CCR4         at 16#40# range 0 .. 31;
      BDTR         at 16#44# range 0 .. 31;
      DCR          at 16#48# range 0 .. 31;
      DMAR         at 16#4C# range 0 .. 31;
      CCMR3_Output at 16#54# range 0 .. 31;
      CCR5         at 16#58# range 0 .. 31;
      CCR6         at 16#5C# range 0 .. 31;
      OR_k         at 16#60# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR2_Output at 16#1C# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
      CCMR2_Input  at 16#1C# range 0 .. 31;
   end record;

   --  Advanced timer
   TIM1_Periph : aliased TIM1_Peripheral
     with Import, Address => System'To_Address (16#40012C00#);

   --  Advanced timer
   TIM20_Periph : aliased TIM1_Peripheral
     with Import, Address => System'To_Address (16#40015000#);

   type TIM2_Disc is
     (
      Output,
      Input);

   --  General purpose timer
   type TIM2_Peripheral
     (Discriminent : TIM2_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register;
      --  control register 2
      CR2          : aliased CR2_Register_1;
      --  slave mode control register
      SMCR         : aliased SMCR_Register_1;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register_1;
      --  status register
      SR           : aliased SR_Register_1;
      --  event generation register
      EGR          : aliased EGR_Register_1;
      --  capture/compare enable register
      CCER         : aliased CCER_Register_1;
      --  counter
      CNT          : aliased CNT_Register_1;
      --  prescaler
      PSC          : aliased PSC_Register;
      --  auto-reload register
      ARR          : aliased ARR_Register_1;
      --  capture/compare register 1
      CCR1         : aliased CCR1_Register_1;
      --  capture/compare register 2
      CCR2         : aliased CCR2_Register_1;
      --  capture/compare register 3
      CCR3         : aliased CCR3_Register_1;
      --  capture/compare register 4
      CCR4         : aliased CCR4_Register_1;
      --  DMA control register
      DCR          : aliased DCR_Register;
      --  DMA address for full transfer
      DMAR         : aliased DMAR_Register;
      case Discriminent is
         when Output =>
            --  capture/compare mode register 1 (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register;
            --  capture/compare mode register 2 (output mode)
            CCMR2_Output : aliased CCMR2_Output_Register_1;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register_1;
            --  capture/compare mode register 2 (input mode)
            CCMR2_Input : aliased CCMR2_Input_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM2_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      SMCR         at 16#8# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      CCR2         at 16#38# range 0 .. 31;
      CCR3         at 16#3C# range 0 .. 31;
      CCR4         at 16#40# range 0 .. 31;
      DCR          at 16#48# range 0 .. 31;
      DMAR         at 16#4C# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR2_Output at 16#1C# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
      CCMR2_Input  at 16#1C# range 0 .. 31;
   end record;

   --  General purpose timer
   TIM2_Periph : aliased TIM2_Peripheral
     with Import, Address => System'To_Address (16#40000000#);

   --  General purpose timer
   TIM3_Periph : aliased TIM2_Peripheral
     with Import, Address => System'To_Address (16#40000400#);

   --  General purpose timer
   TIM4_Periph : aliased TIM2_Peripheral
     with Import, Address => System'To_Address (16#40000800#);

   --  Basic timers
   type TIM6_Peripheral is record
      --  control register 1
      CR1  : aliased CR1_Register_1;
      --  control register 2
      CR2  : aliased CR2_Register_2;
      --  DMA/Interrupt enable register
      DIER : aliased DIER_Register_2;
      --  status register
      SR   : aliased SR_Register_2;
      --  event generation register
      EGR  : aliased EGR_Register_2;
      --  counter
      CNT  : aliased CNT_Register;
      --  prescaler
      PSC  : aliased PSC_Register;
      --  auto-reload register
      ARR  : aliased ARR_Register;
   end record
     with Volatile;

   for TIM6_Peripheral use record
      CR1  at 16#0# range 0 .. 31;
      CR2  at 16#4# range 0 .. 31;
      DIER at 16#C# range 0 .. 31;
      SR   at 16#10# range 0 .. 31;
      EGR  at 16#14# range 0 .. 31;
      CNT  at 16#24# range 0 .. 31;
      PSC  at 16#28# range 0 .. 31;
      ARR  at 16#2C# range 0 .. 31;
   end record;

   --  Basic timers
   TIM6_Periph : aliased TIM6_Peripheral
     with Import, Address => System'To_Address (16#40001000#);

   --  Basic timers
   TIM7_Periph : aliased TIM6_Peripheral
     with Import, Address => System'To_Address (16#40001400#);

   type TIM8_Disc is
     (
      Output,
      Input);

   --  Advanced-timers
   type TIM8_Peripheral
     (Discriminent : TIM8_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register;
      --  control register 2
      CR2          : aliased CR2_Register;
      --  slave mode control register
      SMCR         : aliased SMCR_Register;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register;
      --  status register
      SR           : aliased SR_Register;
      --  event generation register
      EGR          : aliased EGR_Register;
      --  capture/compare enable register
      CCER         : aliased CCER_Register;
      --  counter
      CNT          : aliased CNT_Register;
      --  prescaler
      PSC          : aliased PSC_Register;
      --  auto-reload register
      ARR          : aliased ARR_Register;
      --  repetition counter register
      RCR          : aliased RCR_Register;
      --  capture/compare register 1
      CCR1         : aliased CCR1_Register;
      --  capture/compare register 2
      CCR2         : aliased CCR2_Register;
      --  capture/compare register 3
      CCR3         : aliased CCR3_Register;
      --  capture/compare register 4
      CCR4         : aliased CCR4_Register;
      --  break and dead-time register
      BDTR         : aliased BDTR_Register;
      --  DMA control register
      DCR          : aliased DCR_Register;
      --  DMA address for full transfer
      DMAR         : aliased DMAR_Register;
      --  capture/compare mode register 3 (output mode)
      CCMR3_Output : aliased CCMR3_Output_Register;
      --  capture/compare register 5
      CCR5         : aliased CCR5_Register;
      --  capture/compare register 6
      CCR6         : aliased CCR6_Register;
      --  option registers
      OR_k         : aliased OR_Register_1;
      case Discriminent is
         when Output =>
            --  capture/compare mode register (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register;
            --  capture/compare mode register (output mode)
            CCMR2_Output : aliased CCMR2_Output_Register;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register;
            --  capture/compare mode register 2 (input mode)
            CCMR2_Input : aliased CCMR2_Input_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM8_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      SMCR         at 16#8# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      RCR          at 16#30# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      CCR2         at 16#38# range 0 .. 31;
      CCR3         at 16#3C# range 0 .. 31;
      CCR4         at 16#40# range 0 .. 31;
      BDTR         at 16#44# range 0 .. 31;
      DCR          at 16#48# range 0 .. 31;
      DMAR         at 16#4C# range 0 .. 31;
      CCMR3_Output at 16#54# range 0 .. 31;
      CCR5         at 16#58# range 0 .. 31;
      CCR6         at 16#5C# range 0 .. 31;
      OR_k         at 16#60# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR2_Output at 16#1C# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
      CCMR2_Input  at 16#1C# range 0 .. 31;
   end record;

   --  Advanced-timers
   TIM8_Periph : aliased TIM8_Peripheral
     with Import, Address => System'To_Address (16#40013400#);

   type TIM15_Disc is
     (
      Output,
      Input);

   --  General purpose timers
   type TIM15_Peripheral
     (Discriminent : TIM15_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register_2;
      --  control register 2
      CR2          : aliased CR2_Register_3;
      --  slave mode control register
      SMCR         : aliased SMCR_Register_2;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register_3;
      --  status register
      SR           : aliased SR_Register_3;
      --  event generation register
      EGR          : aliased EGR_Register_3;
      --  capture/compare enable register
      CCER         : aliased CCER_Register_2;
      --  counter
      CNT          : aliased CNT_Register;
      --  prescaler
      PSC          : aliased PSC_Register;
      --  auto-reload register
      ARR          : aliased ARR_Register;
      --  repetition counter register
      RCR          : aliased RCR_Register_1;
      --  capture/compare register 1
      CCR1         : aliased CCR1_Register;
      --  capture/compare register 2
      CCR2         : aliased CCR2_Register;
      --  break and dead-time register
      BDTR         : aliased BDTR_Register_1;
      --  DMA control register
      DCR          : aliased DCR_Register;
      --  DMA address for full transfer
      DMAR         : aliased DMAR_Register;
      case Discriminent is
         when Output =>
            --  capture/compare mode register (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register_1;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register_1;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM15_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      SMCR         at 16#8# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      RCR          at 16#30# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      CCR2         at 16#38# range 0 .. 31;
      BDTR         at 16#44# range 0 .. 31;
      DCR          at 16#48# range 0 .. 31;
      DMAR         at 16#4C# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
   end record;

   --  General purpose timers
   TIM15_Periph : aliased TIM15_Peripheral
     with Import, Address => System'To_Address (16#40014000#);

   type TIM16_Disc is
     (
      Output,
      Input);

   --  General-purpose-timers
   type TIM16_Peripheral
     (Discriminent : TIM16_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register_2;
      --  control register 2
      CR2          : aliased CR2_Register_4;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register_4;
      --  status register
      SR           : aliased SR_Register_4;
      --  event generation register
      EGR          : aliased EGR_Register_4;
      --  capture/compare enable register
      CCER         : aliased CCER_Register_3;
      --  counter
      CNT          : aliased CNT_Register;
      --  prescaler
      PSC          : aliased PSC_Register;
      --  auto-reload register
      ARR          : aliased ARR_Register;
      --  repetition counter register
      RCR          : aliased RCR_Register_1;
      --  capture/compare register 1
      CCR1         : aliased CCR1_Register;
      --  break and dead-time register
      BDTR         : aliased BDTR_Register_1;
      --  DMA control register
      DCR          : aliased DCR_Register;
      --  DMA address for full transfer
      DMAR         : aliased DMAR_Register;
      --  option register
      OR_k         : aliased STM32_SVD.UInt32;
      case Discriminent is
         when Output =>
            --  capture/compare mode register (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register_2;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register_2;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM16_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      RCR          at 16#30# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      BDTR         at 16#44# range 0 .. 31;
      DCR          at 16#48# range 0 .. 31;
      DMAR         at 16#4C# range 0 .. 31;
      OR_k         at 16#50# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
   end record;

   --  General-purpose-timers
   TIM16_Periph : aliased TIM16_Peripheral
     with Import, Address => System'To_Address (16#40014400#);

   type TIM17_Disc is
     (
      Output,
      Input);

   --  General purpose timer
   type TIM17_Peripheral
     (Discriminent : TIM17_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register_2;
      --  control register 2
      CR2          : aliased CR2_Register_4;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register_4;
      --  status register
      SR           : aliased SR_Register_4;
      --  event generation register
      EGR          : aliased EGR_Register_4;
      --  capture/compare enable register
      CCER         : aliased CCER_Register_3;
      --  counter
      CNT          : aliased CNT_Register;
      --  prescaler
      PSC          : aliased PSC_Register;
      --  auto-reload register
      ARR          : aliased ARR_Register;
      --  repetition counter register
      RCR          : aliased RCR_Register_1;
      --  capture/compare register 1
      CCR1         : aliased CCR1_Register;
      --  break and dead-time register
      BDTR         : aliased BDTR_Register_1;
      --  DMA control register
      DCR          : aliased DCR_Register;
      --  DMA address for full transfer
      DMAR         : aliased DMAR_Register;
      case Discriminent is
         when Output =>
            --  capture/compare mode register (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register_2;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register_2;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM17_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      RCR          at 16#30# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      BDTR         at 16#44# range 0 .. 31;
      DCR          at 16#48# range 0 .. 31;
      DMAR         at 16#4C# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
   end record;

   --  General purpose timer
   TIM17_Periph : aliased TIM17_Peripheral
     with Import, Address => System'To_Address (16#40014800#);

end STM32_SVD.TIMs;
