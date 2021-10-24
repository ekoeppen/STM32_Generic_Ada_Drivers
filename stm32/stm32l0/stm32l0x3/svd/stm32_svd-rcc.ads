pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x3.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.RCC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_HSI16ON_Field is STM32_SVD.Bit;
   subtype CR_HSI16KERON_Field is STM32_SVD.Bit;
   subtype CR_HSI16RDYF_Field is STM32_SVD.Bit;
   subtype CR_HSI16DIVEN_Field is STM32_SVD.Bit;
   subtype CR_HSI16DIVF_Field is STM32_SVD.Bit;
   subtype CR_HSI16OUTEN_Field is STM32_SVD.Bit;
   subtype CR_MSION_Field is STM32_SVD.Bit;
   subtype CR_MSIRDY_Field is STM32_SVD.Bit;
   subtype CR_HSEON_Field is STM32_SVD.Bit;
   subtype CR_HSERDY_Field is STM32_SVD.Bit;
   subtype CR_HSEBYP_Field is STM32_SVD.Bit;
   subtype CR_CSSLSEON_Field is STM32_SVD.Bit;
   subtype CR_RTCPRE_Field is STM32_SVD.UInt2;
   subtype CR_PLLON_Field is STM32_SVD.Bit;
   subtype CR_PLLRDY_Field is STM32_SVD.Bit;

   --  Clock control register
   type CR_Register is record
      --  16 MHz high-speed internal clock enable
      HSI16ON        : CR_HSI16ON_Field := 16#0#;
      --  Read-only. High-speed internal clock enable bit for some IP kernels
      HSI16KERON     : CR_HSI16KERON_Field := 16#0#;
      --  Internal high-speed clock ready flag
      HSI16RDYF      : CR_HSI16RDYF_Field := 16#0#;
      --  HSI16DIVEN
      HSI16DIVEN     : CR_HSI16DIVEN_Field := 16#0#;
      --  Read-only. HSI16DIVF
      HSI16DIVF      : CR_HSI16DIVF_Field := 16#0#;
      --  16 MHz high-speed internal clock output enable
      HSI16OUTEN     : CR_HSI16OUTEN_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : STM32_SVD.UInt2 := 16#0#;
      --  MSI clock enable bit
      MSION          : CR_MSION_Field := 16#1#;
      --  Read-only. MSI clock ready flag
      MSIRDY         : CR_MSIRDY_Field := 16#1#;
      --  unspecified
      Reserved_10_15 : STM32_SVD.UInt6 := 16#0#;
      --  HSE clock enable bit
      HSEON          : CR_HSEON_Field := 16#0#;
      --  Read-only. HSE clock ready flag
      HSERDY         : CR_HSERDY_Field := 16#0#;
      --  HSE clock bypass bit
      HSEBYP         : CR_HSEBYP_Field := 16#0#;
      --  Clock security system on HSE enable bit
      CSSLSEON       : CR_CSSLSEON_Field := 16#0#;
      --  TC/LCD prescaler
      RTCPRE         : CR_RTCPRE_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : STM32_SVD.UInt2 := 16#0#;
      --  PLL enable bit
      PLLON          : CR_PLLON_Field := 16#0#;
      --  Read-only. PLL clock ready flag
      PLLRDY         : CR_PLLRDY_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : STM32_SVD.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      HSI16ON        at 0 range 0 .. 0;
      HSI16KERON     at 0 range 1 .. 1;
      HSI16RDYF      at 0 range 2 .. 2;
      HSI16DIVEN     at 0 range 3 .. 3;
      HSI16DIVF      at 0 range 4 .. 4;
      HSI16OUTEN     at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MSION          at 0 range 8 .. 8;
      MSIRDY         at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
      HSEON          at 0 range 16 .. 16;
      HSERDY         at 0 range 17 .. 17;
      HSEBYP         at 0 range 18 .. 18;
      CSSLSEON       at 0 range 19 .. 19;
      RTCPRE         at 0 range 20 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      PLLON          at 0 range 24 .. 24;
      PLLRDY         at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype ICSCR_HSI16CAL_Field is STM32_SVD.Byte;
   subtype ICSCR_HSI16TRIM_Field is STM32_SVD.UInt5;
   subtype ICSCR_MSIRANGE_Field is STM32_SVD.UInt3;
   subtype ICSCR_MSICAL_Field is STM32_SVD.Byte;
   subtype ICSCR_MSITRIM_Field is STM32_SVD.Byte;

   --  Internal clock sources calibration register
   type ICSCR_Register is record
      --  Read-only. nternal high speed clock calibration
      HSI16CAL  : ICSCR_HSI16CAL_Field := 16#0#;
      --  High speed internal clock trimming
      HSI16TRIM : ICSCR_HSI16TRIM_Field := 16#10#;
      --  MSI clock ranges
      MSIRANGE  : ICSCR_MSIRANGE_Field := 16#5#;
      --  Read-only. MSI clock calibration
      MSICAL    : ICSCR_MSICAL_Field := 16#0#;
      --  MSI clock trimming
      MSITRIM   : ICSCR_MSITRIM_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICSCR_Register use record
      HSI16CAL  at 0 range 0 .. 7;
      HSI16TRIM at 0 range 8 .. 12;
      MSIRANGE  at 0 range 13 .. 15;
      MSICAL    at 0 range 16 .. 23;
      MSITRIM   at 0 range 24 .. 31;
   end record;

   subtype CRRCR_HSI48ON_Field is STM32_SVD.Bit;
   subtype CRRCR_HSI48RDY_Field is STM32_SVD.Bit;
   subtype CRRCR_HSI48DIV6EN_Field is STM32_SVD.Bit;
   subtype CRRCR_HSI48CAL_Field is STM32_SVD.Byte;

   --  Clock recovery RC register
   type CRRCR_Register is record
      --  48MHz HSI clock enable bit
      HSI48ON        : CRRCR_HSI48ON_Field := 16#0#;
      --  Read-only. 48MHz HSI clock ready flag
      HSI48RDY       : CRRCR_HSI48RDY_Field := 16#0#;
      --  48 MHz HSI clock divided by 6 output enable
      HSI48DIV6EN    : CRRCR_HSI48DIV6EN_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : STM32_SVD.UInt5 := 16#0#;
      --  Read-only. 48 MHz HSI clock calibration
      HSI48CAL       : CRRCR_HSI48CAL_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRRCR_Register use record
      HSI48ON        at 0 range 0 .. 0;
      HSI48RDY       at 0 range 1 .. 1;
      HSI48DIV6EN    at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      HSI48CAL       at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CFGR_SW_Field is STM32_SVD.UInt2;
   subtype CFGR_SWS_Field is STM32_SVD.UInt2;
   subtype CFGR_HPRE_Field is STM32_SVD.UInt4;
   --  CFGR_PPRE array element
   subtype CFGR_PPRE_Element is STM32_SVD.UInt3;

   --  CFGR_PPRE array
   type CFGR_PPRE_Field_Array is array (1 .. 2) of CFGR_PPRE_Element
     with Component_Size => 3, Size => 6;

   --  Type definition for CFGR_PPRE
   type CFGR_PPRE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PPRE as a value
            Val : STM32_SVD.UInt6;
         when True =>
            --  PPRE as an array
            Arr : CFGR_PPRE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CFGR_PPRE_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   subtype CFGR_STOPWUCK_Field is STM32_SVD.Bit;
   subtype CFGR_PLLSRC_Field is STM32_SVD.Bit;
   subtype CFGR_PLLMUL_Field is STM32_SVD.UInt4;
   subtype CFGR_PLLDIV_Field is STM32_SVD.UInt2;
   subtype CFGR_MCOSEL_Field is STM32_SVD.UInt4;
   subtype CFGR_MCOPRE_Field is STM32_SVD.UInt3;

   --  Clock configuration register
   type CFGR_Register is record
      --  System clock switch
      SW             : CFGR_SW_Field := 16#0#;
      --  Read-only. System clock switch status
      SWS            : CFGR_SWS_Field := 16#0#;
      --  AHB prescaler
      HPRE           : CFGR_HPRE_Field := 16#0#;
      --  APB low-speed prescaler (APB1)
      PPRE           : CFGR_PPRE_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit := 16#0#;
      --  Wake-up from stop clock selection
      STOPWUCK       : CFGR_STOPWUCK_Field := 16#0#;
      --  PLL entry clock source
      PLLSRC         : CFGR_PLLSRC_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : STM32_SVD.Bit := 16#0#;
      --  PLL multiplication factor
      PLLMUL         : CFGR_PLLMUL_Field := 16#0#;
      --  PLL output division
      PLLDIV         : CFGR_PLLDIV_Field := 16#0#;
      --  Microcontroller clock output selection
      MCOSEL         : CFGR_MCOSEL_Field := 16#0#;
      --  Microcontroller clock output prescaler
      MCOPRE         : CFGR_MCOPRE_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : STM32_SVD.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      SW             at 0 range 0 .. 1;
      SWS            at 0 range 2 .. 3;
      HPRE           at 0 range 4 .. 7;
      PPRE           at 0 range 8 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      STOPWUCK       at 0 range 15 .. 15;
      PLLSRC         at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      PLLMUL         at 0 range 18 .. 21;
      PLLDIV         at 0 range 22 .. 23;
      MCOSEL         at 0 range 24 .. 27;
      MCOPRE         at 0 range 28 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype CIER_LSIRDYIE_Field is STM32_SVD.Bit;
   subtype CIER_LSERDYIE_Field is STM32_SVD.Bit;
   subtype CIER_HSI16RDYIE_Field is STM32_SVD.Bit;
   subtype CIER_HSERDYIE_Field is STM32_SVD.Bit;
   subtype CIER_PLLRDYIE_Field is STM32_SVD.Bit;
   subtype CIER_MSIRDYIE_Field is STM32_SVD.Bit;
   subtype CIER_HSI48RDYIE_Field is STM32_SVD.Bit;
   subtype CIER_CSSLSE_Field is STM32_SVD.Bit;

   --  Clock interrupt enable register
   type CIER_Register is record
      --  Read-only. LSI ready interrupt flag
      LSIRDYIE      : CIER_LSIRDYIE_Field;
      --  Read-only. LSE ready interrupt flag
      LSERDYIE      : CIER_LSERDYIE_Field;
      --  Read-only. HSI16 ready interrupt flag
      HSI16RDYIE    : CIER_HSI16RDYIE_Field;
      --  Read-only. HSE ready interrupt flag
      HSERDYIE      : CIER_HSERDYIE_Field;
      --  Read-only. PLL ready interrupt flag
      PLLRDYIE      : CIER_PLLRDYIE_Field;
      --  Read-only. MSI ready interrupt flag
      MSIRDYIE      : CIER_MSIRDYIE_Field;
      --  Read-only. HSI48 ready interrupt flag
      HSI48RDYIE    : CIER_HSI48RDYIE_Field;
      --  Read-only. LSE CSS interrupt flag
      CSSLSE        : CIER_CSSLSE_Field;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CIER_Register use record
      LSIRDYIE      at 0 range 0 .. 0;
      LSERDYIE      at 0 range 1 .. 1;
      HSI16RDYIE    at 0 range 2 .. 2;
      HSERDYIE      at 0 range 3 .. 3;
      PLLRDYIE      at 0 range 4 .. 4;
      MSIRDYIE      at 0 range 5 .. 5;
      HSI48RDYIE    at 0 range 6 .. 6;
      CSSLSE        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CIFR_LSIRDYF_Field is STM32_SVD.Bit;
   subtype CIFR_LSERDYF_Field is STM32_SVD.Bit;
   subtype CIFR_HSI16RDYF_Field is STM32_SVD.Bit;
   subtype CIFR_HSERDYF_Field is STM32_SVD.Bit;
   subtype CIFR_PLLRDYF_Field is STM32_SVD.Bit;
   subtype CIFR_MSIRDYF_Field is STM32_SVD.Bit;
   subtype CIFR_HSI48RDYF_Field is STM32_SVD.Bit;
   subtype CIFR_CSSLSEF_Field is STM32_SVD.Bit;
   subtype CIFR_CSSHSEF_Field is STM32_SVD.Bit;

   --  Clock interrupt flag register
   type CIFR_Register is record
      --  Read-only. LSI ready interrupt flag
      LSIRDYF       : CIFR_LSIRDYF_Field;
      --  Read-only. LSE ready interrupt flag
      LSERDYF       : CIFR_LSERDYF_Field;
      --  Read-only. HSI16 ready interrupt flag
      HSI16RDYF     : CIFR_HSI16RDYF_Field;
      --  Read-only. HSE ready interrupt flag
      HSERDYF       : CIFR_HSERDYF_Field;
      --  Read-only. PLL ready interrupt flag
      PLLRDYF       : CIFR_PLLRDYF_Field;
      --  Read-only. MSI ready interrupt flag
      MSIRDYF       : CIFR_MSIRDYF_Field;
      --  Read-only. HSI48 ready interrupt flag
      HSI48RDYF     : CIFR_HSI48RDYF_Field;
      --  Read-only. LSE Clock Security System Interrupt flag
      CSSLSEF       : CIFR_CSSLSEF_Field;
      --  Read-only. Clock Security System Interrupt flag
      CSSHSEF       : CIFR_CSSHSEF_Field;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CIFR_Register use record
      LSIRDYF       at 0 range 0 .. 0;
      LSERDYF       at 0 range 1 .. 1;
      HSI16RDYF     at 0 range 2 .. 2;
      HSERDYF       at 0 range 3 .. 3;
      PLLRDYF       at 0 range 4 .. 4;
      MSIRDYF       at 0 range 5 .. 5;
      HSI48RDYF     at 0 range 6 .. 6;
      CSSLSEF       at 0 range 7 .. 7;
      CSSHSEF       at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype CICR_LSIRDYC_Field is STM32_SVD.Bit;
   subtype CICR_LSERDYC_Field is STM32_SVD.Bit;
   subtype CICR_HSI16RDYC_Field is STM32_SVD.Bit;
   subtype CICR_HSERDYC_Field is STM32_SVD.Bit;
   subtype CICR_PLLRDYC_Field is STM32_SVD.Bit;
   subtype CICR_MSIRDYC_Field is STM32_SVD.Bit;
   subtype CICR_HSI48RDYC_Field is STM32_SVD.Bit;
   subtype CICR_CSSLSEC_Field is STM32_SVD.Bit;
   subtype CICR_CSSHSEC_Field is STM32_SVD.Bit;

   --  Clock interrupt clear register
   type CICR_Register is record
      --  Read-only. LSI ready Interrupt clear
      LSIRDYC       : CICR_LSIRDYC_Field;
      --  Read-only. LSE ready Interrupt clear
      LSERDYC       : CICR_LSERDYC_Field;
      --  Read-only. HSI16 ready Interrupt clear
      HSI16RDYC     : CICR_HSI16RDYC_Field;
      --  Read-only. HSE ready Interrupt clear
      HSERDYC       : CICR_HSERDYC_Field;
      --  Read-only. PLL ready Interrupt clear
      PLLRDYC       : CICR_PLLRDYC_Field;
      --  Read-only. MSI ready Interrupt clear
      MSIRDYC       : CICR_MSIRDYC_Field;
      --  Read-only. HSI48 ready Interrupt clear
      HSI48RDYC     : CICR_HSI48RDYC_Field;
      --  Read-only. LSE Clock Security System Interrupt clear
      CSSLSEC       : CICR_CSSLSEC_Field;
      --  Read-only. Clock Security System Interrupt clear
      CSSHSEC       : CICR_CSSHSEC_Field;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CICR_Register use record
      LSIRDYC       at 0 range 0 .. 0;
      LSERDYC       at 0 range 1 .. 1;
      HSI16RDYC     at 0 range 2 .. 2;
      HSERDYC       at 0 range 3 .. 3;
      PLLRDYC       at 0 range 4 .. 4;
      MSIRDYC       at 0 range 5 .. 5;
      HSI48RDYC     at 0 range 6 .. 6;
      CSSLSEC       at 0 range 7 .. 7;
      CSSHSEC       at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype IOPRSTR_IOPARST_Field is STM32_SVD.Bit;
   subtype IOPRSTR_IOPBRST_Field is STM32_SVD.Bit;
   subtype IOPRSTR_IOPCRST_Field is STM32_SVD.Bit;
   subtype IOPRSTR_IOPDRST_Field is STM32_SVD.Bit;
   subtype IOPRSTR_IOPERST_Field is STM32_SVD.Bit;
   subtype IOPRSTR_IOPHRST_Field is STM32_SVD.Bit;

   --  GPIO reset register
   type IOPRSTR_Register is record
      --  I/O port A reset
      IOPARST       : IOPRSTR_IOPARST_Field := 16#0#;
      --  I/O port B reset
      IOPBRST       : IOPRSTR_IOPBRST_Field := 16#0#;
      --  I/O port A reset
      IOPCRST       : IOPRSTR_IOPCRST_Field := 16#0#;
      --  I/O port D reset
      IOPDRST       : IOPRSTR_IOPDRST_Field := 16#0#;
      --  I/O port E reset
      IOPERST       : IOPRSTR_IOPERST_Field := 16#0#;
      --  unspecified
      Reserved_5_6  : STM32_SVD.UInt2 := 16#0#;
      --  I/O port H reset
      IOPHRST       : IOPRSTR_IOPHRST_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOPRSTR_Register use record
      IOPARST       at 0 range 0 .. 0;
      IOPBRST       at 0 range 1 .. 1;
      IOPCRST       at 0 range 2 .. 2;
      IOPDRST       at 0 range 3 .. 3;
      IOPERST       at 0 range 4 .. 4;
      Reserved_5_6  at 0 range 5 .. 6;
      IOPHRST       at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype AHBRSTR_DMARST_Field is STM32_SVD.Bit;
   subtype AHBRSTR_MIFRST_Field is STM32_SVD.Bit;
   subtype AHBRSTR_CRCRST_Field is STM32_SVD.Bit;
   subtype AHBRSTR_TOUCHRST_Field is STM32_SVD.Bit;
   subtype AHBRSTR_RNGRST_Field is STM32_SVD.Bit;
   subtype AHBRSTR_CRYPRST_Field is STM32_SVD.Bit;

   --  AHB peripheral reset register
   type AHBRSTR_Register is record
      --  DMA reset
      DMARST         : AHBRSTR_DMARST_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : STM32_SVD.UInt7 := 16#0#;
      --  Memory interface reset
      MIFRST         : AHBRSTR_MIFRST_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : STM32_SVD.UInt3 := 16#0#;
      --  Test integration module reset
      CRCRST         : AHBRSTR_CRCRST_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : STM32_SVD.UInt3 := 16#0#;
      --  Touch Sensing reset
      TOUCHRST       : AHBRSTR_TOUCHRST_Field := 16#0#;
      --  unspecified
      Reserved_17_19 : STM32_SVD.UInt3 := 16#0#;
      --  Random Number Generator module reset
      RNGRST         : AHBRSTR_RNGRST_Field := 16#0#;
      --  unspecified
      Reserved_21_23 : STM32_SVD.UInt3 := 16#0#;
      --  Crypto module reset
      CRYPRST        : AHBRSTR_CRYPRST_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHBRSTR_Register use record
      DMARST         at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      MIFRST         at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      CRCRST         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TOUCHRST       at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      RNGRST         at 0 range 20 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      CRYPRST        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype APB2RSTR_SYSCFGRST_Field is STM32_SVD.Bit;
   subtype APB2RSTR_TIM21RST_Field is STM32_SVD.Bit;
   subtype APB2RSTR_TM12RST_Field is STM32_SVD.Bit;
   subtype APB2RSTR_ADCRST_Field is STM32_SVD.Bit;
   subtype APB2RSTR_SPI1RST_Field is STM32_SVD.Bit;
   subtype APB2RSTR_USART1RST_Field is STM32_SVD.Bit;
   subtype APB2RSTR_DBGRST_Field is STM32_SVD.Bit;

   --  APB2 peripheral reset register
   type APB2RSTR_Register is record
      --  System configuration controller reset
      SYSCFGRST      : APB2RSTR_SYSCFGRST_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  TIM21 timer reset
      TIM21RST       : APB2RSTR_TIM21RST_Field := 16#0#;
      --  unspecified
      Reserved_3_4   : STM32_SVD.UInt2 := 16#0#;
      --  TIM22 timer reset
      TM12RST        : APB2RSTR_TM12RST_Field := 16#0#;
      --  unspecified
      Reserved_6_8   : STM32_SVD.UInt3 := 16#0#;
      --  ADC interface reset
      ADCRST         : APB2RSTR_ADCRST_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : STM32_SVD.UInt2 := 16#0#;
      --  SPI 1 reset
      SPI1RST        : APB2RSTR_SPI1RST_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : STM32_SVD.Bit := 16#0#;
      --  USART1 reset
      USART1RST      : APB2RSTR_USART1RST_Field := 16#0#;
      --  unspecified
      Reserved_15_21 : STM32_SVD.UInt7 := 16#0#;
      --  DBG reset
      DBGRST         : APB2RSTR_DBGRST_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2RSTR_Register use record
      SYSCFGRST      at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      TIM21RST       at 0 range 2 .. 2;
      Reserved_3_4   at 0 range 3 .. 4;
      TM12RST        at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      ADCRST         at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      SPI1RST        at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1RST      at 0 range 14 .. 14;
      Reserved_15_21 at 0 range 15 .. 21;
      DBGRST         at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype APB1RSTR_TIM2RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_TIM3RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_TIM6RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_TIM7RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_WWDRST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_SPI2RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_LPUART12RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_LPUART1RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_USART4RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_USART5RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_I2C1RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_I2C2RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_USBRST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_CRSRST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_PWRRST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_DACRST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_I2C3RST_Field is STM32_SVD.Bit;
   subtype APB1RSTR_LPTIM1RST_Field is STM32_SVD.Bit;

   --  APB1 peripheral reset register
   type APB1RSTR_Register is record
      --  Timer2 reset
      TIM2RST        : APB1RSTR_TIM2RST_Field := 16#0#;
      --  Timer3 reset
      TIM3RST        : APB1RSTR_TIM3RST_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : STM32_SVD.UInt2 := 16#0#;
      --  Timer 6 reset
      TIM6RST        : APB1RSTR_TIM6RST_Field := 16#0#;
      --  Timer 7 reset
      TIM7RST        : APB1RSTR_TIM7RST_Field := 16#0#;
      --  unspecified
      Reserved_6_10  : STM32_SVD.UInt5 := 16#0#;
      --  Window watchdog reset
      WWDRST         : APB1RSTR_WWDRST_Field := 16#0#;
      --  unspecified
      Reserved_12_13 : STM32_SVD.UInt2 := 16#0#;
      --  SPI2 reset
      SPI2RST        : APB1RSTR_SPI2RST_Field := 16#0#;
      --  unspecified
      Reserved_15_16 : STM32_SVD.UInt2 := 16#0#;
      --  UART2 reset
      LPUART12RST    : APB1RSTR_LPUART12RST_Field := 16#0#;
      --  LPUART1 reset
      LPUART1RST     : APB1RSTR_LPUART1RST_Field := 16#0#;
      --  USART4 reset
      USART4RST      : APB1RSTR_USART4RST_Field := 16#0#;
      --  USART5 reset
      USART5RST      : APB1RSTR_USART5RST_Field := 16#0#;
      --  I2C1 reset
      I2C1RST        : APB1RSTR_I2C1RST_Field := 16#0#;
      --  I2C2 reset
      I2C2RST        : APB1RSTR_I2C2RST_Field := 16#0#;
      --  USB reset
      USBRST         : APB1RSTR_USBRST_Field := 16#0#;
      --  unspecified
      Reserved_24_26 : STM32_SVD.UInt3 := 16#0#;
      --  Clock recovery system reset
      CRSRST         : APB1RSTR_CRSRST_Field := 16#0#;
      --  Power interface reset
      PWRRST         : APB1RSTR_PWRRST_Field := 16#0#;
      --  DAC interface reset
      DACRST         : APB1RSTR_DACRST_Field := 16#0#;
      --  I2C3 reset
      I2C3RST        : APB1RSTR_I2C3RST_Field := 16#0#;
      --  Low power timer reset
      LPTIM1RST      : APB1RSTR_LPTIM1RST_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1RSTR_Register use record
      TIM2RST        at 0 range 0 .. 0;
      TIM3RST        at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      TIM6RST        at 0 range 4 .. 4;
      TIM7RST        at 0 range 5 .. 5;
      Reserved_6_10  at 0 range 6 .. 10;
      WWDRST         at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      SPI2RST        at 0 range 14 .. 14;
      Reserved_15_16 at 0 range 15 .. 16;
      LPUART12RST    at 0 range 17 .. 17;
      LPUART1RST     at 0 range 18 .. 18;
      USART4RST      at 0 range 19 .. 19;
      USART5RST      at 0 range 20 .. 20;
      I2C1RST        at 0 range 21 .. 21;
      I2C2RST        at 0 range 22 .. 22;
      USBRST         at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      CRSRST         at 0 range 27 .. 27;
      PWRRST         at 0 range 28 .. 28;
      DACRST         at 0 range 29 .. 29;
      I2C3RST        at 0 range 30 .. 30;
      LPTIM1RST      at 0 range 31 .. 31;
   end record;

   subtype IOPENR_IOPAEN_Field is STM32_SVD.Bit;
   subtype IOPENR_IOPBEN_Field is STM32_SVD.Bit;
   subtype IOPENR_IOPCEN_Field is STM32_SVD.Bit;
   subtype IOPENR_IOPDEN_Field is STM32_SVD.Bit;
   subtype IOPENR_IOPEEN_Field is STM32_SVD.Bit;
   subtype IOPENR_IOPHEN_Field is STM32_SVD.Bit;

   --  GPIO clock enable register
   type IOPENR_Register is record
      --  IO port A clock enable bit
      IOPAEN        : IOPENR_IOPAEN_Field := 16#0#;
      --  IO port B clock enable bit
      IOPBEN        : IOPENR_IOPBEN_Field := 16#0#;
      --  IO port A clock enable bit
      IOPCEN        : IOPENR_IOPCEN_Field := 16#0#;
      --  I/O port D clock enable bit
      IOPDEN        : IOPENR_IOPDEN_Field := 16#0#;
      --  I/O port E clock enable bit
      IOPEEN        : IOPENR_IOPEEN_Field := 16#0#;
      --  unspecified
      Reserved_5_6  : STM32_SVD.UInt2 := 16#0#;
      --  I/O port H clock enable bit
      IOPHEN        : IOPENR_IOPHEN_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOPENR_Register use record
      IOPAEN        at 0 range 0 .. 0;
      IOPBEN        at 0 range 1 .. 1;
      IOPCEN        at 0 range 2 .. 2;
      IOPDEN        at 0 range 3 .. 3;
      IOPEEN        at 0 range 4 .. 4;
      Reserved_5_6  at 0 range 5 .. 6;
      IOPHEN        at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype AHBENR_DMAEN_Field is STM32_SVD.Bit;
   subtype AHBENR_MIFEN_Field is STM32_SVD.Bit;
   subtype AHBENR_CRCEN_Field is STM32_SVD.Bit;
   subtype AHBENR_TOUCHEN_Field is STM32_SVD.Bit;
   subtype AHBENR_RNGEN_Field is STM32_SVD.Bit;
   subtype AHBENR_CRYPEN_Field is STM32_SVD.Bit;

   --  AHB peripheral clock enable register
   type AHBENR_Register is record
      --  DMA clock enable bit
      DMAEN          : AHBENR_DMAEN_Field := 16#0#;
      --  unspecified
      Reserved_1_7   : STM32_SVD.UInt7 := 16#0#;
      --  NVM interface clock enable bit
      MIFEN          : AHBENR_MIFEN_Field := 16#1#;
      --  unspecified
      Reserved_9_11  : STM32_SVD.UInt3 := 16#0#;
      --  CRC clock enable bit
      CRCEN          : AHBENR_CRCEN_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : STM32_SVD.UInt3 := 16#0#;
      --  Touch Sensing clock enable bit
      TOUCHEN        : AHBENR_TOUCHEN_Field := 16#0#;
      --  unspecified
      Reserved_17_19 : STM32_SVD.UInt3 := 16#0#;
      --  Random Number Generator clock enable bit
      RNGEN          : AHBENR_RNGEN_Field := 16#0#;
      --  unspecified
      Reserved_21_23 : STM32_SVD.UInt3 := 16#0#;
      --  Crypto clock enable bit
      CRYPEN         : AHBENR_CRYPEN_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHBENR_Register use record
      DMAEN          at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      MIFEN          at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      CRCEN          at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TOUCHEN        at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      RNGEN          at 0 range 20 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      CRYPEN         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype APB2ENR_SYSCFGEN_Field is STM32_SVD.Bit;
   subtype APB2ENR_TIM21EN_Field is STM32_SVD.Bit;
   subtype APB2ENR_TIM22EN_Field is STM32_SVD.Bit;
   subtype APB2ENR_MIFIEN_Field is STM32_SVD.Bit;
   subtype APB2ENR_ADCEN_Field is STM32_SVD.Bit;
   subtype APB2ENR_SPI1EN_Field is STM32_SVD.Bit;
   subtype APB2ENR_USART1EN_Field is STM32_SVD.Bit;
   subtype APB2ENR_DBGEN_Field is STM32_SVD.Bit;

   --  APB2 peripheral clock enable register
   type APB2ENR_Register is record
      --  System configuration controller clock enable bit
      SYSCFGEN       : APB2ENR_SYSCFGEN_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  TIM21 timer clock enable bit
      TIM21EN        : APB2ENR_TIM21EN_Field := 16#0#;
      --  unspecified
      Reserved_3_4   : STM32_SVD.UInt2 := 16#0#;
      --  TIM22 timer clock enable bit
      TIM22EN        : APB2ENR_TIM22EN_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : STM32_SVD.Bit := 16#0#;
      --  MiFaRe Firewall clock enable bit
      MIFIEN         : APB2ENR_MIFIEN_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : STM32_SVD.Bit := 16#0#;
      --  ADC clock enable bit
      ADCEN          : APB2ENR_ADCEN_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : STM32_SVD.UInt2 := 16#0#;
      --  SPI1 clock enable bit
      SPI1EN         : APB2ENR_SPI1EN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : STM32_SVD.Bit := 16#0#;
      --  USART1 clock enable bit
      USART1EN       : APB2ENR_USART1EN_Field := 16#0#;
      --  unspecified
      Reserved_15_21 : STM32_SVD.UInt7 := 16#0#;
      --  DBG clock enable bit
      DBGEN          : APB2ENR_DBGEN_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2ENR_Register use record
      SYSCFGEN       at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      TIM21EN        at 0 range 2 .. 2;
      Reserved_3_4   at 0 range 3 .. 4;
      TIM22EN        at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      MIFIEN         at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      ADCEN          at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      SPI1EN         at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1EN       at 0 range 14 .. 14;
      Reserved_15_21 at 0 range 15 .. 21;
      DBGEN          at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype APB1ENR_TIM2EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_TIM3EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_TIM6EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_TIM7EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_WWDGEN_Field is STM32_SVD.Bit;
   subtype APB1ENR_SPI2EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_USART2EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_LPUART1EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_USART4EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_USART5EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_I2C1EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_I2C2EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_USBEN_Field is STM32_SVD.Bit;
   subtype APB1ENR_CRSEN_Field is STM32_SVD.Bit;
   subtype APB1ENR_PWREN_Field is STM32_SVD.Bit;
   subtype APB1ENR_DACEN_Field is STM32_SVD.Bit;
   subtype APB1ENR_I2C3EN_Field is STM32_SVD.Bit;
   subtype APB1ENR_LPTIM1EN_Field is STM32_SVD.Bit;

   --  APB1 peripheral clock enable register
   type APB1ENR_Register is record
      --  Timer2 clock enable bit
      TIM2EN         : APB1ENR_TIM2EN_Field := 16#0#;
      --  Timer3 clock enable bit
      TIM3EN         : APB1ENR_TIM3EN_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : STM32_SVD.UInt2 := 16#0#;
      --  Timer 6 clock enable bit
      TIM6EN         : APB1ENR_TIM6EN_Field := 16#0#;
      --  Timer 7 clock enable bit
      TIM7EN         : APB1ENR_TIM7EN_Field := 16#0#;
      --  unspecified
      Reserved_6_10  : STM32_SVD.UInt5 := 16#0#;
      --  Window watchdog clock enable bit
      WWDGEN         : APB1ENR_WWDGEN_Field := 16#0#;
      --  unspecified
      Reserved_12_13 : STM32_SVD.UInt2 := 16#0#;
      --  SPI2 clock enable bit
      SPI2EN         : APB1ENR_SPI2EN_Field := 16#0#;
      --  unspecified
      Reserved_15_16 : STM32_SVD.UInt2 := 16#0#;
      --  UART2 clock enable bit
      USART2EN       : APB1ENR_USART2EN_Field := 16#0#;
      --  LPUART1 clock enable bit
      LPUART1EN      : APB1ENR_LPUART1EN_Field := 16#0#;
      --  USART4 clock enable bit
      USART4EN       : APB1ENR_USART4EN_Field := 16#0#;
      --  USART5 clock enable bit
      USART5EN       : APB1ENR_USART5EN_Field := 16#0#;
      --  I2C1 clock enable bit
      I2C1EN         : APB1ENR_I2C1EN_Field := 16#0#;
      --  I2C2 clock enable bit
      I2C2EN         : APB1ENR_I2C2EN_Field := 16#0#;
      --  USB clock enable bit
      USBEN          : APB1ENR_USBEN_Field := 16#0#;
      --  unspecified
      Reserved_24_26 : STM32_SVD.UInt3 := 16#0#;
      --  Clock recovery system clock enable bit
      CRSEN          : APB1ENR_CRSEN_Field := 16#0#;
      --  Power interface clock enable bit
      PWREN          : APB1ENR_PWREN_Field := 16#0#;
      --  DAC interface clock enable bit
      DACEN          : APB1ENR_DACEN_Field := 16#0#;
      --  I2C3 clock enable bit
      I2C3EN         : APB1ENR_I2C3EN_Field := 16#0#;
      --  Low power timer clock enable bit
      LPTIM1EN       : APB1ENR_LPTIM1EN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1ENR_Register use record
      TIM2EN         at 0 range 0 .. 0;
      TIM3EN         at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      TIM6EN         at 0 range 4 .. 4;
      TIM7EN         at 0 range 5 .. 5;
      Reserved_6_10  at 0 range 6 .. 10;
      WWDGEN         at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      SPI2EN         at 0 range 14 .. 14;
      Reserved_15_16 at 0 range 15 .. 16;
      USART2EN       at 0 range 17 .. 17;
      LPUART1EN      at 0 range 18 .. 18;
      USART4EN       at 0 range 19 .. 19;
      USART5EN       at 0 range 20 .. 20;
      I2C1EN         at 0 range 21 .. 21;
      I2C2EN         at 0 range 22 .. 22;
      USBEN          at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      CRSEN          at 0 range 27 .. 27;
      PWREN          at 0 range 28 .. 28;
      DACEN          at 0 range 29 .. 29;
      I2C3EN         at 0 range 30 .. 30;
      LPTIM1EN       at 0 range 31 .. 31;
   end record;

   subtype IOPSMEN_IOPASMEN_Field is STM32_SVD.Bit;
   subtype IOPSMEN_IOPBSMEN_Field is STM32_SVD.Bit;
   subtype IOPSMEN_IOPCSMEN_Field is STM32_SVD.Bit;
   subtype IOPSMEN_IOPDSMEN_Field is STM32_SVD.Bit;
   subtype IOPSMEN_IOPESMEN_Field is STM32_SVD.Bit;
   subtype IOPSMEN_IOPHSMEN_Field is STM32_SVD.Bit;

   --  GPIO clock enable in sleep mode register
   type IOPSMEN_Register is record
      --  IOPASMEN
      IOPASMEN      : IOPSMEN_IOPASMEN_Field := 16#1#;
      --  IOPBSMEN
      IOPBSMEN      : IOPSMEN_IOPBSMEN_Field := 16#1#;
      --  IOPCSMEN
      IOPCSMEN      : IOPSMEN_IOPCSMEN_Field := 16#1#;
      --  IOPDSMEN
      IOPDSMEN      : IOPSMEN_IOPDSMEN_Field := 16#1#;
      --  Port E clock enable during Sleep mode bit
      IOPESMEN      : IOPSMEN_IOPESMEN_Field := 16#0#;
      --  unspecified
      Reserved_5_6  : STM32_SVD.UInt2 := 16#0#;
      --  IOPHSMEN
      IOPHSMEN      : IOPSMEN_IOPHSMEN_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOPSMEN_Register use record
      IOPASMEN      at 0 range 0 .. 0;
      IOPBSMEN      at 0 range 1 .. 1;
      IOPCSMEN      at 0 range 2 .. 2;
      IOPDSMEN      at 0 range 3 .. 3;
      IOPESMEN      at 0 range 4 .. 4;
      Reserved_5_6  at 0 range 5 .. 6;
      IOPHSMEN      at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype AHBSMENR_DMASMEN_Field is STM32_SVD.Bit;
   subtype AHBSMENR_MIFSMEN_Field is STM32_SVD.Bit;
   subtype AHBSMENR_SRAMSMEN_Field is STM32_SVD.Bit;
   subtype AHBSMENR_CRCSMEN_Field is STM32_SVD.Bit;
   subtype AHBSMENR_TOUCHSMEN_Field is STM32_SVD.Bit;
   subtype AHBSMENR_RNGSMEN_Field is STM32_SVD.Bit;
   subtype AHBSMENR_CRYPSMEN_Field is STM32_SVD.Bit;

   --  AHB peripheral clock enable in sleep mode register
   type AHBSMENR_Register is record
      --  DMA clock enable during sleep mode bit
      DMASMEN        : AHBSMENR_DMASMEN_Field := 16#1#;
      --  unspecified
      Reserved_1_7   : STM32_SVD.UInt7 := 16#0#;
      --  NVM interface clock enable during sleep mode bit
      MIFSMEN        : AHBSMENR_MIFSMEN_Field := 16#1#;
      --  SRAM interface clock enable during sleep mode bit
      SRAMSMEN       : AHBSMENR_SRAMSMEN_Field := 16#1#;
      --  unspecified
      Reserved_10_11 : STM32_SVD.UInt2 := 16#0#;
      --  CRC clock enable during sleep mode bit
      CRCSMEN        : AHBSMENR_CRCSMEN_Field := 16#1#;
      --  unspecified
      Reserved_13_15 : STM32_SVD.UInt3 := 16#0#;
      --  Touch Sensing clock enable during sleep mode bit
      TOUCHSMEN      : AHBSMENR_TOUCHSMEN_Field := 16#1#;
      --  unspecified
      Reserved_17_19 : STM32_SVD.UInt3 := 16#0#;
      --  Random Number Generator clock enable during sleep mode bit
      RNGSMEN        : AHBSMENR_RNGSMEN_Field := 16#1#;
      --  unspecified
      Reserved_21_23 : STM32_SVD.UInt3 := 16#0#;
      --  Crypto clock enable during sleep mode bit
      CRYPSMEN       : AHBSMENR_CRYPSMEN_Field := 16#1#;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHBSMENR_Register use record
      DMASMEN        at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      MIFSMEN        at 0 range 8 .. 8;
      SRAMSMEN       at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      CRCSMEN        at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TOUCHSMEN      at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      RNGSMEN        at 0 range 20 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      CRYPSMEN       at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype APB2SMENR_SYSCFGSMEN_Field is STM32_SVD.Bit;
   subtype APB2SMENR_TIM21SMEN_Field is STM32_SVD.Bit;
   subtype APB2SMENR_TIM22SMEN_Field is STM32_SVD.Bit;
   subtype APB2SMENR_ADCSMEN_Field is STM32_SVD.Bit;
   subtype APB2SMENR_SPI1SMEN_Field is STM32_SVD.Bit;
   subtype APB2SMENR_USART1SMEN_Field is STM32_SVD.Bit;
   subtype APB2SMENR_DBGSMEN_Field is STM32_SVD.Bit;

   --  APB2 peripheral clock enable in sleep mode register
   type APB2SMENR_Register is record
      --  System configuration controller clock enable during sleep mode bit
      SYSCFGSMEN     : APB2SMENR_SYSCFGSMEN_Field := 16#1#;
      --  unspecified
      Reserved_1_1   : STM32_SVD.Bit := 16#0#;
      --  TIM21 timer clock enable during sleep mode bit
      TIM21SMEN      : APB2SMENR_TIM21SMEN_Field := 16#1#;
      --  unspecified
      Reserved_3_4   : STM32_SVD.UInt2 := 16#0#;
      --  TIM22 timer clock enable during sleep mode bit
      TIM22SMEN      : APB2SMENR_TIM22SMEN_Field := 16#1#;
      --  unspecified
      Reserved_6_8   : STM32_SVD.UInt3 := 16#0#;
      --  ADC clock enable during sleep mode bit
      ADCSMEN        : APB2SMENR_ADCSMEN_Field := 16#1#;
      --  unspecified
      Reserved_10_11 : STM32_SVD.UInt2 := 16#0#;
      --  SPI1 clock enable during sleep mode bit
      SPI1SMEN       : APB2SMENR_SPI1SMEN_Field := 16#1#;
      --  unspecified
      Reserved_13_13 : STM32_SVD.Bit := 16#0#;
      --  USART1 clock enable during sleep mode bit
      USART1SMEN     : APB2SMENR_USART1SMEN_Field := 16#1#;
      --  unspecified
      Reserved_15_21 : STM32_SVD.UInt7 := 16#0#;
      --  DBG clock enable during sleep mode bit
      DBGSMEN        : APB2SMENR_DBGSMEN_Field := 16#1#;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2SMENR_Register use record
      SYSCFGSMEN     at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      TIM21SMEN      at 0 range 2 .. 2;
      Reserved_3_4   at 0 range 3 .. 4;
      TIM22SMEN      at 0 range 5 .. 5;
      Reserved_6_8   at 0 range 6 .. 8;
      ADCSMEN        at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      SPI1SMEN       at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1SMEN     at 0 range 14 .. 14;
      Reserved_15_21 at 0 range 15 .. 21;
      DBGSMEN        at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype APB1SMENR_TIM2SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_TIM3SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_TIM6SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_TIM7SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_WWDGSMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_SPI2SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_USART2SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_LPUART1SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_USART4SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_USART5SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_I2C1SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_I2C2SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_USBSMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_CRSSMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_PWRSMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_DACSMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_I2C3SMEN_Field is STM32_SVD.Bit;
   subtype APB1SMENR_LPTIM1SMEN_Field is STM32_SVD.Bit;

   --  APB1 peripheral clock enable in sleep mode register
   type APB1SMENR_Register is record
      --  Timer2 clock enable during sleep mode bit
      TIM2SMEN       : APB1SMENR_TIM2SMEN_Field := 16#1#;
      --  Timer3 clock enable during Sleep mode bit
      TIM3SMEN       : APB1SMENR_TIM3SMEN_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : STM32_SVD.UInt2 := 16#0#;
      --  Timer 6 clock enable during sleep mode bit
      TIM6SMEN       : APB1SMENR_TIM6SMEN_Field := 16#1#;
      --  Timer 7 clock enable during Sleep mode bit
      TIM7SMEN       : APB1SMENR_TIM7SMEN_Field := 16#0#;
      --  unspecified
      Reserved_6_10  : STM32_SVD.UInt5 := 16#8#;
      --  Window watchdog clock enable during sleep mode bit
      WWDGSMEN       : APB1SMENR_WWDGSMEN_Field := 16#1#;
      --  unspecified
      Reserved_12_13 : STM32_SVD.UInt2 := 16#0#;
      --  SPI2 clock enable during sleep mode bit
      SPI2SMEN       : APB1SMENR_SPI2SMEN_Field := 16#1#;
      --  unspecified
      Reserved_15_16 : STM32_SVD.UInt2 := 16#0#;
      --  UART2 clock enable during sleep mode bit
      USART2SMEN     : APB1SMENR_USART2SMEN_Field := 16#1#;
      --  LPUART1 clock enable during sleep mode bit
      LPUART1SMEN    : APB1SMENR_LPUART1SMEN_Field := 16#1#;
      --  USART4 clock enable during Sleep mode bit
      USART4SMEN     : APB1SMENR_USART4SMEN_Field := 16#0#;
      --  USART5 clock enable during Sleep mode bit
      USART5SMEN     : APB1SMENR_USART5SMEN_Field := 16#0#;
      --  I2C1 clock enable during sleep mode bit
      I2C1SMEN       : APB1SMENR_I2C1SMEN_Field := 16#1#;
      --  I2C2 clock enable during sleep mode bit
      I2C2SMEN       : APB1SMENR_I2C2SMEN_Field := 16#1#;
      --  USB clock enable during sleep mode bit
      USBSMEN        : APB1SMENR_USBSMEN_Field := 16#1#;
      --  unspecified
      Reserved_24_26 : STM32_SVD.UInt3 := 16#0#;
      --  Clock recovery system clock enable during sleep mode bit
      CRSSMEN        : APB1SMENR_CRSSMEN_Field := 16#1#;
      --  Power interface clock enable during sleep mode bit
      PWRSMEN        : APB1SMENR_PWRSMEN_Field := 16#1#;
      --  DAC interface clock enable during sleep mode bit
      DACSMEN        : APB1SMENR_DACSMEN_Field := 16#1#;
      --  2C3 clock enable during Sleep mode bit
      I2C3SMEN       : APB1SMENR_I2C3SMEN_Field := 16#0#;
      --  Low power timer clock enable during sleep mode bit
      LPTIM1SMEN     : APB1SMENR_LPTIM1SMEN_Field := 16#1#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1SMENR_Register use record
      TIM2SMEN       at 0 range 0 .. 0;
      TIM3SMEN       at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      TIM6SMEN       at 0 range 4 .. 4;
      TIM7SMEN       at 0 range 5 .. 5;
      Reserved_6_10  at 0 range 6 .. 10;
      WWDGSMEN       at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      SPI2SMEN       at 0 range 14 .. 14;
      Reserved_15_16 at 0 range 15 .. 16;
      USART2SMEN     at 0 range 17 .. 17;
      LPUART1SMEN    at 0 range 18 .. 18;
      USART4SMEN     at 0 range 19 .. 19;
      USART5SMEN     at 0 range 20 .. 20;
      I2C1SMEN       at 0 range 21 .. 21;
      I2C2SMEN       at 0 range 22 .. 22;
      USBSMEN        at 0 range 23 .. 23;
      Reserved_24_26 at 0 range 24 .. 26;
      CRSSMEN        at 0 range 27 .. 27;
      PWRSMEN        at 0 range 28 .. 28;
      DACSMEN        at 0 range 29 .. 29;
      I2C3SMEN       at 0 range 30 .. 30;
      LPTIM1SMEN     at 0 range 31 .. 31;
   end record;

   --  CCIPR_USART1SEL array element
   subtype CCIPR_USART1SEL_Element is STM32_SVD.Bit;

   --  CCIPR_USART1SEL array
   type CCIPR_USART1SEL_Field_Array is array (0 .. 1)
     of CCIPR_USART1SEL_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CCIPR_USART1SEL
   type CCIPR_USART1SEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  USART1SEL as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  USART1SEL as an array
            Arr : CCIPR_USART1SEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CCIPR_USART1SEL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  CCIPR_USART2SEL array element
   subtype CCIPR_USART2SEL_Element is STM32_SVD.Bit;

   --  CCIPR_USART2SEL array
   type CCIPR_USART2SEL_Field_Array is array (0 .. 1)
     of CCIPR_USART2SEL_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CCIPR_USART2SEL
   type CCIPR_USART2SEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  USART2SEL as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  USART2SEL as an array
            Arr : CCIPR_USART2SEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CCIPR_USART2SEL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  CCIPR_LPUART1SEL array element
   subtype CCIPR_LPUART1SEL_Element is STM32_SVD.Bit;

   --  CCIPR_LPUART1SEL array
   type CCIPR_LPUART1SEL_Field_Array is array (0 .. 1)
     of CCIPR_LPUART1SEL_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CCIPR_LPUART1SEL
   type CCIPR_LPUART1SEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  LPUART1SEL as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  LPUART1SEL as an array
            Arr : CCIPR_LPUART1SEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CCIPR_LPUART1SEL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  CCIPR_I2C1SEL array element
   subtype CCIPR_I2C1SEL_Element is STM32_SVD.Bit;

   --  CCIPR_I2C1SEL array
   type CCIPR_I2C1SEL_Field_Array is array (0 .. 1) of CCIPR_I2C1SEL_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CCIPR_I2C1SEL
   type CCIPR_I2C1SEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  I2C1SEL as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  I2C1SEL as an array
            Arr : CCIPR_I2C1SEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CCIPR_I2C1SEL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype CCIPR_I2C3SEL_Field is STM32_SVD.UInt2;
   --  CCIPR_LPTIM1SEL array element
   subtype CCIPR_LPTIM1SEL_Element is STM32_SVD.Bit;

   --  CCIPR_LPTIM1SEL array
   type CCIPR_LPTIM1SEL_Field_Array is array (0 .. 1)
     of CCIPR_LPTIM1SEL_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CCIPR_LPTIM1SEL
   type CCIPR_LPTIM1SEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  LPTIM1SEL as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  LPTIM1SEL as an array
            Arr : CCIPR_LPTIM1SEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CCIPR_LPTIM1SEL_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype CCIPR_HSI48MSEL_Field is STM32_SVD.Bit;

   --  Clock configuration register
   type CCIPR_Register is record
      --  USART1SEL0
      USART1SEL      : CCIPR_USART1SEL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  USART2SEL0
      USART2SEL      : CCIPR_USART2SEL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_9   : STM32_SVD.UInt6 := 16#0#;
      --  LPUART1SEL0
      LPUART1SEL     : CCIPR_LPUART1SEL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  I2C1SEL0
      I2C1SEL        : CCIPR_I2C1SEL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_15 : STM32_SVD.UInt2 := 16#0#;
      --  I2C3 clock source selection bits
      I2C3SEL        : CCIPR_I2C3SEL_Field := 16#0#;
      --  LPTIM1SEL0
      LPTIM1SEL      : CCIPR_LPTIM1SEL_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_20_25 : STM32_SVD.UInt6 := 16#0#;
      --  48 MHz HSI48 clock source selection bit
      HSI48MSEL      : CCIPR_HSI48MSEL_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : STM32_SVD.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCIPR_Register use record
      USART1SEL      at 0 range 0 .. 1;
      USART2SEL      at 0 range 2 .. 3;
      Reserved_4_9   at 0 range 4 .. 9;
      LPUART1SEL     at 0 range 10 .. 11;
      I2C1SEL        at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      I2C3SEL        at 0 range 16 .. 17;
      LPTIM1SEL      at 0 range 18 .. 19;
      Reserved_20_25 at 0 range 20 .. 25;
      HSI48MSEL      at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype CSR_LSION_Field is STM32_SVD.Bit;
   subtype CSR_LSIRDY_Field is STM32_SVD.Bit;
   subtype CSR_LSEON_Field is STM32_SVD.Bit;
   subtype CSR_LSERDY_Field is STM32_SVD.Bit;
   subtype CSR_LSEBYP_Field is STM32_SVD.Bit;
   subtype CSR_LSEDRV_Field is STM32_SVD.UInt2;
   subtype CSR_CSSLSEON_Field is STM32_SVD.Bit;
   subtype CSR_CSSLSED_Field is STM32_SVD.Bit;
   subtype CSR_RTCSEL_Field is STM32_SVD.UInt2;
   subtype CSR_RTCEN_Field is STM32_SVD.Bit;
   subtype CSR_RTCRST_Field is STM32_SVD.Bit;
   subtype CSR_RMVF_Field is STM32_SVD.Bit;
   subtype CSR_OBLRSTF_Field is STM32_SVD.Bit;
   subtype CSR_PINRSTF_Field is STM32_SVD.Bit;
   subtype CSR_PORRSTF_Field is STM32_SVD.Bit;
   subtype CSR_SFTRSTF_Field is STM32_SVD.Bit;
   subtype CSR_IWDGRSTF_Field is STM32_SVD.Bit;
   subtype CSR_WWDGRSTF_Field is STM32_SVD.Bit;
   subtype CSR_LPWRSTF_Field is STM32_SVD.Bit;

   --  Control and status register
   type CSR_Register is record
      --  Internal low-speed oscillator enable
      LSION          : CSR_LSION_Field := 16#0#;
      --  Internal low-speed oscillator ready bit
      LSIRDY         : CSR_LSIRDY_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : STM32_SVD.UInt6 := 16#0#;
      --  External low-speed oscillator enable bit
      LSEON          : CSR_LSEON_Field := 16#0#;
      --  Read-only. External low-speed oscillator ready bit
      LSERDY         : CSR_LSERDY_Field := 16#0#;
      --  External low-speed oscillator bypass bit
      LSEBYP         : CSR_LSEBYP_Field := 16#0#;
      --  LSEDRV
      LSEDRV         : CSR_LSEDRV_Field := 16#0#;
      --  CSSLSEON
      CSSLSEON       : CSR_CSSLSEON_Field := 16#0#;
      --  CSS on LSE failure detection flag
      CSSLSED        : CSR_CSSLSED_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : STM32_SVD.Bit := 16#0#;
      --  RTC and LCD clock source selection bits
      RTCSEL         : CSR_RTCSEL_Field := 16#0#;
      --  RTC clock enable bit
      RTCEN          : CSR_RTCEN_Field := 16#0#;
      --  RTC software reset bit
      RTCRST         : CSR_RTCRST_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : STM32_SVD.UInt4 := 16#0#;
      --  Remove reset flag
      RMVF           : CSR_RMVF_Field := 16#0#;
      --  OBLRSTF
      OBLRSTF        : CSR_OBLRSTF_Field := 16#0#;
      --  PIN reset flag
      PINRSTF        : CSR_PINRSTF_Field := 16#1#;
      --  POR/PDR reset flag
      PORRSTF        : CSR_PORRSTF_Field := 16#1#;
      --  Software reset flag
      SFTRSTF        : CSR_SFTRSTF_Field := 16#0#;
      --  Independent watchdog reset flag
      IWDGRSTF       : CSR_IWDGRSTF_Field := 16#0#;
      --  Window watchdog reset flag
      WWDGRSTF       : CSR_WWDGRSTF_Field := 16#0#;
      --  Low-power reset flag
      LPWRSTF        : CSR_LPWRSTF_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      LSION          at 0 range 0 .. 0;
      LSIRDY         at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      LSEON          at 0 range 8 .. 8;
      LSERDY         at 0 range 9 .. 9;
      LSEBYP         at 0 range 10 .. 10;
      LSEDRV         at 0 range 11 .. 12;
      CSSLSEON       at 0 range 13 .. 13;
      CSSLSED        at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      RTCSEL         at 0 range 16 .. 17;
      RTCEN          at 0 range 18 .. 18;
      RTCRST         at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      RMVF           at 0 range 24 .. 24;
      OBLRSTF        at 0 range 25 .. 25;
      PINRSTF        at 0 range 26 .. 26;
      PORRSTF        at 0 range 27 .. 27;
      SFTRSTF        at 0 range 28 .. 28;
      IWDGRSTF       at 0 range 29 .. 29;
      WWDGRSTF       at 0 range 30 .. 30;
      LPWRSTF        at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Reset and clock control
   type RCC_Peripheral is record
      --  Clock control register
      CR        : aliased CR_Register;
      --  Internal clock sources calibration register
      ICSCR     : aliased ICSCR_Register;
      --  Clock recovery RC register
      CRRCR     : aliased CRRCR_Register;
      --  Clock configuration register
      CFGR      : aliased CFGR_Register;
      --  Clock interrupt enable register
      CIER      : aliased CIER_Register;
      --  Clock interrupt flag register
      CIFR      : aliased CIFR_Register;
      --  Clock interrupt clear register
      CICR      : aliased CICR_Register;
      --  GPIO reset register
      IOPRSTR   : aliased IOPRSTR_Register;
      --  AHB peripheral reset register
      AHBRSTR   : aliased AHBRSTR_Register;
      --  APB2 peripheral reset register
      APB2RSTR  : aliased APB2RSTR_Register;
      --  APB1 peripheral reset register
      APB1RSTR  : aliased APB1RSTR_Register;
      --  GPIO clock enable register
      IOPENR    : aliased IOPENR_Register;
      --  AHB peripheral clock enable register
      AHBENR    : aliased AHBENR_Register;
      --  APB2 peripheral clock enable register
      APB2ENR   : aliased APB2ENR_Register;
      --  APB1 peripheral clock enable register
      APB1ENR   : aliased APB1ENR_Register;
      --  GPIO clock enable in sleep mode register
      IOPSMEN   : aliased IOPSMEN_Register;
      --  AHB peripheral clock enable in sleep mode register
      AHBSMENR  : aliased AHBSMENR_Register;
      --  APB2 peripheral clock enable in sleep mode register
      APB2SMENR : aliased APB2SMENR_Register;
      --  APB1 peripheral clock enable in sleep mode register
      APB1SMENR : aliased APB1SMENR_Register;
      --  Clock configuration register
      CCIPR     : aliased CCIPR_Register;
      --  Control and status register
      CSR       : aliased CSR_Register;
   end record
     with Volatile;

   for RCC_Peripheral use record
      CR        at 16#0# range 0 .. 31;
      ICSCR     at 16#4# range 0 .. 31;
      CRRCR     at 16#8# range 0 .. 31;
      CFGR      at 16#C# range 0 .. 31;
      CIER      at 16#10# range 0 .. 31;
      CIFR      at 16#14# range 0 .. 31;
      CICR      at 16#18# range 0 .. 31;
      IOPRSTR   at 16#1C# range 0 .. 31;
      AHBRSTR   at 16#20# range 0 .. 31;
      APB2RSTR  at 16#24# range 0 .. 31;
      APB1RSTR  at 16#28# range 0 .. 31;
      IOPENR    at 16#2C# range 0 .. 31;
      AHBENR    at 16#30# range 0 .. 31;
      APB2ENR   at 16#34# range 0 .. 31;
      APB1ENR   at 16#38# range 0 .. 31;
      IOPSMEN   at 16#3C# range 0 .. 31;
      AHBSMENR  at 16#40# range 0 .. 31;
      APB2SMENR at 16#44# range 0 .. 31;
      APB1SMENR at 16#48# range 0 .. 31;
      CCIPR     at 16#4C# range 0 .. 31;
      CSR       at 16#50# range 0 .. 31;
   end record;

   --  Reset and clock control
   RCC_Periph : aliased RCC_Peripheral
     with Import, Address => RCC_Base;

end STM32_SVD.RCC;
