--  This spec has been automatically generated from STM32F303xE.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.Flash is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ACR_LATENCY_Field is STM32_SVD.UInt3;
   subtype ACR_PRFTBE_Field is STM32_SVD.Bit;
   subtype ACR_PRFTBS_Field is STM32_SVD.Bit;

   --  Flash access control register
   type ACR_Register is record
      --  LATENCY
      LATENCY       : ACR_LATENCY_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : STM32_SVD.Bit := 16#0#;
      --  PRFTBE
      PRFTBE        : ACR_PRFTBE_Field := 16#1#;
      --  Read-only. PRFTBS
      PRFTBS        : ACR_PRFTBS_Field := 16#1#;
      --  unspecified
      Reserved_6_31 : STM32_SVD.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACR_Register use record
      LATENCY       at 0 range 0 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      PRFTBE        at 0 range 4 .. 4;
      PRFTBS        at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype SR_BSY_Field is STM32_SVD.Bit;
   subtype SR_PGERR_Field is STM32_SVD.Bit;
   subtype SR_WRPRT_Field is STM32_SVD.Bit;
   subtype SR_EOP_Field is STM32_SVD.Bit;

   --  Flash status register
   type SR_Register is record
      --  Read-only. Busy
      BSY           : SR_BSY_Field := 16#0#;
      --  unspecified
      Reserved_1_1  : STM32_SVD.Bit := 16#0#;
      --  Programming error
      PGERR         : SR_PGERR_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : STM32_SVD.Bit := 16#0#;
      --  Write protection error
      WRPRT         : SR_WRPRT_Field := 16#0#;
      --  End of operation
      EOP           : SR_EOP_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : STM32_SVD.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      BSY           at 0 range 0 .. 0;
      Reserved_1_1  at 0 range 1 .. 1;
      PGERR         at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      WRPRT         at 0 range 4 .. 4;
      EOP           at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype CR_PG_Field is STM32_SVD.Bit;
   subtype CR_PER_Field is STM32_SVD.Bit;
   subtype CR_MER_Field is STM32_SVD.Bit;
   subtype CR_OPTPG_Field is STM32_SVD.Bit;
   subtype CR_OPTER_Field is STM32_SVD.Bit;
   subtype CR_STRT_Field is STM32_SVD.Bit;
   subtype CR_LOCK_Field is STM32_SVD.Bit;
   subtype CR_OPTWRE_Field is STM32_SVD.Bit;
   subtype CR_ERRIE_Field is STM32_SVD.Bit;
   subtype CR_EOPIE_Field is STM32_SVD.Bit;
   subtype CR_FORCE_OPTLOAD_Field is STM32_SVD.Bit;

   --  Flash control register
   type CR_Register is record
      --  Programming
      PG             : CR_PG_Field := 16#0#;
      --  Page erase
      PER            : CR_PER_Field := 16#0#;
      --  Mass erase
      MER            : CR_MER_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : STM32_SVD.Bit := 16#0#;
      --  Option byte programming
      OPTPG          : CR_OPTPG_Field := 16#0#;
      --  Option byte erase
      OPTER          : CR_OPTER_Field := 16#0#;
      --  Start
      STRT           : CR_STRT_Field := 16#0#;
      --  Lock
      LOCK           : CR_LOCK_Field := 16#1#;
      --  unspecified
      Reserved_8_8   : STM32_SVD.Bit := 16#0#;
      --  Option bytes write enable
      OPTWRE         : CR_OPTWRE_Field := 16#0#;
      --  Error interrupt enable
      ERRIE          : CR_ERRIE_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : STM32_SVD.Bit := 16#0#;
      --  End of operation interrupt enable
      EOPIE          : CR_EOPIE_Field := 16#0#;
      --  Force option byte loading
      FORCE_OPTLOAD  : CR_FORCE_OPTLOAD_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      PG             at 0 range 0 .. 0;
      PER            at 0 range 1 .. 1;
      MER            at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      OPTPG          at 0 range 4 .. 4;
      OPTER          at 0 range 5 .. 5;
      STRT           at 0 range 6 .. 6;
      LOCK           at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      OPTWRE         at 0 range 9 .. 9;
      ERRIE          at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      EOPIE          at 0 range 12 .. 12;
      FORCE_OPTLOAD  at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype OBR_OPTERR_Field is STM32_SVD.Bit;
   subtype OBR_LEVEL1_PROT_Field is STM32_SVD.Bit;
   subtype OBR_LEVEL2_PROT_Field is STM32_SVD.Bit;
   subtype OBR_WDG_SW_Field is STM32_SVD.Bit;
   subtype OBR_nRST_STOP_Field is STM32_SVD.Bit;
   subtype OBR_nRST_STDBY_Field is STM32_SVD.Bit;
   subtype OBR_BOOT1_Field is STM32_SVD.Bit;
   subtype OBR_VDDA_MONITOR_Field is STM32_SVD.Bit;
   subtype OBR_SRAM_PARITY_CHECK_Field is STM32_SVD.Bit;
   --  OBR_Data array element
   subtype OBR_Data_Element is STM32_SVD.Byte;

   --  OBR_Data array
   type OBR_Data_Field_Array is array (0 .. 1) of OBR_Data_Element
     with Component_Size => 8, Size => 16;

   --  Type definition for OBR_Data
   type OBR_Data_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  Data as a value
            Val : STM32_SVD.UInt16;
         when True =>
            --  Data as an array
            Arr : OBR_Data_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for OBR_Data_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Option byte register
   type OBR_Register is record
      --  Read-only. Option byte error
      OPTERR            : OBR_OPTERR_Field;
      --  Read-only. Level 1 protection status
      LEVEL1_PROT       : OBR_LEVEL1_PROT_Field;
      --  Read-only. Level 2 protection status
      LEVEL2_PROT       : OBR_LEVEL2_PROT_Field;
      --  unspecified
      Reserved_3_7      : STM32_SVD.UInt5;
      --  Read-only. WDG_SW
      WDG_SW            : OBR_WDG_SW_Field;
      --  Read-only. nRST_STOP
      nRST_STOP         : OBR_nRST_STOP_Field;
      --  Read-only. nRST_STDBY
      nRST_STDBY        : OBR_nRST_STDBY_Field;
      --  unspecified
      Reserved_11_11    : STM32_SVD.Bit;
      --  Read-only. BOOT1
      BOOT1             : OBR_BOOT1_Field;
      --  Read-only. VDDA_MONITOR
      VDDA_MONITOR      : OBR_VDDA_MONITOR_Field;
      --  Read-only. SRAM_PARITY_CHECK
      SRAM_PARITY_CHECK : OBR_SRAM_PARITY_CHECK_Field;
      --  unspecified
      Reserved_15_15    : STM32_SVD.Bit;
      --  Read-only. Data0
      Data              : OBR_Data_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OBR_Register use record
      OPTERR            at 0 range 0 .. 0;
      LEVEL1_PROT       at 0 range 1 .. 1;
      LEVEL2_PROT       at 0 range 2 .. 2;
      Reserved_3_7      at 0 range 3 .. 7;
      WDG_SW            at 0 range 8 .. 8;
      nRST_STOP         at 0 range 9 .. 9;
      nRST_STDBY        at 0 range 10 .. 10;
      Reserved_11_11    at 0 range 11 .. 11;
      BOOT1             at 0 range 12 .. 12;
      VDDA_MONITOR      at 0 range 13 .. 13;
      SRAM_PARITY_CHECK at 0 range 14 .. 14;
      Reserved_15_15    at 0 range 15 .. 15;
      Data              at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Flash
   type Flash_Peripheral is record
      --  Flash access control register
      ACR     : aliased ACR_Register;
      --  Flash key register
      KEYR    : aliased STM32_SVD.UInt32;
      --  Flash option key register
      OPTKEYR : aliased STM32_SVD.UInt32;
      --  Flash status register
      SR      : aliased SR_Register;
      --  Flash control register
      CR      : aliased CR_Register;
      --  Flash address register
      AR      : aliased STM32_SVD.UInt32;
      --  Option byte register
      OBR     : aliased OBR_Register;
      --  Write protection register
      WRPR    : aliased STM32_SVD.UInt32;
   end record
     with Volatile;

   for Flash_Peripheral use record
      ACR     at 16#0# range 0 .. 31;
      KEYR    at 16#4# range 0 .. 31;
      OPTKEYR at 16#8# range 0 .. 31;
      SR      at 16#C# range 0 .. 31;
      CR      at 16#10# range 0 .. 31;
      AR      at 16#14# range 0 .. 31;
      OBR     at 16#1C# range 0 .. 31;
      WRPR    at 16#20# range 0 .. 31;
   end record;

   --  Flash
   Flash_Periph : aliased Flash_Peripheral
     with Import, Address => System'To_Address (16#40022000#);

end STM32_SVD.Flash;
