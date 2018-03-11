--  This spec has been automatically generated from STM32F103.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.SDIO is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype POWER_PWRCTRL_Field is STM32_SVD.UInt2;

   --  Bits 1:0 = PWRCTRL: Power supply control bits
   type POWER_Register is record
      --  PWRCTRL
      PWRCTRL       : POWER_PWRCTRL_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : STM32_SVD.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for POWER_Register use record
      PWRCTRL       at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype CLKCR_CLKDIV_Field is STM32_SVD.Byte;
   subtype CLKCR_CLKEN_Field is STM32_SVD.Bit;
   subtype CLKCR_PWRSAV_Field is STM32_SVD.Bit;
   subtype CLKCR_BYPASS_Field is STM32_SVD.Bit;
   subtype CLKCR_WIDBUS_Field is STM32_SVD.UInt2;
   subtype CLKCR_NEGEDGE_Field is STM32_SVD.Bit;
   subtype CLKCR_HWFC_EN_Field is STM32_SVD.Bit;

   --  SDI clock control register (SDIO_CLKCR)
   type CLKCR_Register is record
      --  Clock divide factor
      CLKDIV         : CLKCR_CLKDIV_Field := 16#0#;
      --  Clock enable bit
      CLKEN          : CLKCR_CLKEN_Field := 16#0#;
      --  Power saving configuration bit
      PWRSAV         : CLKCR_PWRSAV_Field := 16#0#;
      --  Clock divider bypass enable bit
      BYPASS         : CLKCR_BYPASS_Field := 16#0#;
      --  Wide bus mode enable bit
      WIDBUS         : CLKCR_WIDBUS_Field := 16#0#;
      --  SDIO_CK dephasing selection bit
      NEGEDGE        : CLKCR_NEGEDGE_Field := 16#0#;
      --  HW Flow Control enable
      HWFC_EN        : CLKCR_HWFC_EN_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLKCR_Register use record
      CLKDIV         at 0 range 0 .. 7;
      CLKEN          at 0 range 8 .. 8;
      PWRSAV         at 0 range 9 .. 9;
      BYPASS         at 0 range 10 .. 10;
      WIDBUS         at 0 range 11 .. 12;
      NEGEDGE        at 0 range 13 .. 13;
      HWFC_EN        at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype CMD_CMDINDEX_Field is STM32_SVD.UInt6;
   subtype CMD_WAITRESP_Field is STM32_SVD.UInt2;
   subtype CMD_WAITINT_Field is STM32_SVD.Bit;
   subtype CMD_WAITPEND_Field is STM32_SVD.Bit;
   subtype CMD_CPSMEN_Field is STM32_SVD.Bit;
   subtype CMD_SDIOSuspend_Field is STM32_SVD.Bit;
   subtype CMD_ENCMDcompl_Field is STM32_SVD.Bit;
   subtype CMD_nIEN_Field is STM32_SVD.Bit;
   subtype CMD_CE_ATACMD_Field is STM32_SVD.Bit;

   --  SDIO command register (SDIO_CMD)
   type CMD_Register is record
      --  CMDINDEX
      CMDINDEX       : CMD_CMDINDEX_Field := 16#0#;
      --  WAITRESP
      WAITRESP       : CMD_WAITRESP_Field := 16#0#;
      --  WAITINT
      WAITINT        : CMD_WAITINT_Field := 16#0#;
      --  WAITPEND
      WAITPEND       : CMD_WAITPEND_Field := 16#0#;
      --  CPSMEN
      CPSMEN         : CMD_CPSMEN_Field := 16#0#;
      --  SDIOSuspend
      SDIOSuspend    : CMD_SDIOSuspend_Field := 16#0#;
      --  ENCMDcompl
      ENCMDcompl     : CMD_ENCMDcompl_Field := 16#0#;
      --  nIEN
      nIEN           : CMD_nIEN_Field := 16#0#;
      --  CE_ATACMD
      CE_ATACMD      : CMD_CE_ATACMD_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMD_Register use record
      CMDINDEX       at 0 range 0 .. 5;
      WAITRESP       at 0 range 6 .. 7;
      WAITINT        at 0 range 8 .. 8;
      WAITPEND       at 0 range 9 .. 9;
      CPSMEN         at 0 range 10 .. 10;
      SDIOSuspend    at 0 range 11 .. 11;
      ENCMDcompl     at 0 range 12 .. 12;
      nIEN           at 0 range 13 .. 13;
      CE_ATACMD      at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype RESPCMD_RESPCMD_Field is STM32_SVD.UInt6;

   --  SDIO command register
   type RESPCMD_Register is record
      --  Read-only. RESPCMD
      RESPCMD       : RESPCMD_RESPCMD_Field;
      --  unspecified
      Reserved_6_31 : STM32_SVD.UInt26;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESPCMD_Register use record
      RESPCMD       at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype DLEN_DATALENGTH_Field is STM32_SVD.UInt25;

   --  Bits 24:0 = DATALENGTH: Data length value
   type DLEN_Register is record
      --  Data length value
      DATALENGTH     : DLEN_DATALENGTH_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DLEN_Register use record
      DATALENGTH     at 0 range 0 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype DCTRL_DTEN_Field is STM32_SVD.Bit;
   subtype DCTRL_DTDIR_Field is STM32_SVD.Bit;
   subtype DCTRL_DTMODE_Field is STM32_SVD.Bit;
   subtype DCTRL_DMAEN_Field is STM32_SVD.Bit;
   subtype DCTRL_DBLOCKSIZE_Field is STM32_SVD.UInt4;
   subtype DCTRL_PWSTART_Field is STM32_SVD.Bit;
   subtype DCTRL_PWSTOP_Field is STM32_SVD.Bit;
   subtype DCTRL_RWMOD_Field is STM32_SVD.Bit;
   subtype DCTRL_SDIOEN_Field is STM32_SVD.Bit;

   --  SDIO data control register (SDIO_DCTRL)
   type DCTRL_Register is record
      --  DTEN
      DTEN           : DCTRL_DTEN_Field := 16#0#;
      --  DTDIR
      DTDIR          : DCTRL_DTDIR_Field := 16#0#;
      --  DTMODE
      DTMODE         : DCTRL_DTMODE_Field := 16#0#;
      --  DMAEN
      DMAEN          : DCTRL_DMAEN_Field := 16#0#;
      --  DBLOCKSIZE
      DBLOCKSIZE     : DCTRL_DBLOCKSIZE_Field := 16#0#;
      --  PWSTART
      PWSTART        : DCTRL_PWSTART_Field := 16#0#;
      --  PWSTOP
      PWSTOP         : DCTRL_PWSTOP_Field := 16#0#;
      --  RWMOD
      RWMOD          : DCTRL_RWMOD_Field := 16#0#;
      --  SDIOEN
      SDIOEN         : DCTRL_SDIOEN_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCTRL_Register use record
      DTEN           at 0 range 0 .. 0;
      DTDIR          at 0 range 1 .. 1;
      DTMODE         at 0 range 2 .. 2;
      DMAEN          at 0 range 3 .. 3;
      DBLOCKSIZE     at 0 range 4 .. 7;
      PWSTART        at 0 range 8 .. 8;
      PWSTOP         at 0 range 9 .. 9;
      RWMOD          at 0 range 10 .. 10;
      SDIOEN         at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype DCOUNT_DATACOUNT_Field is STM32_SVD.UInt25;

   --  Bits 24:0 = DATACOUNT: Data count value
   type DCOUNT_Register is record
      --  Read-only. Data count value
      DATACOUNT      : DCOUNT_DATACOUNT_Field;
      --  unspecified
      Reserved_25_31 : STM32_SVD.UInt7;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCOUNT_Register use record
      DATACOUNT      at 0 range 0 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype STA_CCRCFAIL_Field is STM32_SVD.Bit;
   subtype STA_DCRCFAIL_Field is STM32_SVD.Bit;
   subtype STA_CTIMEOUT_Field is STM32_SVD.Bit;
   subtype STA_DTIMEOUT_Field is STM32_SVD.Bit;
   subtype STA_TXUNDERR_Field is STM32_SVD.Bit;
   subtype STA_RXOVERR_Field is STM32_SVD.Bit;
   subtype STA_CMDREND_Field is STM32_SVD.Bit;
   subtype STA_CMDSENT_Field is STM32_SVD.Bit;
   subtype STA_DATAEND_Field is STM32_SVD.Bit;
   subtype STA_STBITERR_Field is STM32_SVD.Bit;
   subtype STA_DBCKEND_Field is STM32_SVD.Bit;
   subtype STA_CMDACT_Field is STM32_SVD.Bit;
   subtype STA_TXACT_Field is STM32_SVD.Bit;
   subtype STA_RXACT_Field is STM32_SVD.Bit;
   subtype STA_TXFIFOHE_Field is STM32_SVD.Bit;
   subtype STA_RXFIFOHF_Field is STM32_SVD.Bit;
   subtype STA_TXFIFOF_Field is STM32_SVD.Bit;
   subtype STA_RXFIFOF_Field is STM32_SVD.Bit;
   subtype STA_TXFIFOE_Field is STM32_SVD.Bit;
   subtype STA_RXFIFOE_Field is STM32_SVD.Bit;
   subtype STA_TXDAVL_Field is STM32_SVD.Bit;
   subtype STA_RXDAVL_Field is STM32_SVD.Bit;
   subtype STA_SDIOIT_Field is STM32_SVD.Bit;
   subtype STA_CEATAEND_Field is STM32_SVD.Bit;

   --  SDIO status register (SDIO_STA)
   type STA_Register is record
      --  Read-only. CCRCFAIL
      CCRCFAIL       : STA_CCRCFAIL_Field;
      --  Read-only. DCRCFAIL
      DCRCFAIL       : STA_DCRCFAIL_Field;
      --  Read-only. CTIMEOUT
      CTIMEOUT       : STA_CTIMEOUT_Field;
      --  Read-only. DTIMEOUT
      DTIMEOUT       : STA_DTIMEOUT_Field;
      --  Read-only. TXUNDERR
      TXUNDERR       : STA_TXUNDERR_Field;
      --  Read-only. RXOVERR
      RXOVERR        : STA_RXOVERR_Field;
      --  Read-only. CMDREND
      CMDREND        : STA_CMDREND_Field;
      --  Read-only. CMDSENT
      CMDSENT        : STA_CMDSENT_Field;
      --  Read-only. DATAEND
      DATAEND        : STA_DATAEND_Field;
      --  Read-only. STBITERR
      STBITERR       : STA_STBITERR_Field;
      --  Read-only. DBCKEND
      DBCKEND        : STA_DBCKEND_Field;
      --  Read-only. CMDACT
      CMDACT         : STA_CMDACT_Field;
      --  Read-only. TXACT
      TXACT          : STA_TXACT_Field;
      --  Read-only. RXACT
      RXACT          : STA_RXACT_Field;
      --  Read-only. TXFIFOHE
      TXFIFOHE       : STA_TXFIFOHE_Field;
      --  Read-only. RXFIFOHF
      RXFIFOHF       : STA_RXFIFOHF_Field;
      --  Read-only. TXFIFOF
      TXFIFOF        : STA_TXFIFOF_Field;
      --  Read-only. RXFIFOF
      RXFIFOF        : STA_RXFIFOF_Field;
      --  Read-only. TXFIFOE
      TXFIFOE        : STA_TXFIFOE_Field;
      --  Read-only. RXFIFOE
      RXFIFOE        : STA_RXFIFOE_Field;
      --  Read-only. TXDAVL
      TXDAVL         : STA_TXDAVL_Field;
      --  Read-only. RXDAVL
      RXDAVL         : STA_RXDAVL_Field;
      --  Read-only. SDIOIT
      SDIOIT         : STA_SDIOIT_Field;
      --  Read-only. CEATAEND
      CEATAEND       : STA_CEATAEND_Field;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STA_Register use record
      CCRCFAIL       at 0 range 0 .. 0;
      DCRCFAIL       at 0 range 1 .. 1;
      CTIMEOUT       at 0 range 2 .. 2;
      DTIMEOUT       at 0 range 3 .. 3;
      TXUNDERR       at 0 range 4 .. 4;
      RXOVERR        at 0 range 5 .. 5;
      CMDREND        at 0 range 6 .. 6;
      CMDSENT        at 0 range 7 .. 7;
      DATAEND        at 0 range 8 .. 8;
      STBITERR       at 0 range 9 .. 9;
      DBCKEND        at 0 range 10 .. 10;
      CMDACT         at 0 range 11 .. 11;
      TXACT          at 0 range 12 .. 12;
      RXACT          at 0 range 13 .. 13;
      TXFIFOHE       at 0 range 14 .. 14;
      RXFIFOHF       at 0 range 15 .. 15;
      TXFIFOF        at 0 range 16 .. 16;
      RXFIFOF        at 0 range 17 .. 17;
      TXFIFOE        at 0 range 18 .. 18;
      RXFIFOE        at 0 range 19 .. 19;
      TXDAVL         at 0 range 20 .. 20;
      RXDAVL         at 0 range 21 .. 21;
      SDIOIT         at 0 range 22 .. 22;
      CEATAEND       at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype ICR_CCRCFAILC_Field is STM32_SVD.Bit;
   subtype ICR_DCRCFAILC_Field is STM32_SVD.Bit;
   subtype ICR_CTIMEOUTC_Field is STM32_SVD.Bit;
   subtype ICR_DTIMEOUTC_Field is STM32_SVD.Bit;
   subtype ICR_TXUNDERRC_Field is STM32_SVD.Bit;
   subtype ICR_RXOVERRC_Field is STM32_SVD.Bit;
   subtype ICR_CMDRENDC_Field is STM32_SVD.Bit;
   subtype ICR_CMDSENTC_Field is STM32_SVD.Bit;
   subtype ICR_DATAENDC_Field is STM32_SVD.Bit;
   subtype ICR_STBITERRC_Field is STM32_SVD.Bit;
   subtype ICR_DBCKENDC_Field is STM32_SVD.Bit;
   subtype ICR_SDIOITC_Field is STM32_SVD.Bit;
   subtype ICR_CEATAENDC_Field is STM32_SVD.Bit;

   --  SDIO interrupt clear register (SDIO_ICR)
   type ICR_Register is record
      --  CCRCFAILC
      CCRCFAILC      : ICR_CCRCFAILC_Field := 16#0#;
      --  DCRCFAILC
      DCRCFAILC      : ICR_DCRCFAILC_Field := 16#0#;
      --  CTIMEOUTC
      CTIMEOUTC      : ICR_CTIMEOUTC_Field := 16#0#;
      --  DTIMEOUTC
      DTIMEOUTC      : ICR_DTIMEOUTC_Field := 16#0#;
      --  TXUNDERRC
      TXUNDERRC      : ICR_TXUNDERRC_Field := 16#0#;
      --  RXOVERRC
      RXOVERRC       : ICR_RXOVERRC_Field := 16#0#;
      --  CMDRENDC
      CMDRENDC       : ICR_CMDRENDC_Field := 16#0#;
      --  CMDSENTC
      CMDSENTC       : ICR_CMDSENTC_Field := 16#0#;
      --  DATAENDC
      DATAENDC       : ICR_DATAENDC_Field := 16#0#;
      --  STBITERRC
      STBITERRC      : ICR_STBITERRC_Field := 16#0#;
      --  DBCKENDC
      DBCKENDC       : ICR_DBCKENDC_Field := 16#0#;
      --  unspecified
      Reserved_11_21 : STM32_SVD.UInt11 := 16#0#;
      --  SDIOITC
      SDIOITC        : ICR_SDIOITC_Field := 16#0#;
      --  CEATAENDC
      CEATAENDC      : ICR_CEATAENDC_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      CCRCFAILC      at 0 range 0 .. 0;
      DCRCFAILC      at 0 range 1 .. 1;
      CTIMEOUTC      at 0 range 2 .. 2;
      DTIMEOUTC      at 0 range 3 .. 3;
      TXUNDERRC      at 0 range 4 .. 4;
      RXOVERRC       at 0 range 5 .. 5;
      CMDRENDC       at 0 range 6 .. 6;
      CMDSENTC       at 0 range 7 .. 7;
      DATAENDC       at 0 range 8 .. 8;
      STBITERRC      at 0 range 9 .. 9;
      DBCKENDC       at 0 range 10 .. 10;
      Reserved_11_21 at 0 range 11 .. 21;
      SDIOITC        at 0 range 22 .. 22;
      CEATAENDC      at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype MASK_CCRCFAILIE_Field is STM32_SVD.Bit;
   subtype MASK_DCRCFAILIE_Field is STM32_SVD.Bit;
   subtype MASK_CTIMEOUTIE_Field is STM32_SVD.Bit;
   subtype MASK_DTIMEOUTIE_Field is STM32_SVD.Bit;
   subtype MASK_TXUNDERRIE_Field is STM32_SVD.Bit;
   subtype MASK_RXOVERRIE_Field is STM32_SVD.Bit;
   subtype MASK_CMDRENDIE_Field is STM32_SVD.Bit;
   subtype MASK_CMDSENTIE_Field is STM32_SVD.Bit;
   subtype MASK_DATAENDIE_Field is STM32_SVD.Bit;
   subtype MASK_STBITERRIE_Field is STM32_SVD.Bit;
   subtype MASK_DBACKENDIE_Field is STM32_SVD.Bit;
   subtype MASK_CMDACTIE_Field is STM32_SVD.Bit;
   subtype MASK_TXACTIE_Field is STM32_SVD.Bit;
   subtype MASK_RXACTIE_Field is STM32_SVD.Bit;
   subtype MASK_TXFIFOHEIE_Field is STM32_SVD.Bit;
   subtype MASK_RXFIFOHFIE_Field is STM32_SVD.Bit;
   subtype MASK_TXFIFOFIE_Field is STM32_SVD.Bit;
   subtype MASK_RXFIFOFIE_Field is STM32_SVD.Bit;
   subtype MASK_TXFIFOEIE_Field is STM32_SVD.Bit;
   subtype MASK_RXFIFOEIE_Field is STM32_SVD.Bit;
   subtype MASK_TXDAVLIE_Field is STM32_SVD.Bit;
   subtype MASK_RXDAVLIE_Field is STM32_SVD.Bit;
   subtype MASK_SDIOITIE_Field is STM32_SVD.Bit;
   subtype MASK_CEATENDIE_Field is STM32_SVD.Bit;

   --  SDIO mask register (SDIO_MASK)
   type MASK_Register is record
      --  CCRCFAILIE
      CCRCFAILIE     : MASK_CCRCFAILIE_Field := 16#0#;
      --  DCRCFAILIE
      DCRCFAILIE     : MASK_DCRCFAILIE_Field := 16#0#;
      --  CTIMEOUTIE
      CTIMEOUTIE     : MASK_CTIMEOUTIE_Field := 16#0#;
      --  DTIMEOUTIE
      DTIMEOUTIE     : MASK_DTIMEOUTIE_Field := 16#0#;
      --  TXUNDERRIE
      TXUNDERRIE     : MASK_TXUNDERRIE_Field := 16#0#;
      --  RXOVERRIE
      RXOVERRIE      : MASK_RXOVERRIE_Field := 16#0#;
      --  CMDRENDIE
      CMDRENDIE      : MASK_CMDRENDIE_Field := 16#0#;
      --  CMDSENTIE
      CMDSENTIE      : MASK_CMDSENTIE_Field := 16#0#;
      --  DATAENDIE
      DATAENDIE      : MASK_DATAENDIE_Field := 16#0#;
      --  STBITERRIE
      STBITERRIE     : MASK_STBITERRIE_Field := 16#0#;
      --  DBACKENDIE
      DBACKENDIE     : MASK_DBACKENDIE_Field := 16#0#;
      --  CMDACTIE
      CMDACTIE       : MASK_CMDACTIE_Field := 16#0#;
      --  TXACTIE
      TXACTIE        : MASK_TXACTIE_Field := 16#0#;
      --  RXACTIE
      RXACTIE        : MASK_RXACTIE_Field := 16#0#;
      --  TXFIFOHEIE
      TXFIFOHEIE     : MASK_TXFIFOHEIE_Field := 16#0#;
      --  RXFIFOHFIE
      RXFIFOHFIE     : MASK_RXFIFOHFIE_Field := 16#0#;
      --  TXFIFOFIE
      TXFIFOFIE      : MASK_TXFIFOFIE_Field := 16#0#;
      --  RXFIFOFIE
      RXFIFOFIE      : MASK_RXFIFOFIE_Field := 16#0#;
      --  TXFIFOEIE
      TXFIFOEIE      : MASK_TXFIFOEIE_Field := 16#0#;
      --  RXFIFOEIE
      RXFIFOEIE      : MASK_RXFIFOEIE_Field := 16#0#;
      --  TXDAVLIE
      TXDAVLIE       : MASK_TXDAVLIE_Field := 16#0#;
      --  RXDAVLIE
      RXDAVLIE       : MASK_RXDAVLIE_Field := 16#0#;
      --  SDIOITIE
      SDIOITIE       : MASK_SDIOITIE_Field := 16#0#;
      --  CEATENDIE
      CEATENDIE      : MASK_CEATENDIE_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MASK_Register use record
      CCRCFAILIE     at 0 range 0 .. 0;
      DCRCFAILIE     at 0 range 1 .. 1;
      CTIMEOUTIE     at 0 range 2 .. 2;
      DTIMEOUTIE     at 0 range 3 .. 3;
      TXUNDERRIE     at 0 range 4 .. 4;
      RXOVERRIE      at 0 range 5 .. 5;
      CMDRENDIE      at 0 range 6 .. 6;
      CMDSENTIE      at 0 range 7 .. 7;
      DATAENDIE      at 0 range 8 .. 8;
      STBITERRIE     at 0 range 9 .. 9;
      DBACKENDIE     at 0 range 10 .. 10;
      CMDACTIE       at 0 range 11 .. 11;
      TXACTIE        at 0 range 12 .. 12;
      RXACTIE        at 0 range 13 .. 13;
      TXFIFOHEIE     at 0 range 14 .. 14;
      RXFIFOHFIE     at 0 range 15 .. 15;
      TXFIFOFIE      at 0 range 16 .. 16;
      RXFIFOFIE      at 0 range 17 .. 17;
      TXFIFOEIE      at 0 range 18 .. 18;
      RXFIFOEIE      at 0 range 19 .. 19;
      TXDAVLIE       at 0 range 20 .. 20;
      RXDAVLIE       at 0 range 21 .. 21;
      SDIOITIE       at 0 range 22 .. 22;
      CEATENDIE      at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype FIFOCNT_FIF0COUNT_Field is STM32_SVD.UInt24;

   --  Bits 23:0 = FIFOCOUNT: Remaining number of words to be written to or
   --  read from the FIFO
   type FIFOCNT_Register is record
      --  Read-only. FIF0COUNT
      FIF0COUNT      : FIFOCNT_FIF0COUNT_Field;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIFOCNT_Register use record
      FIF0COUNT      at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Secure digital input/output interface
   type SDIO_Peripheral is record
      --  Bits 1:0 = PWRCTRL: Power supply control bits
      POWER   : aliased POWER_Register;
      --  SDI clock control register (SDIO_CLKCR)
      CLKCR   : aliased CLKCR_Register;
      --  Bits 31:0 = : Command argument
      ARG     : aliased STM32_SVD.UInt32;
      --  SDIO command register (SDIO_CMD)
      CMD     : aliased CMD_Register;
      --  SDIO command register
      RESPCMD : aliased RESPCMD_Register;
      --  Bits 31:0 = CARDSTATUS1
      RESPI1  : aliased STM32_SVD.UInt32;
      --  Bits 31:0 = CARDSTATUS2
      RESP2   : aliased STM32_SVD.UInt32;
      --  Bits 31:0 = CARDSTATUS3
      RESP3   : aliased STM32_SVD.UInt32;
      --  Bits 31:0 = CARDSTATUS4
      RESP4   : aliased STM32_SVD.UInt32;
      --  Bits 31:0 = DATATIME: Data timeout period
      DTIMER  : aliased STM32_SVD.UInt32;
      --  Bits 24:0 = DATALENGTH: Data length value
      DLEN    : aliased DLEN_Register;
      --  SDIO data control register (SDIO_DCTRL)
      DCTRL   : aliased DCTRL_Register;
      --  Bits 24:0 = DATACOUNT: Data count value
      DCOUNT  : aliased DCOUNT_Register;
      --  SDIO status register (SDIO_STA)
      STA     : aliased STA_Register;
      --  SDIO interrupt clear register (SDIO_ICR)
      ICR     : aliased ICR_Register;
      --  SDIO mask register (SDIO_MASK)
      MASK    : aliased MASK_Register;
      --  Bits 23:0 = FIFOCOUNT: Remaining number of words to be written to or
      --  read from the FIFO
      FIFOCNT : aliased FIFOCNT_Register;
      --  bits 31:0 = FIFOData: Receive and transmit FIFO data
      FIFO    : aliased STM32_SVD.UInt32;
   end record
     with Volatile;

   for SDIO_Peripheral use record
      POWER   at 16#0# range 0 .. 31;
      CLKCR   at 16#4# range 0 .. 31;
      ARG     at 16#8# range 0 .. 31;
      CMD     at 16#C# range 0 .. 31;
      RESPCMD at 16#10# range 0 .. 31;
      RESPI1  at 16#14# range 0 .. 31;
      RESP2   at 16#18# range 0 .. 31;
      RESP3   at 16#1C# range 0 .. 31;
      RESP4   at 16#20# range 0 .. 31;
      DTIMER  at 16#24# range 0 .. 31;
      DLEN    at 16#28# range 0 .. 31;
      DCTRL   at 16#2C# range 0 .. 31;
      DCOUNT  at 16#30# range 0 .. 31;
      STA     at 16#34# range 0 .. 31;
      ICR     at 16#38# range 0 .. 31;
      MASK    at 16#3C# range 0 .. 31;
      FIFOCNT at 16#48# range 0 .. 31;
      FIFO    at 16#80# range 0 .. 31;
   end record;

   --  Secure digital input/output interface
   SDIO_Periph : aliased SDIO_Peripheral
     with Import, Address => System'To_Address (16#40018000#);

end STM32_SVD.SDIO;
