pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.Flash is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ACR_LATENCY_Field is STM32_SVD.Bit;
   subtype ACR_PRFTEN_Field is STM32_SVD.Bit;
   subtype ACR_SLEEP_PD_Field is STM32_SVD.Bit;
   subtype ACR_RUN_PD_Field is STM32_SVD.Bit;
   subtype ACR_DESAB_BUF_Field is STM32_SVD.Bit;
   subtype ACR_PRE_READ_Field is STM32_SVD.Bit;

   --  Access control register
   type ACR_Register is record
      --  Latency
      LATENCY       : ACR_LATENCY_Field := 16#0#;
      --  Prefetch enable
      PRFTEN        : ACR_PRFTEN_Field := 16#0#;
      --  unspecified
      Reserved_2_2  : STM32_SVD.Bit := 16#0#;
      --  Flash mode during Sleep
      SLEEP_PD      : ACR_SLEEP_PD_Field := 16#0#;
      --  Flash mode during Run
      RUN_PD        : ACR_RUN_PD_Field := 16#0#;
      --  Disable Buffer
      DESAB_BUF     : ACR_DESAB_BUF_Field := 16#0#;
      --  Pre-read data address
      PRE_READ      : ACR_PRE_READ_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACR_Register use record
      LATENCY       at 0 range 0 .. 0;
      PRFTEN        at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      SLEEP_PD      at 0 range 3 .. 3;
      RUN_PD        at 0 range 4 .. 4;
      DESAB_BUF     at 0 range 5 .. 5;
      PRE_READ      at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype PECR_PELOCK_Field is STM32_SVD.Bit;
   subtype PECR_PRGLOCK_Field is STM32_SVD.Bit;
   subtype PECR_OPTLOCK_Field is STM32_SVD.Bit;
   subtype PECR_PROG_Field is STM32_SVD.Bit;
   subtype PECR_DATA_Field is STM32_SVD.Bit;
   subtype PECR_FTDW_Field is STM32_SVD.Bit;
   subtype PECR_ERASE_Field is STM32_SVD.Bit;
   subtype PECR_FPRG_Field is STM32_SVD.Bit;
   subtype PECR_PARALLELBANK_Field is STM32_SVD.Bit;
   subtype PECR_EOPIE_Field is STM32_SVD.Bit;
   subtype PECR_ERRIE_Field is STM32_SVD.Bit;
   subtype PECR_OBL_LAUNCH_Field is STM32_SVD.Bit;

   --  Program/erase control register
   type PECR_Register is record
      --  FLASH_PECR and data EEPROM lock
      PELOCK         : PECR_PELOCK_Field := 16#1#;
      --  Program memory lock
      PRGLOCK        : PECR_PRGLOCK_Field := 16#1#;
      --  Option bytes block lock
      OPTLOCK        : PECR_OPTLOCK_Field := 16#1#;
      --  Program memory selection
      PROG           : PECR_PROG_Field := 16#0#;
      --  Data EEPROM selection
      DATA           : PECR_DATA_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : STM32_SVD.UInt3 := 16#0#;
      --  Fixed time data write for Byte, Half Word and Word programming
      FTDW           : PECR_FTDW_Field := 16#0#;
      --  Page or Double Word erase mode
      ERASE          : PECR_ERASE_Field := 16#0#;
      --  Half Page/Double Word programming mode
      FPRG           : PECR_FPRG_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : STM32_SVD.UInt4 := 16#0#;
      --  Parallel bank mode
      PARALLELBANK   : PECR_PARALLELBANK_Field := 16#0#;
      --  End of programming interrupt enable
      EOPIE          : PECR_EOPIE_Field := 16#0#;
      --  Error interrupt enable
      ERRIE          : PECR_ERRIE_Field := 16#0#;
      --  Launch the option byte loading
      OBL_LAUNCH     : PECR_OBL_LAUNCH_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : STM32_SVD.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PECR_Register use record
      PELOCK         at 0 range 0 .. 0;
      PRGLOCK        at 0 range 1 .. 1;
      OPTLOCK        at 0 range 2 .. 2;
      PROG           at 0 range 3 .. 3;
      DATA           at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      FTDW           at 0 range 8 .. 8;
      ERASE          at 0 range 9 .. 9;
      FPRG           at 0 range 10 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      PARALLELBANK   at 0 range 15 .. 15;
      EOPIE          at 0 range 16 .. 16;
      ERRIE          at 0 range 17 .. 17;
      OBL_LAUNCH     at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype SR_BSY_Field is STM32_SVD.Bit;
   subtype SR_EOP_Field is STM32_SVD.Bit;
   subtype SR_ENDHV_Field is STM32_SVD.Bit;
   subtype SR_READY_Field is STM32_SVD.Bit;
   subtype SR_WRPERR_Field is STM32_SVD.Bit;
   subtype SR_PGAERR_Field is STM32_SVD.Bit;
   subtype SR_SIZERR_Field is STM32_SVD.Bit;
   subtype SR_OPTVERR_Field is STM32_SVD.Bit;
   subtype SR_RDERR_Field is STM32_SVD.Bit;
   subtype SR_NOTZEROERR_Field is STM32_SVD.Bit;
   subtype SR_FWWERR_Field is STM32_SVD.Bit;

   --  Status register
   type SR_Register is record
      --  Read-only. Write/erase operations in progress
      BSY            : SR_BSY_Field := 16#0#;
      --  Read-only. End of operation
      EOP            : SR_EOP_Field := 16#0#;
      --  Read-only. End of high voltage
      ENDHV          : SR_ENDHV_Field := 16#1#;
      --  Read-only. Flash memory module ready after low power mode
      READY          : SR_READY_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : STM32_SVD.UInt4 := 16#0#;
      --  Write protected error
      WRPERR         : SR_WRPERR_Field := 16#0#;
      --  Programming alignment error
      PGAERR         : SR_PGAERR_Field := 16#0#;
      --  Size error
      SIZERR         : SR_SIZERR_Field := 16#0#;
      --  Option validity error
      OPTVERR        : SR_OPTVERR_Field := 16#0#;
      --  unspecified
      Reserved_12_13 : STM32_SVD.UInt2 := 16#0#;
      --  RDERR
      RDERR          : SR_RDERR_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : STM32_SVD.Bit := 16#0#;
      --  NOTZEROERR
      NOTZEROERR     : SR_NOTZEROERR_Field := 16#0#;
      --  FWWERR
      FWWERR         : SR_FWWERR_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : STM32_SVD.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      BSY            at 0 range 0 .. 0;
      EOP            at 0 range 1 .. 1;
      ENDHV          at 0 range 2 .. 2;
      READY          at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      WRPERR         at 0 range 8 .. 8;
      PGAERR         at 0 range 9 .. 9;
      SIZERR         at 0 range 10 .. 10;
      OPTVERR        at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      RDERR          at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      NOTZEROERR     at 0 range 16 .. 16;
      FWWERR         at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype OBR_RDPRT_Field is STM32_SVD.Byte;
   subtype OBR_SPRMOD_Field is STM32_SVD.Bit;
   subtype OBR_BOR_LEV_Field is STM32_SVD.UInt4;

   --  Option byte register
   type OBR_Register is record
      --  Read-only. Read protection
      RDPRT          : OBR_RDPRT_Field;
      --  Read-only. Selection of protection mode of WPR bits
      SPRMOD         : OBR_SPRMOD_Field;
      --  unspecified
      Reserved_9_15  : STM32_SVD.UInt7;
      --  Read-only. BOR_LEV
      BOR_LEV        : OBR_BOR_LEV_Field;
      --  unspecified
      Reserved_20_31 : STM32_SVD.UInt12;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OBR_Register use record
      RDPRT          at 0 range 0 .. 7;
      SPRMOD         at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      BOR_LEV        at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype WRPR_WRP_Field is STM32_SVD.UInt16;

   --  Write protection register
   type WRPR_Register is record
      --  Write protection
      WRP            : WRPR_WRP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WRPR_Register use record
      WRP            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Flash
   type Flash_Peripheral is record
      --  Access control register
      ACR     : aliased ACR_Register;
      --  Program/erase control register
      PECR    : aliased PECR_Register;
      --  Power down key register
      PDKEYR  : aliased STM32_SVD.UInt32;
      --  Program/erase key register
      PEKEYR  : aliased STM32_SVD.UInt32;
      --  Program memory key register
      PRGKEYR : aliased STM32_SVD.UInt32;
      --  Option byte key register
      OPTKEYR : aliased STM32_SVD.UInt32;
      --  Status register
      SR      : aliased SR_Register;
      --  Option byte register
      OBR     : aliased OBR_Register;
      --  Write protection register
      WRPR    : aliased WRPR_Register;
   end record
     with Volatile;

   for Flash_Peripheral use record
      ACR     at 16#0# range 0 .. 31;
      PECR    at 16#4# range 0 .. 31;
      PDKEYR  at 16#8# range 0 .. 31;
      PEKEYR  at 16#C# range 0 .. 31;
      PRGKEYR at 16#10# range 0 .. 31;
      OPTKEYR at 16#14# range 0 .. 31;
      SR      at 16#18# range 0 .. 31;
      OBR     at 16#1C# range 0 .. 31;
      WRPR    at 16#20# range 0 .. 31;
   end record;

   --  Flash
   Flash_Periph : aliased Flash_Peripheral
     with Import, Address => Flash_Base;

end STM32_SVD.Flash;
