--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.RTC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  RTC time register
   type TR_Register is record
      --  Second units in BCD format
      SU             : STM32_SVD.UInt4;
      --  Second tens in BCD format
      ST             : STM32_SVD.UInt3;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit;
      --  Minute units in BCD format
      MNU            : STM32_SVD.UInt4;
      --  Minute tens in BCD format
      MNT            : STM32_SVD.UInt3;
      --  unspecified
      Reserved_15_15 : STM32_SVD.Bit;
      --  Hour units in BCD format
      HU             : STM32_SVD.UInt4;
      --  Hour tens in BCD format
      HT             : STM32_SVD.UInt2;
      --  AM/PM notation
      PM             : STM32_SVD.Bit;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  RTC date register
   type DR_Register is record
      --  Date units in BCD format
      DU             : STM32_SVD.UInt4;
      --  Date tens in BCD format
      DT             : STM32_SVD.UInt2;
      --  unspecified
      Reserved_6_7   : STM32_SVD.UInt2;
      --  Month units in BCD format
      MU             : STM32_SVD.UInt4;
      --  Month tens in BCD format
      MT             : STM32_SVD.Bit;
      --  Week day units
      WDU            : STM32_SVD.UInt3;
      --  Year units in BCD format
      YU             : STM32_SVD.UInt4;
      --  Year tens in BCD format
      YT             : STM32_SVD.UInt4;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      YU             at 0 range 16 .. 19;
      YT             at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  RTC control register
   type CR_Register is record
      --  Wakeup clock selection
      WUCKSEL        : STM32_SVD.UInt3;
      --  Time-stamp event active edge
      TSEDGE         : STM32_SVD.Bit;
      --  RTC_REFIN reference clock detection enable (50 or 60 Hz)
      REFCKON        : STM32_SVD.Bit;
      --  Bypass the shadow registers
      BYPSHAD        : STM32_SVD.Bit;
      --  Hour format
      FMT            : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit;
      --  Alarm A enable
      ALRAE          : STM32_SVD.Bit;
      --  Alarm B enable
      ALRBE          : STM32_SVD.Bit;
      --  Wakeup timer enable
      WUTE           : STM32_SVD.Bit;
      --  timestamp enable
      TSE            : STM32_SVD.Bit;
      --  Alarm A interrupt enable
      ALRAIE         : STM32_SVD.Bit;
      --  Alarm B interrupt enable
      ALRBIE         : STM32_SVD.Bit;
      --  Wakeup timer interrupt enable
      WUTIE          : STM32_SVD.Bit;
      --  Time-stamp interrupt enable
      TSIE           : STM32_SVD.Bit;
      --  Write-only. Add 1 hour (summer time change)
      ADD1H          : STM32_SVD.Bit;
      --  Write-only. Subtract 1 hour (winter time change)
      SUB1H          : STM32_SVD.Bit;
      --  Backup
      BKP            : STM32_SVD.Bit;
      --  Calibration output selection
      COSEL          : STM32_SVD.Bit;
      --  Output polarity
      POL            : STM32_SVD.Bit;
      --  Output selection
      OSEL           : STM32_SVD.UInt2;
      --  Calibration output enable
      COE            : STM32_SVD.Bit;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      WUCKSEL        at 0 range 0 .. 2;
      TSEDGE         at 0 range 3 .. 3;
      REFCKON        at 0 range 4 .. 4;
      BYPSHAD        at 0 range 5 .. 5;
      FMT            at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      ALRAE          at 0 range 8 .. 8;
      ALRBE          at 0 range 9 .. 9;
      WUTE           at 0 range 10 .. 10;
      TSE            at 0 range 11 .. 11;
      ALRAIE         at 0 range 12 .. 12;
      ALRBIE         at 0 range 13 .. 13;
      WUTIE          at 0 range 14 .. 14;
      TSIE           at 0 range 15 .. 15;
      ADD1H          at 0 range 16 .. 16;
      SUB1H          at 0 range 17 .. 17;
      BKP            at 0 range 18 .. 18;
      COSEL          at 0 range 19 .. 19;
      POL            at 0 range 20 .. 20;
      OSEL           at 0 range 21 .. 22;
      COE            at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  RTC initialization and status register
   type ISR_Register is record
      --  Read-only. Alarm A write flag
      ALRAWF         : STM32_SVD.Bit;
      --  Read-only. Alarm B write flag
      ALRBWF         : STM32_SVD.Bit;
      --  Read-only. Wakeup timer write flag
      WUTWF          : STM32_SVD.Bit;
      --  Read-only. Shift operation pending
      SHPF           : STM32_SVD.Bit;
      --  Read-only. Initialization status flag
      INITS          : STM32_SVD.Bit;
      --  Registers synchronization flag
      RSF            : STM32_SVD.Bit;
      --  Read-only. Initialization flag
      INITF          : STM32_SVD.Bit;
      --  Initialization mode
      INIT           : STM32_SVD.Bit;
      --  Alarm A flag
      ALRAF          : STM32_SVD.Bit;
      --  Alarm B flag
      ALRBF          : STM32_SVD.Bit;
      --  Wakeup timer flag
      WUTF           : STM32_SVD.Bit;
      --  Time-stamp flag
      TSF            : STM32_SVD.Bit;
      --  Time-stamp overflow flag
      TSOVF          : STM32_SVD.Bit;
      --  RTC_TAMP1 detection flag
      TAMP1F         : STM32_SVD.Bit;
      --  RTC_TAMP2 detection flag
      TAMP2F         : STM32_SVD.Bit;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      ALRAWF         at 0 range 0 .. 0;
      ALRBWF         at 0 range 1 .. 1;
      WUTWF          at 0 range 2 .. 2;
      SHPF           at 0 range 3 .. 3;
      INITS          at 0 range 4 .. 4;
      RSF            at 0 range 5 .. 5;
      INITF          at 0 range 6 .. 6;
      INIT           at 0 range 7 .. 7;
      ALRAF          at 0 range 8 .. 8;
      ALRBF          at 0 range 9 .. 9;
      WUTF           at 0 range 10 .. 10;
      TSF            at 0 range 11 .. 11;
      TSOVF          at 0 range 12 .. 12;
      TAMP1F         at 0 range 13 .. 13;
      TAMP2F         at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  RTC prescaler register
   type PRER_Register is record
      --  Synchronous prescaler factor
      PREDIV_S       : STM32_SVD.UInt16;
      --  Asynchronous prescaler factor
      PREDIV_A       : STM32_SVD.UInt7;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRER_Register use record
      PREDIV_S       at 0 range 0 .. 15;
      PREDIV_A       at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  RTC wakeup timer register
   type WUTR_Register is record
      --  Wakeup auto-reload value bits
      WUT            : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WUTR_Register use record
      WUT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  RTC alarm A register
   type ALRMAR_Register is record
      --  Second units in BCD format.
      SU    : STM32_SVD.UInt4;
      --  Second tens in BCD format.
      ST    : STM32_SVD.UInt3;
      --  Alarm A seconds mask
      MSK1  : STM32_SVD.Bit;
      --  Minute units in BCD format.
      MNU   : STM32_SVD.UInt4;
      --  Minute tens in BCD format.
      MNT   : STM32_SVD.UInt3;
      --  Alarm A minutes mask
      MSK2  : STM32_SVD.Bit;
      --  Hour units in BCD format.
      HU    : STM32_SVD.UInt4;
      --  Hour tens in BCD format.
      HT    : STM32_SVD.UInt2;
      --  AM/PM notation
      PM    : STM32_SVD.Bit;
      --  Alarm A hours mask
      MSK3  : STM32_SVD.Bit;
      --  Date units or day in BCD format.
      DU    : STM32_SVD.UInt4;
      --  Date tens in BCD format.
      DT    : STM32_SVD.UInt2;
      --  Week day selection
      WDSEL : STM32_SVD.Bit;
      --  Alarm A date mask
      MSK4  : STM32_SVD.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMAR_Register use record
      SU    at 0 range 0 .. 3;
      ST    at 0 range 4 .. 6;
      MSK1  at 0 range 7 .. 7;
      MNU   at 0 range 8 .. 11;
      MNT   at 0 range 12 .. 14;
      MSK2  at 0 range 15 .. 15;
      HU    at 0 range 16 .. 19;
      HT    at 0 range 20 .. 21;
      PM    at 0 range 22 .. 22;
      MSK3  at 0 range 23 .. 23;
      DU    at 0 range 24 .. 27;
      DT    at 0 range 28 .. 29;
      WDSEL at 0 range 30 .. 30;
      MSK4  at 0 range 31 .. 31;
   end record;

   --  RTC alarm B register
   type ALRMBR_Register is record
      --  Second units in BCD format
      SU    : STM32_SVD.UInt4;
      --  Second tens in BCD format
      ST    : STM32_SVD.UInt3;
      --  Alarm B seconds mask
      MSK1  : STM32_SVD.Bit;
      --  Minute units in BCD format
      MNU   : STM32_SVD.UInt4;
      --  Minute tens in BCD format
      MNT   : STM32_SVD.UInt3;
      --  Alarm B minutes mask
      MSK2  : STM32_SVD.Bit;
      --  Hour units in BCD format
      HU    : STM32_SVD.UInt4;
      --  Hour tens in BCD format
      HT    : STM32_SVD.UInt2;
      --  AM/PM notation
      PM    : STM32_SVD.Bit;
      --  Alarm B hours mask
      MSK3  : STM32_SVD.Bit;
      --  Date units or day in BCD format
      DU    : STM32_SVD.UInt4;
      --  Date tens in BCD format
      DT    : STM32_SVD.UInt2;
      --  Week day selection
      WDSEL : STM32_SVD.Bit;
      --  Alarm B date mask
      MSK4  : STM32_SVD.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMBR_Register use record
      SU    at 0 range 0 .. 3;
      ST    at 0 range 4 .. 6;
      MSK1  at 0 range 7 .. 7;
      MNU   at 0 range 8 .. 11;
      MNT   at 0 range 12 .. 14;
      MSK2  at 0 range 15 .. 15;
      HU    at 0 range 16 .. 19;
      HT    at 0 range 20 .. 21;
      PM    at 0 range 22 .. 22;
      MSK3  at 0 range 23 .. 23;
      DU    at 0 range 24 .. 27;
      DT    at 0 range 28 .. 29;
      WDSEL at 0 range 30 .. 30;
      MSK4  at 0 range 31 .. 31;
   end record;

   --  write protection register
   type WPR_Register is record
      --  Write-only. Write protection key
      KEY           : STM32_SVD.Byte;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WPR_Register use record
      KEY           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  RTC sub second register
   type SSR_Register is record
      --  Read-only. Sub second value
      SS             : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  RTC shift control register
   type SHIFTR_Register is record
      --  Write-only. Subtract a fraction of a second
      SUBFS          : STM32_SVD.UInt15;
      --  unspecified
      Reserved_15_30 : STM32_SVD.UInt16;
      --  Write-only. Add one second
      ADD1S          : STM32_SVD.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHIFTR_Register use record
      SUBFS          at 0 range 0 .. 14;
      Reserved_15_30 at 0 range 15 .. 30;
      ADD1S          at 0 range 31 .. 31;
   end record;

   --  RTC timestamp time register
   type TSTR_Register is record
      --  Read-only. Second units in BCD format.
      SU             : STM32_SVD.UInt4;
      --  Read-only. Second tens in BCD format.
      ST             : STM32_SVD.UInt3;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit;
      --  Read-only. Minute units in BCD format.
      MNU            : STM32_SVD.UInt4;
      --  Read-only. Minute tens in BCD format.
      MNT            : STM32_SVD.UInt3;
      --  unspecified
      Reserved_15_15 : STM32_SVD.Bit;
      --  Read-only. Hour units in BCD format.
      HU             : STM32_SVD.UInt4;
      --  Read-only. Hour tens in BCD format.
      HT             : STM32_SVD.UInt2;
      --  Read-only. AM/PM notation
      PM             : STM32_SVD.Bit;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSTR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  RTC timestamp date register
   type TSDR_Register is record
      --  Read-only. Date units in BCD format
      DU             : STM32_SVD.UInt4;
      --  Read-only. Date tens in BCD format
      DT             : STM32_SVD.UInt2;
      --  unspecified
      Reserved_6_7   : STM32_SVD.UInt2;
      --  Read-only. Month units in BCD format
      MU             : STM32_SVD.UInt4;
      --  Read-only. Month tens in BCD format
      MT             : STM32_SVD.Bit;
      --  Read-only. Week day units
      WDU            : STM32_SVD.UInt3;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSDR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  RTC time-stamp sub second register
   type TSSSR_Register is record
      --  Read-only. Sub second value
      SS             : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSSSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  RTC calibration register
   type CALR_Register is record
      --  Calibration minus
      CALM           : STM32_SVD.UInt9;
      --  unspecified
      Reserved_9_12  : STM32_SVD.UInt4;
      --  Use a 16-second calibration cycle period
      CALW16         : STM32_SVD.Bit;
      --  Use an 8-second calibration cycle period
      CALW8          : STM32_SVD.Bit;
      --  Increase frequency of RTC by 488.5 ppm
      CALP           : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CALR_Register use record
      CALM           at 0 range 0 .. 8;
      Reserved_9_12  at 0 range 9 .. 12;
      CALW16         at 0 range 13 .. 13;
      CALW8          at 0 range 14 .. 14;
      CALP           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  RTC tamper configuration register
   type TAMPCR_Register is record
      --  RTC_TAMP1 input detection enable
      TAMP1E         : STM32_SVD.Bit;
      --  Active level for RTC_TAMP1 input
      TAMP1TRG       : STM32_SVD.Bit;
      --  Tamper interrupt enable
      TAMPIE         : STM32_SVD.Bit;
      --  RTC_TAMP2 input detection enable
      TAMP2E         : STM32_SVD.Bit;
      --  Active level for RTC_TAMP2 input
      TAMP2_TRG      : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_6   : STM32_SVD.UInt2;
      --  Activate timestamp on tamper detection event
      TAMPTS         : STM32_SVD.Bit;
      --  Tamper sampling frequency
      TAMPFREQ       : STM32_SVD.UInt3;
      --  RTC_TAMPx filter count
      TAMPFLT        : STM32_SVD.UInt2;
      --  RTC_TAMPx precharge duration
      TAMPPRCH       : STM32_SVD.UInt2;
      --  RTC_TAMPx pull-up disable
      TAMPPUDIS      : STM32_SVD.Bit;
      --  Tamper 1 interrupt enable
      TAMP1IE        : STM32_SVD.Bit;
      --  Tamper 1 no erase
      TAMP1NOERASE   : STM32_SVD.Bit;
      --  Tamper 1 mask flag
      TAMP1MF        : STM32_SVD.Bit;
      --  Tamper 2 interrupt enable
      TAMP2IE        : STM32_SVD.Bit;
      --  Tamper 2 no erase
      TAMP2NOERASE   : STM32_SVD.Bit;
      --  Tamper 2 mask flag
      TAMP2MF        : STM32_SVD.Bit;
      --  unspecified
      Reserved_22_31 : STM32_SVD.UInt10;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TAMPCR_Register use record
      TAMP1E         at 0 range 0 .. 0;
      TAMP1TRG       at 0 range 1 .. 1;
      TAMPIE         at 0 range 2 .. 2;
      TAMP2E         at 0 range 3 .. 3;
      TAMP2_TRG      at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      TAMPTS         at 0 range 7 .. 7;
      TAMPFREQ       at 0 range 8 .. 10;
      TAMPFLT        at 0 range 11 .. 12;
      TAMPPRCH       at 0 range 13 .. 14;
      TAMPPUDIS      at 0 range 15 .. 15;
      TAMP1IE        at 0 range 16 .. 16;
      TAMP1NOERASE   at 0 range 17 .. 17;
      TAMP1MF        at 0 range 18 .. 18;
      TAMP2IE        at 0 range 19 .. 19;
      TAMP2NOERASE   at 0 range 20 .. 20;
      TAMP2MF        at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  RTC alarm A sub second register
   type ALRMASSR_Register is record
      --  Sub seconds value
      SS             : STM32_SVD.UInt15;
      --  unspecified
      Reserved_15_23 : STM32_SVD.UInt9;
      --  Mask the most-significant bits starting at this bit
      MASKSS         : STM32_SVD.UInt4;
      --  unspecified
      Reserved_28_31 : STM32_SVD.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMASSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  RTC alarm B sub second register
   type ALRMBSSR_Register is record
      --  Sub seconds value
      SS             : STM32_SVD.UInt15;
      --  unspecified
      Reserved_15_23 : STM32_SVD.UInt9;
      --  Mask the most-significant bits starting at this bit
      MASKSS         : STM32_SVD.UInt4;
      --  unspecified
      Reserved_28_31 : STM32_SVD.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMBSSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  option register
   type OR_Register is record
      --  RTC_ALARM on PC13 output type
      RTC_ALARM_TYPE : STM32_SVD.Bit;
      --  RTC_ALARM on PC13 output type
      RTC_OUT_RMP    : STM32_SVD.Bit;
      --  unspecified
      Reserved_2_31  : STM32_SVD.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR_Register use record
      RTC_ALARM_TYPE at 0 range 0 .. 0;
      RTC_OUT_RMP    at 0 range 1 .. 1;
      Reserved_2_31  at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Real-time clock
   type RTC_Peripheral is record
      --  RTC time register
      TR       : aliased TR_Register;
      --  RTC date register
      DR       : aliased DR_Register;
      --  RTC control register
      CR       : aliased CR_Register;
      --  RTC initialization and status register
      ISR      : aliased ISR_Register;
      --  RTC prescaler register
      PRER     : aliased PRER_Register;
      --  RTC wakeup timer register
      WUTR     : aliased WUTR_Register;
      --  RTC alarm A register
      ALRMAR   : aliased ALRMAR_Register;
      --  RTC alarm B register
      ALRMBR   : aliased ALRMBR_Register;
      --  write protection register
      WPR      : aliased WPR_Register;
      --  RTC sub second register
      SSR      : aliased SSR_Register;
      --  RTC shift control register
      SHIFTR   : aliased SHIFTR_Register;
      --  RTC timestamp time register
      TSTR     : aliased TSTR_Register;
      --  RTC timestamp date register
      TSDR     : aliased TSDR_Register;
      --  RTC time-stamp sub second register
      TSSSR    : aliased TSSSR_Register;
      --  RTC calibration register
      CALR     : aliased CALR_Register;
      --  RTC tamper configuration register
      TAMPCR   : aliased TAMPCR_Register;
      --  RTC alarm A sub second register
      ALRMASSR : aliased ALRMASSR_Register;
      --  RTC alarm B sub second register
      ALRMBSSR : aliased ALRMBSSR_Register;
      --  option register
      OR_k     : aliased OR_Register;
      --  RTC backup registers
      BKP0R    : aliased STM32_SVD.UInt32;
      --  RTC backup registers
      BKP1R    : aliased STM32_SVD.UInt32;
      --  RTC backup registers
      BKP2R    : aliased STM32_SVD.UInt32;
      --  RTC backup registers
      BKP3R    : aliased STM32_SVD.UInt32;
      --  RTC backup registers
      BKP4R    : aliased STM32_SVD.UInt32;
   end record
     with Volatile;

   for RTC_Peripheral use record
      TR       at 16#0# range 0 .. 31;
      DR       at 16#4# range 0 .. 31;
      CR       at 16#8# range 0 .. 31;
      ISR      at 16#C# range 0 .. 31;
      PRER     at 16#10# range 0 .. 31;
      WUTR     at 16#14# range 0 .. 31;
      ALRMAR   at 16#1C# range 0 .. 31;
      ALRMBR   at 16#20# range 0 .. 31;
      WPR      at 16#24# range 0 .. 31;
      SSR      at 16#28# range 0 .. 31;
      SHIFTR   at 16#2C# range 0 .. 31;
      TSTR     at 16#30# range 0 .. 31;
      TSDR     at 16#34# range 0 .. 31;
      TSSSR    at 16#38# range 0 .. 31;
      CALR     at 16#3C# range 0 .. 31;
      TAMPCR   at 16#40# range 0 .. 31;
      ALRMASSR at 16#44# range 0 .. 31;
      ALRMBSSR at 16#48# range 0 .. 31;
      OR_k     at 16#4C# range 0 .. 31;
      BKP0R    at 16#50# range 0 .. 31;
      BKP1R    at 16#54# range 0 .. 31;
      BKP2R    at 16#58# range 0 .. 31;
      BKP3R    at 16#5C# range 0 .. 31;
      BKP4R    at 16#60# range 0 .. 31;
   end record;

   --  Real-time clock
   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => RTC_Base;

end STM32_SVD.RTC;
