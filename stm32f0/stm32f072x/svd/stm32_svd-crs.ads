--  This spec has been automatically generated from STM32F072x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.CRS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_SYNCOKIE_Field is STM32_SVD.Bit;
   subtype CR_SYNCWARNIE_Field is STM32_SVD.Bit;
   subtype CR_ERRIE_Field is STM32_SVD.Bit;
   subtype CR_ESYNCIE_Field is STM32_SVD.Bit;
   subtype CR_CEN_Field is STM32_SVD.Bit;
   subtype CR_AUTOTRIMEN_Field is STM32_SVD.Bit;
   subtype CR_SWSYNC_Field is STM32_SVD.Bit;
   subtype CR_TRIM_Field is STM32_SVD.UInt6;

   --  control register
   type CR_Register is record
      --  SYNC event OK interrupt enable
      SYNCOKIE       : CR_SYNCOKIE_Field := 16#0#;
      --  SYNC warning interrupt enable
      SYNCWARNIE     : CR_SYNCWARNIE_Field := 16#0#;
      --  Synchronization or trimming error interrupt enable
      ERRIE          : CR_ERRIE_Field := 16#0#;
      --  Expected SYNC interrupt enable
      ESYNCIE        : CR_ESYNCIE_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : STM32_SVD.Bit := 16#0#;
      --  Frequency error counter enable
      CEN            : CR_CEN_Field := 16#0#;
      --  Automatic trimming enable
      AUTOTRIMEN     : CR_AUTOTRIMEN_Field := 16#0#;
      --  Generate software SYNC event
      SWSYNC         : CR_SWSYNC_Field := 16#0#;
      --  HSI48 oscillator smooth trimming
      TRIM           : CR_TRIM_Field := 16#20#;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      SYNCOKIE       at 0 range 0 .. 0;
      SYNCWARNIE     at 0 range 1 .. 1;
      ERRIE          at 0 range 2 .. 2;
      ESYNCIE        at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      CEN            at 0 range 5 .. 5;
      AUTOTRIMEN     at 0 range 6 .. 6;
      SWSYNC         at 0 range 7 .. 7;
      TRIM           at 0 range 8 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype CFGR_RELOAD_Field is STM32_SVD.UInt16;
   subtype CFGR_FELIM_Field is STM32_SVD.Byte;
   subtype CFGR_SYNCDIV_Field is STM32_SVD.UInt3;
   subtype CFGR_SYNCSRC_Field is STM32_SVD.UInt2;
   subtype CFGR_SYNCPOL_Field is STM32_SVD.Bit;

   --  configuration register
   type CFGR_Register is record
      --  Counter reload value
      RELOAD         : CFGR_RELOAD_Field := 16#BB7F#;
      --  Frequency error limit
      FELIM          : CFGR_FELIM_Field := 16#22#;
      --  SYNC divider
      SYNCDIV        : CFGR_SYNCDIV_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : STM32_SVD.Bit := 16#0#;
      --  SYNC signal source selection
      SYNCSRC        : CFGR_SYNCSRC_Field := 16#2#;
      --  unspecified
      Reserved_30_30 : STM32_SVD.Bit := 16#0#;
      --  SYNC polarity selection
      SYNCPOL        : CFGR_SYNCPOL_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      RELOAD         at 0 range 0 .. 15;
      FELIM          at 0 range 16 .. 23;
      SYNCDIV        at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      SYNCSRC        at 0 range 28 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      SYNCPOL        at 0 range 31 .. 31;
   end record;

   subtype ISR_SYNCOKF_Field is STM32_SVD.Bit;
   subtype ISR_SYNCWARNF_Field is STM32_SVD.Bit;
   subtype ISR_ERRF_Field is STM32_SVD.Bit;
   subtype ISR_ESYNCF_Field is STM32_SVD.Bit;
   subtype ISR_SYNCERR_Field is STM32_SVD.Bit;
   subtype ISR_SYNCMISS_Field is STM32_SVD.Bit;
   subtype ISR_TRIMOVF_Field is STM32_SVD.Bit;
   subtype ISR_FEDIR_Field is STM32_SVD.Bit;
   subtype ISR_FECAP_Field is STM32_SVD.UInt16;

   --  interrupt and status register
   type ISR_Register is record
      --  Read-only. SYNC event OK flag
      SYNCOKF        : ISR_SYNCOKF_Field;
      --  Read-only. SYNC warning flag
      SYNCWARNF      : ISR_SYNCWARNF_Field;
      --  Read-only. Error flag
      ERRF           : ISR_ERRF_Field;
      --  Read-only. Expected SYNC flag
      ESYNCF         : ISR_ESYNCF_Field;
      --  unspecified
      Reserved_4_7   : STM32_SVD.UInt4;
      --  Read-only. SYNC error
      SYNCERR        : ISR_SYNCERR_Field;
      --  Read-only. SYNC missed
      SYNCMISS       : ISR_SYNCMISS_Field;
      --  Read-only. Trimming overflow or underflow
      TRIMOVF        : ISR_TRIMOVF_Field;
      --  unspecified
      Reserved_11_14 : STM32_SVD.UInt4;
      --  Read-only. Frequency error direction
      FEDIR          : ISR_FEDIR_Field;
      --  Read-only. Frequency error capture
      FECAP          : ISR_FECAP_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      SYNCOKF        at 0 range 0 .. 0;
      SYNCWARNF      at 0 range 1 .. 1;
      ERRF           at 0 range 2 .. 2;
      ESYNCF         at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      SYNCERR        at 0 range 8 .. 8;
      SYNCMISS       at 0 range 9 .. 9;
      TRIMOVF        at 0 range 10 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      FEDIR          at 0 range 15 .. 15;
      FECAP          at 0 range 16 .. 31;
   end record;

   subtype ICR_SYNCOKC_Field is STM32_SVD.Bit;
   subtype ICR_SYNCWARNC_Field is STM32_SVD.Bit;
   subtype ICR_ERRC_Field is STM32_SVD.Bit;
   subtype ICR_ESYNCC_Field is STM32_SVD.Bit;

   --  interrupt flag clear register
   type ICR_Register is record
      --  SYNC event OK clear flag
      SYNCOKC       : ICR_SYNCOKC_Field := 16#0#;
      --  SYNC warning clear flag
      SYNCWARNC     : ICR_SYNCWARNC_Field := 16#0#;
      --  Error clear flag
      ERRC          : ICR_ERRC_Field := 16#0#;
      --  Expected SYNC clear flag
      ESYNCC        : ICR_ESYNCC_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : STM32_SVD.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      SYNCOKC       at 0 range 0 .. 0;
      SYNCWARNC     at 0 range 1 .. 1;
      ERRC          at 0 range 2 .. 2;
      ESYNCC        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Clock recovery system
   type CRS_Peripheral is record
      --  control register
      CR   : aliased CR_Register;
      --  configuration register
      CFGR : aliased CFGR_Register;
      --  interrupt and status register
      ISR  : aliased ISR_Register;
      --  interrupt flag clear register
      ICR  : aliased ICR_Register;
   end record
     with Volatile;

   for CRS_Peripheral use record
      CR   at 16#0# range 0 .. 31;
      CFGR at 16#4# range 0 .. 31;
      ISR  at 16#8# range 0 .. 31;
      ICR  at 16#C# range 0 .. 31;
   end record;

   --  Clock recovery system
   CRS_Periph : aliased CRS_Peripheral
     with Import, Address => System'To_Address (16#40006C00#);

end STM32_SVD.CRS;
