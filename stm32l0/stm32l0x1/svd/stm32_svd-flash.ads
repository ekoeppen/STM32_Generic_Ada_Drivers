--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.Flash is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Access control register
   type ACR_Register is record
      --  Latency
      LATENCY       : STM32_SVD.Bit;
      --  Prefetch enable
      PRFTEN        : STM32_SVD.Bit;
      --  unspecified
      Reserved_2_2  : STM32_SVD.Bit;
      --  Flash mode during Sleep
      SLEEP_PD      : STM32_SVD.Bit;
      --  Flash mode during Run
      RUN_PD        : STM32_SVD.Bit;
      --  Disable Buffer
      DESAB_BUF     : STM32_SVD.Bit;
      --  Pre-read data address
      PRE_READ      : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_31 : STM32_SVD.UInt25;
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

   --  Program/erase control register
   type PECR_Register is record
      --  FLASH_PECR and data EEPROM lock
      PELOCK         : STM32_SVD.Bit;
      --  Program memory lock
      PRGLOCK        : STM32_SVD.Bit;
      --  Option bytes block lock
      OPTLOCK        : STM32_SVD.Bit;
      --  Program memory selection
      PROG           : STM32_SVD.Bit;
      --  Data EEPROM selection
      DATA           : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_7   : STM32_SVD.UInt3;
      --  Fixed time data write for Byte, Half Word and Word programming
      FTDW           : STM32_SVD.Bit;
      --  Page or Double Word erase mode
      ERASE          : STM32_SVD.Bit;
      --  Half Page/Double Word programming mode
      FPRG           : STM32_SVD.Bit;
      --  unspecified
      Reserved_11_14 : STM32_SVD.UInt4;
      --  Parallel bank mode
      PARALLELBANK   : STM32_SVD.Bit;
      --  End of programming interrupt enable
      EOPIE          : STM32_SVD.Bit;
      --  Error interrupt enable
      ERRIE          : STM32_SVD.Bit;
      --  Launch the option byte loading
      OBL_LAUNCH     : STM32_SVD.Bit;
      --  unspecified
      Reserved_19_31 : STM32_SVD.UInt13;
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

   --  Status register
   type SR_Register is record
      --  Read-only. Write/erase operations in progress
      BSY            : STM32_SVD.Bit;
      --  Read-only. End of operation
      EOP            : STM32_SVD.Bit;
      --  Read-only. End of high voltage
      ENDHV          : STM32_SVD.Bit;
      --  Read-only. Flash memory module ready after low power mode
      READY          : STM32_SVD.Bit;
      --  unspecified
      Reserved_4_7   : STM32_SVD.UInt4;
      --  Write protected error
      WRPERR         : STM32_SVD.Bit;
      --  Programming alignment error
      PGAERR         : STM32_SVD.Bit;
      --  Size error
      SIZERR         : STM32_SVD.Bit;
      --  Option validity error
      OPTVERR        : STM32_SVD.Bit;
      --  unspecified
      Reserved_12_13 : STM32_SVD.UInt2;
      --  RDERR
      RDERR          : STM32_SVD.Bit;
      --  unspecified
      Reserved_15_15 : STM32_SVD.Bit;
      --  NOTZEROERR
      NOTZEROERR     : STM32_SVD.Bit;
      --  FWWERR
      FWWERR         : STM32_SVD.Bit;
      --  unspecified
      Reserved_18_31 : STM32_SVD.UInt14;
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

   --  Option byte register
   type OBR_Register is record
      --  Read-only. Read protection
      RDPRT          : STM32_SVD.Byte;
      --  Read-only. Selection of protection mode of WPR bits
      SPRMOD         : STM32_SVD.Bit;
      --  unspecified
      Reserved_9_15  : STM32_SVD.UInt7;
      --  Read-only. BOR_LEV
      BOR_LEV        : STM32_SVD.UInt4;
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

   --  Write protection register
   type WRPR_Register is record
      --  Write protection
      WRP            : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
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
