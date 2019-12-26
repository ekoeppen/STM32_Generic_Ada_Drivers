--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.TIM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  control register 1
   type CR1_Register is record
      --  Counter enable
      CEN            : STM32_SVD.Bit;
      --  Update disable
      UDIS           : STM32_SVD.Bit;
      --  Update request source
      URS            : STM32_SVD.Bit;
      --  One-pulse mode
      OPM            : STM32_SVD.Bit;
      --  Direction
      DIR            : STM32_SVD.Bit;
      --  Center-aligned mode selection
      CMS            : STM32_SVD.UInt2;
      --  Auto-reload preload enable
      ARPE           : STM32_SVD.Bit;
      --  Clock division
      CKD            : STM32_SVD.UInt2;
      --  unspecified
      Reserved_10_31 : STM32_SVD.UInt22;
   end record
     with Volatile_Full_Access, Object_Size => 32,
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
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   --  control register 2
   type CR2_Register is record
      --  unspecified
      Reserved_0_2  : STM32_SVD.UInt3;
      --  Capture/compare DMA selection
      CCDS          : STM32_SVD.Bit;
      --  Master mode selection
      MMS           : STM32_SVD.UInt3;
      --  TI1 selection
      TI1S          : STM32_SVD.Bit;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      Reserved_0_2  at 0 range 0 .. 2;
      CCDS          at 0 range 3 .. 3;
      MMS           at 0 range 4 .. 6;
      TI1S          at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  slave mode control register
   type SMCR_Register is record
      --  Slave mode selection
      SMS            : STM32_SVD.UInt3;
      --  unspecified
      Reserved_3_3   : STM32_SVD.Bit;
      --  Trigger selection
      TS             : STM32_SVD.UInt3;
      --  Master/Slave mode
      MSM            : STM32_SVD.Bit;
      --  External trigger filter
      ETF            : STM32_SVD.UInt4;
      --  External trigger prescaler
      ETPS           : STM32_SVD.UInt2;
      --  External clock enable
      ECE            : STM32_SVD.Bit;
      --  External trigger polarity
      ETP            : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register use record
      SMS            at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      TS             at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      ETF            at 0 range 8 .. 11;
      ETPS           at 0 range 12 .. 13;
      ECE            at 0 range 14 .. 14;
      ETP            at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  DMA/Interrupt enable register
   type DIER_Register is record
      --  Update interrupt enable
      UIE            : STM32_SVD.Bit;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : STM32_SVD.Bit;
      --  Capture/Compare 2 interrupt enable
      CC2IE          : STM32_SVD.Bit;
      --  Capture/Compare 3 interrupt enable
      CC3IE          : STM32_SVD.Bit;
      --  Capture/Compare 4 interrupt enable
      CC4IE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_5   : STM32_SVD.Bit;
      --  Trigger interrupt enable
      TIE            : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit;
      --  Update DMA request enable
      UDE            : STM32_SVD.Bit;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : STM32_SVD.Bit;
      --  Capture/Compare 2 DMA request enable
      CC2DE          : STM32_SVD.Bit;
      --  Capture/Compare 3 DMA request enable
      CC3DE          : STM32_SVD.Bit;
      --  Capture/Compare 4 DMA request enable
      CC4DE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_13_13 : STM32_SVD.Bit;
      --  Trigger DMA request enable
      TDE            : STM32_SVD.Bit;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register use record
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
   type SR_Register is record
      --  Update interrupt flag
      UIF            : STM32_SVD.Bit;
      --  Capture/compare 1 interrupt flag
      CC1IF          : STM32_SVD.Bit;
      --  Capture/Compare 2 interrupt flag
      CC2IF          : STM32_SVD.Bit;
      --  Capture/Compare 3 interrupt flag
      CC3IF          : STM32_SVD.Bit;
      --  Capture/Compare 4 interrupt flag
      CC4IF          : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_5   : STM32_SVD.Bit;
      --  Trigger interrupt flag
      TIF            : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_8   : STM32_SVD.UInt2;
      --  Capture/Compare 1 overcapture flag
      CC1OF          : STM32_SVD.Bit;
      --  Capture/compare 2 overcapture flag
      CC2OF          : STM32_SVD.Bit;
      --  Capture/Compare 3 overcapture flag
      CC3OF          : STM32_SVD.Bit;
      --  Capture/Compare 4 overcapture flag
      CC4OF          : STM32_SVD.Bit;
      --  unspecified
      Reserved_13_31 : STM32_SVD.UInt19;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
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
   type EGR_Register is record
      --  Write-only. Update generation
      UG            : STM32_SVD.Bit;
      --  Write-only. Capture/compare 1 generation
      CC1G          : STM32_SVD.Bit;
      --  Write-only. Capture/compare 2 generation
      CC2G          : STM32_SVD.Bit;
      --  Write-only. Capture/compare 3 generation
      CC3G          : STM32_SVD.Bit;
      --  Write-only. Capture/compare 4 generation
      CC4G          : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_5  : STM32_SVD.Bit;
      --  Write-only. Trigger generation
      TG            : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      CC3G          at 0 range 3 .. 3;
      CC4G          at 0 range 4 .. 4;
      Reserved_5_5  at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  capture/compare mode register 1 (output mode)
   type CCMR1_Output_Register is record
      --  Capture/Compare 1 selection
      CC1S           : STM32_SVD.UInt2;
      --  Output compare 1 fast enable
      OC1FE          : STM32_SVD.Bit;
      --  Output compare 1 preload enable
      OC1PE          : STM32_SVD.Bit;
      --  Output compare 1 mode
      OC1M           : STM32_SVD.UInt3;
      --  Output compare 1 clear enable
      OC1CE          : STM32_SVD.Bit;
      --  Capture/Compare 2 selection
      CC2S           : STM32_SVD.UInt2;
      --  Output compare 2 fast enable
      OC2FE          : STM32_SVD.Bit;
      --  Output compare 2 preload enable
      OC2PE          : STM32_SVD.Bit;
      --  Output compare 2 mode
      OC2M           : STM32_SVD.UInt3;
      --  Output compare 2 clear enable
      OC2CE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
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
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  capture/compare mode register 1 (input mode)
   type CCMR1_Input_Register is record
      --  Capture/Compare 1 selection
      CC1S           : STM32_SVD.UInt2;
      --  Input capture 1 prescaler
      IC1PSC         : STM32_SVD.UInt2;
      --  Input capture 1 filter
      IC1F           : STM32_SVD.UInt4;
      --  Capture/compare 2 selection
      CC2S           : STM32_SVD.UInt2;
      --  Input capture 2 prescaler
      IC2PSC         : STM32_SVD.UInt2;
      --  Input capture 2 filter
      IC2F           : STM32_SVD.UInt4;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Input_Register use record
      CC1S           at 0 range 0 .. 1;
      IC1PSC         at 0 range 2 .. 3;
      IC1F           at 0 range 4 .. 7;
      CC2S           at 0 range 8 .. 9;
      IC2PSC         at 0 range 10 .. 11;
      IC2F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  capture/compare mode register 2 (output mode)
   type CCMR2_Output_Register is record
      --  Capture/Compare 3 selection
      CC3S           : STM32_SVD.UInt2;
      --  Output compare 3 fast enable
      OC3FE          : STM32_SVD.Bit;
      --  Output compare 3 preload enable
      OC3PE          : STM32_SVD.Bit;
      --  Output compare 3 mode
      OC3M           : STM32_SVD.UInt3;
      --  Output compare 3 clear enable
      OC3CE          : STM32_SVD.Bit;
      --  Capture/Compare 4 selection
      CC4S           : STM32_SVD.UInt2;
      --  Output compare 4 fast enable
      OC4FE          : STM32_SVD.Bit;
      --  Output compare 4 preload enable
      OC4PE          : STM32_SVD.Bit;
      --  Output compare 4 mode
      OC4M           : STM32_SVD.UInt3;
      --  Output compare 4 clear enable
      OC4CE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
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
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  capture/compare mode register 2 (input mode)
   type CCMR2_Input_Register is record
      --  Capture/Compare 3 selection
      CC3S           : STM32_SVD.UInt2;
      --  Input capture 3 prescaler
      IC3PSC         : STM32_SVD.UInt2;
      --  Input capture 3 filter
      IC3F           : STM32_SVD.UInt4;
      --  Capture/Compare 4 selection
      CC4S           : STM32_SVD.UInt2;
      --  Input capture 4 prescaler
      IC4PSC         : STM32_SVD.UInt2;
      --  Input capture 4 filter
      IC4F           : STM32_SVD.UInt4;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
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

   --  capture/compare enable register
   type CCER_Register is record
      --  Capture/Compare 1 output enable
      CC1E           : STM32_SVD.Bit;
      --  Capture/Compare 1 output Polarity
      CC1P           : STM32_SVD.Bit;
      --  unspecified
      Reserved_2_2   : STM32_SVD.Bit;
      --  Capture/Compare 1 output Polarity
      CC1NP          : STM32_SVD.Bit;
      --  Capture/Compare 2 output enable
      CC2E           : STM32_SVD.Bit;
      --  Capture/Compare 2 output Polarity
      CC2P           : STM32_SVD.Bit;
      --  unspecified
      Reserved_6_6   : STM32_SVD.Bit;
      --  Capture/Compare 2 output Polarity
      CC2NP          : STM32_SVD.Bit;
      --  Capture/Compare 3 output enable
      CC3E           : STM32_SVD.Bit;
      --  Capture/Compare 3 output Polarity
      CC3P           : STM32_SVD.Bit;
      --  unspecified
      Reserved_10_10 : STM32_SVD.Bit;
      --  Capture/Compare 3 output Polarity
      CC3NP          : STM32_SVD.Bit;
      --  Capture/Compare 4 output enable
      CC4E           : STM32_SVD.Bit;
      --  Capture/Compare 3 output Polarity
      CC4P           : STM32_SVD.Bit;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit;
      --  Capture/Compare 4 output Polarity
      CC4NP          : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register use record
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

   --  counter
   type CNT_Register is record
      --  Low counter value
      CNT_L : STM32_SVD.UInt16;
      --  High counter value (TIM2 only)
      CNT_H : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register use record
      CNT_L at 0 range 0 .. 15;
      CNT_H at 0 range 16 .. 31;
   end record;

   --  prescaler
   type PSC_Register is record
      --  Prescaler value
      PSC            : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PSC_Register use record
      PSC            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  auto-reload register
   type ARR_Register is record
      --  Low Auto-reload value
      ARR_L : STM32_SVD.UInt16;
      --  High Auto-reload value (TIM2 only)
      ARR_H : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARR_Register use record
      ARR_L at 0 range 0 .. 15;
      ARR_H at 0 range 16 .. 31;
   end record;

   --  capture/compare register 1
   type CCR1_Register is record
      --  Low Capture/Compare 1 value
      CCR1_L : STM32_SVD.UInt16;
      --  High Capture/Compare 1 value (TIM2 only)
      CCR1_H : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR1_Register use record
      CCR1_L at 0 range 0 .. 15;
      CCR1_H at 0 range 16 .. 31;
   end record;

   --  capture/compare register 2
   type CCR2_Register is record
      --  Low Capture/Compare 2 value
      CCR2_L : STM32_SVD.UInt16;
      --  High Capture/Compare 2 value (TIM2 only)
      CCR2_H : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR2_Register use record
      CCR2_L at 0 range 0 .. 15;
      CCR2_H at 0 range 16 .. 31;
   end record;

   --  capture/compare register 3
   type CCR3_Register is record
      --  Low Capture/Compare value
      CCR3_L : STM32_SVD.UInt16;
      --  High Capture/Compare value (TIM2 only)
      CCR3_H : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR3_Register use record
      CCR3_L at 0 range 0 .. 15;
      CCR3_H at 0 range 16 .. 31;
   end record;

   --  capture/compare register 4
   type CCR4_Register is record
      --  Low Capture/Compare value
      CCR4_L : STM32_SVD.UInt16;
      --  High Capture/Compare value (TIM2 only)
      CCR4_H : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR4_Register use record
      CCR4_L at 0 range 0 .. 15;
      CCR4_H at 0 range 16 .. 31;
   end record;

   --  DMA control register
   type DCR_Register is record
      --  DMA base address
      DBA            : STM32_SVD.UInt5;
      --  unspecified
      Reserved_5_7   : STM32_SVD.UInt3;
      --  DMA burst length
      DBL            : STM32_SVD.UInt5;
      --  unspecified
      Reserved_13_31 : STM32_SVD.UInt19;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCR_Register use record
      DBA            at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DBL            at 0 range 8 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  DMA address for full transfer
   type DMAR_Register is record
      --  DMA register for burst accesses
      DMAB           : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAR_Register use record
      DMAB           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  TIM2 option register
   type OR_Register is record
      --  Timer2 ETR remap
      ETR_RMP       : STM32_SVD.UInt3;
      --  Internal trigger
      TI4_RMP       : STM32_SVD.UInt2;
      --  unspecified
      Reserved_5_31 : STM32_SVD.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR_Register use record
      ETR_RMP       at 0 range 0 .. 2;
      TI4_RMP       at 0 range 3 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  control register 1
   type CR1_Register_1 is record
      --  Counter enable
      CEN           : STM32_SVD.Bit;
      --  Update disable
      UDIS          : STM32_SVD.Bit;
      --  Update request source
      URS           : STM32_SVD.Bit;
      --  One-pulse mode
      OPM           : STM32_SVD.Bit;
      --  unspecified
      Reserved_4_6  : STM32_SVD.UInt3;
      --  Auto-reload preload enable
      ARPE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register_1 use record
      CEN           at 0 range 0 .. 0;
      UDIS          at 0 range 1 .. 1;
      URS           at 0 range 2 .. 2;
      OPM           at 0 range 3 .. 3;
      Reserved_4_6  at 0 range 4 .. 6;
      ARPE          at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  control register 2
   type CR2_Register_1 is record
      --  unspecified
      Reserved_0_3  : STM32_SVD.UInt4;
      --  Master mode selection
      MMS           : STM32_SVD.UInt3;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_1 use record
      Reserved_0_3  at 0 range 0 .. 3;
      MMS           at 0 range 4 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  DMA/Interrupt enable register
   type DIER_Register_1 is record
      --  Update interrupt enable
      UIE           : STM32_SVD.Bit;
      --  unspecified
      Reserved_1_7  : STM32_SVD.UInt7;
      --  Update DMA request enable
      UDE           : STM32_SVD.Bit;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_1 use record
      UIE           at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      UDE           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  status register
   type SR_Register_1 is record
      --  Update interrupt flag
      UIF           : STM32_SVD.Bit;
      --  unspecified
      Reserved_1_31 : STM32_SVD.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register_1 use record
      UIF           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  event generation register
   type EGR_Register_1 is record
      --  Write-only. Update generation
      UG            : STM32_SVD.Bit;
      --  unspecified
      Reserved_1_31 : STM32_SVD.UInt31;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_1 use record
      UG            at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   --  counter
   type CNT_Register_1 is record
      --  Low counter value
      CNT            : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register_1 use record
      CNT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  auto-reload register
   type ARR_Register_1 is record
      --  Low Auto-reload value
      ARR            : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARR_Register_1 use record
      ARR            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  DMA/Interrupt enable register
   type DIER_Register_2 is record
      --  Update interrupt enable
      UIE           : STM32_SVD.Bit;
      --  Capture/Compare 1 interrupt enable
      CC1IE         : STM32_SVD.Bit;
      --  Capture/Compare 2 interrupt enable
      CC2IE         : STM32_SVD.Bit;
      --  unspecified
      Reserved_3_5  : STM32_SVD.UInt3;
      --  Trigger interrupt enable
      TIE           : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_2 use record
      UIE           at 0 range 0 .. 0;
      CC1IE         at 0 range 1 .. 1;
      CC2IE         at 0 range 2 .. 2;
      Reserved_3_5  at 0 range 3 .. 5;
      TIE           at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  status register
   type SR_Register_2 is record
      --  Update interrupt flag
      UIF            : STM32_SVD.Bit;
      --  Capture/compare 1 interrupt flag
      CC1IF          : STM32_SVD.Bit;
      --  Capture/Compare 2 interrupt flag
      CC2IF          : STM32_SVD.Bit;
      --  unspecified
      Reserved_3_5   : STM32_SVD.UInt3;
      --  Trigger interrupt flag
      TIF            : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_8   : STM32_SVD.UInt2;
      --  Capture/Compare 1 overcapture flag
      CC1OF          : STM32_SVD.Bit;
      --  Capture/compare 2 overcapture flag
      CC2OF          : STM32_SVD.Bit;
      --  unspecified
      Reserved_11_31 : STM32_SVD.UInt21;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register_2 use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      Reserved_3_5   at 0 range 3 .. 5;
      TIF            at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  event generation register
   type EGR_Register_2 is record
      --  Write-only. Update generation
      UG            : STM32_SVD.Bit;
      --  Write-only. Capture/compare 1 generation
      CC1G          : STM32_SVD.Bit;
      --  Write-only. Capture/compare 2 generation
      CC2G          : STM32_SVD.Bit;
      --  unspecified
      Reserved_3_5  : STM32_SVD.UInt3;
      --  Write-only. Trigger generation
      TG            : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_2 use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      Reserved_3_5  at 0 range 3 .. 5;
      TG            at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   --  capture/compare mode register (output mode)
   type CCMR1_Output_Register_1 is record
      --  Capture/Compare 1 selection
      CC1S           : STM32_SVD.UInt2;
      --  Output Compare 1 fast enable
      OC1FE          : STM32_SVD.Bit;
      --  Output Compare 1 preload enable
      OC1PE          : STM32_SVD.Bit;
      --  Output Compare 1 mode
      OC1M           : STM32_SVD.UInt3;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit;
      --  Capture/Compare 2 selection
      CC2S           : STM32_SVD.UInt2;
      --  Output Compare 2 fast enable
      OC2FE          : STM32_SVD.Bit;
      --  Output Compare 2 preload enable
      OC2PE          : STM32_SVD.Bit;
      --  Output Compare 2 mode
      OC2M           : STM32_SVD.UInt3;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17;
   end record
     with Volatile_Full_Access, Object_Size => 32,
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
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  capture/compare enable register
   type CCER_Register_1 is record
      --  Capture/Compare 1 output enable
      CC1E          : STM32_SVD.Bit;
      --  Capture/Compare 1 output Polarity
      CC1P          : STM32_SVD.Bit;
      --  unspecified
      Reserved_2_2  : STM32_SVD.Bit;
      --  Capture/Compare 1 output Polarity
      CC1NP         : STM32_SVD.Bit;
      --  Capture/Compare 2 output enable
      CC2E          : STM32_SVD.Bit;
      --  Capture/Compare 2 output Polarity
      CC2P          : STM32_SVD.Bit;
      --  unspecified
      Reserved_6_6  : STM32_SVD.Bit;
      --  Capture/Compare 2 output Polarity
      CC2NP         : STM32_SVD.Bit;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register_1 use record
      CC1E          at 0 range 0 .. 0;
      CC1P          at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      CC1NP         at 0 range 3 .. 3;
      CC2E          at 0 range 4 .. 4;
      CC2P          at 0 range 5 .. 5;
      Reserved_6_6  at 0 range 6 .. 6;
      CC2NP         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  capture/compare register 1
   type CCR1_Register_1 is record
      --  Capture/Compare 1 value
      CCR1           : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR1_Register_1 use record
      CCR1           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  capture/compare register 2
   type CCR2_Register_1 is record
      --  Capture/Compare 2 value
      CCR2           : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR2_Register_1 use record
      CCR2           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  TIM21 option register
   type OR_Register_1 is record
      --  Timer21 ETR remap
      ETR_RMP       : STM32_SVD.UInt2;
      --  Timer21 TI1
      TI1_RMP       : STM32_SVD.UInt3;
      --  Timer21 TI2
      TI2_RMP       : STM32_SVD.Bit;
      --  unspecified
      Reserved_6_31 : STM32_SVD.UInt26;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR_Register_1 use record
      ETR_RMP       at 0 range 0 .. 1;
      TI1_RMP       at 0 range 2 .. 4;
      TI2_RMP       at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   --  TIM22 option register
   type OR_Register_2 is record
      --  Timer22 ETR remap
      ETR_RMP       : STM32_SVD.UInt2;
      --  Timer22 TI1
      TI1_RMP       : STM32_SVD.UInt2;
      --  unspecified
      Reserved_4_31 : STM32_SVD.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR_Register_2 use record
      ETR_RMP       at 0 range 0 .. 1;
      TI1_RMP       at 0 range 2 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type TIM2_Disc is
     (Output,
      Input);

   --  General-purpose-timers
   type TIM2_Peripheral
     (Discriminent : TIM2_Disc := Output)
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
      --  capture/compare register 1
      CCR1         : aliased CCR1_Register;
      --  capture/compare register 2
      CCR2         : aliased CCR2_Register;
      --  capture/compare register 3
      CCR3         : aliased CCR3_Register;
      --  capture/compare register 4
      CCR4         : aliased CCR4_Register;
      --  DMA control register
      DCR          : aliased DCR_Register;
      --  DMA address for full transfer
      DMAR         : aliased DMAR_Register;
      --  TIM2 option register
      OR_k         : aliased OR_Register;
      case Discriminent is
         when Output =>
            --  capture/compare mode register 1 (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register;
            --  capture/compare mode register 2 (output mode)
            CCMR2_Output : aliased CCMR2_Output_Register;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register;
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
      OR_k         at 16#50# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR2_Output at 16#1C# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
      CCMR2_Input  at 16#1C# range 0 .. 31;
   end record;

   --  General-purpose-timers
   TIM2_Periph : aliased TIM2_Peripheral
     with Import, Address => TIM2_Base;

   --  General-purpose-timers
   TIM3_Periph : aliased TIM2_Peripheral
     with Import, Address => TIM3_Base;

   --  Basic-timers
   type TIM6_Peripheral is record
      --  control register 1
      CR1  : aliased CR1_Register_1;
      --  control register 2
      CR2  : aliased CR2_Register_1;
      --  DMA/Interrupt enable register
      DIER : aliased DIER_Register_1;
      --  status register
      SR   : aliased SR_Register_1;
      --  event generation register
      EGR  : aliased EGR_Register_1;
      --  counter
      CNT  : aliased CNT_Register_1;
      --  prescaler
      PSC  : aliased PSC_Register;
      --  auto-reload register
      ARR  : aliased ARR_Register_1;
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

   --  Basic-timers
   TIM6_Periph : aliased TIM6_Peripheral
     with Import, Address => TIM6_Base;

   --  Basic-timers
   TIM7_Periph : aliased TIM6_Peripheral
     with Import, Address => TIM7_Base;

   type TIM21_Disc is
     (Output,
      Input);

   --  General-purpose-timers
   type TIM21_Peripheral
     (Discriminent : TIM21_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register;
      --  control register 2
      CR2          : aliased CR2_Register_1;
      --  slave mode control register
      SMCR         : aliased SMCR_Register;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register_2;
      --  status register
      SR           : aliased SR_Register_2;
      --  event generation register
      EGR          : aliased EGR_Register_2;
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
      --  TIM21 option register
      OR_k         : aliased OR_Register_1;
      case Discriminent is
         when Output =>
            --  capture/compare mode register (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register_1;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM21_Peripheral use record
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
      OR_k         at 16#50# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
   end record;

   --  General-purpose-timers
   TIM21_Periph : aliased TIM21_Peripheral
     with Import, Address => TIM21_Base;

   type TIM22_Disc is
     (Output,
      Input);

   --  General-purpose-timers
   type TIM22_Peripheral
     (Discriminent : TIM22_Disc := Output)
   is record
      --  control register 1
      CR1          : aliased CR1_Register;
      --  control register 2
      CR2          : aliased CR2_Register_1;
      --  slave mode control register
      SMCR         : aliased SMCR_Register;
      --  DMA/Interrupt enable register
      DIER         : aliased DIER_Register_2;
      --  status register
      SR           : aliased SR_Register_2;
      --  event generation register
      EGR          : aliased EGR_Register_2;
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
      --  TIM22 option register
      OR_k         : aliased OR_Register_2;
      case Discriminent is
         when Output =>
            --  capture/compare mode register (output mode)
            CCMR1_Output : aliased CCMR1_Output_Register_1;
         when Input =>
            --  capture/compare mode register 1 (input mode)
            CCMR1_Input : aliased CCMR1_Input_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM22_Peripheral use record
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
      OR_k         at 16#50# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
   end record;

   --  General-purpose-timers
   TIM22_Periph : aliased TIM22_Peripheral
     with Import, Address => TIM22_Base;

end STM32_SVD.TIM;
