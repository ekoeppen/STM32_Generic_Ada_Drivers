--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.SPI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  control register 1
   type CR1_Register is record
      --  Clock phase
      CPHA           : STM32_SVD.Bit;
      --  Clock polarity
      CPOL           : STM32_SVD.Bit;
      --  Master selection
      MSTR           : STM32_SVD.Bit;
      --  Baud rate control
      BR             : STM32_SVD.UInt3;
      --  SPI enable
      SPE            : STM32_SVD.Bit;
      --  Frame format
      LSBFIRST       : STM32_SVD.Bit;
      --  Internal slave select
      SSI            : STM32_SVD.Bit;
      --  Software slave management
      SSM            : STM32_SVD.Bit;
      --  Receive only
      RXONLY         : STM32_SVD.Bit;
      --  Data frame format
      DFF            : STM32_SVD.Bit;
      --  CRC transfer next
      CRCNEXT        : STM32_SVD.Bit;
      --  Hardware CRC calculation enable
      CRCEN          : STM32_SVD.Bit;
      --  Output enable in bidirectional mode
      BIDIOE         : STM32_SVD.Bit;
      --  Bidirectional data mode enable
      BIDIMODE       : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      CPHA           at 0 range 0 .. 0;
      CPOL           at 0 range 1 .. 1;
      MSTR           at 0 range 2 .. 2;
      BR             at 0 range 3 .. 5;
      SPE            at 0 range 6 .. 6;
      LSBFIRST       at 0 range 7 .. 7;
      SSI            at 0 range 8 .. 8;
      SSM            at 0 range 9 .. 9;
      RXONLY         at 0 range 10 .. 10;
      DFF            at 0 range 11 .. 11;
      CRCNEXT        at 0 range 12 .. 12;
      CRCEN          at 0 range 13 .. 13;
      BIDIOE         at 0 range 14 .. 14;
      BIDIMODE       at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  control register 2
   type CR2_Register is record
      --  Rx buffer DMA enable
      RXDMAEN       : STM32_SVD.Bit;
      --  Tx buffer DMA enable
      TXDMAEN       : STM32_SVD.Bit;
      --  SS output enable
      SSOE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_3_3  : STM32_SVD.Bit;
      --  Frame format
      FRF           : STM32_SVD.Bit;
      --  Error interrupt enable
      ERRIE         : STM32_SVD.Bit;
      --  RX buffer not empty interrupt enable
      RXNEIE        : STM32_SVD.Bit;
      --  Tx buffer empty interrupt enable
      TXEIE         : STM32_SVD.Bit;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      RXDMAEN       at 0 range 0 .. 0;
      TXDMAEN       at 0 range 1 .. 1;
      SSOE          at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      FRF           at 0 range 4 .. 4;
      ERRIE         at 0 range 5 .. 5;
      RXNEIE        at 0 range 6 .. 6;
      TXEIE         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  status register
   type SR_Register is record
      --  Read-only. Receive buffer not empty
      RXNE          : STM32_SVD.Bit;
      --  Read-only. Transmit buffer empty
      TXE           : STM32_SVD.Bit;
      --  Read-only. Channel side
      CHSIDE        : STM32_SVD.Bit;
      --  Read-only. Underrun flag
      UDR           : STM32_SVD.Bit;
      --  CRC error flag
      CRCERR        : STM32_SVD.Bit;
      --  Read-only. Mode fault
      MODF          : STM32_SVD.Bit;
      --  Read-only. Overrun flag
      OVR           : STM32_SVD.Bit;
      --  Read-only. Busy flag
      BSY           : STM32_SVD.Bit;
      --  Read-only. TI frame format error
      TIFRFE        : STM32_SVD.Bit;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      RXNE          at 0 range 0 .. 0;
      TXE           at 0 range 1 .. 1;
      CHSIDE        at 0 range 2 .. 2;
      UDR           at 0 range 3 .. 3;
      CRCERR        at 0 range 4 .. 4;
      MODF          at 0 range 5 .. 5;
      OVR           at 0 range 6 .. 6;
      BSY           at 0 range 7 .. 7;
      TIFRFE        at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  data register
   type DR_Register is record
      --  Data register
      DR             : STM32_SVD.Byte;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DR            at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  CRC polynomial register
   type CRCPR_Register is record
      --  CRC polynomial register
      CRCPOLY        : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRCPR_Register use record
      CRCPOLY        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  RX CRC register
   type RXCRCR_Register is record
      --  Read-only. Rx CRC register
      RxCRC          : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXCRCR_Register use record
      RxCRC          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  TX CRC register
   type TXCRCR_Register is record
      --  Read-only. Tx CRC register
      TxCRC          : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXCRCR_Register use record
      TxCRC          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  I2S configuration register
   type I2SCFGR_Register is record
      --  Channel length (number of bits per audio channel)
      CHLEN          : STM32_SVD.Bit;
      --  Data length to be transferred
      DATLEN         : STM32_SVD.UInt2;
      --  Steady state clock polarity
      CKPOL          : STM32_SVD.Bit;
      --  I2S standard selection
      I2SSTD         : STM32_SVD.UInt2;
      --  unspecified
      Reserved_6_6   : STM32_SVD.Bit;
      --  PCM frame synchronization
      PCMSYNC        : STM32_SVD.Bit;
      --  I2S configuration mode
      I2SCFG         : STM32_SVD.UInt2;
      --  I2S Enable
      I2SE           : STM32_SVD.Bit;
      --  I2S mode selection
      I2SMOD         : STM32_SVD.Bit;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for I2SCFGR_Register use record
      CHLEN          at 0 range 0 .. 0;
      DATLEN         at 0 range 1 .. 2;
      CKPOL          at 0 range 3 .. 3;
      I2SSTD         at 0 range 4 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      PCMSYNC        at 0 range 7 .. 7;
      I2SCFG         at 0 range 8 .. 9;
      I2SE           at 0 range 10 .. 10;
      I2SMOD         at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  I2S prescaler register
   type I2SPR_Register is record
      --  I2S Linear prescaler
      I2SDIV         : STM32_SVD.Byte;
      --  Odd factor for the prescaler
      ODD            : STM32_SVD.Bit;
      --  Master clock output enable
      MCKOE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_10_31 : STM32_SVD.UInt22;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for I2SPR_Register use record
      I2SDIV         at 0 range 0 .. 7;
      ODD            at 0 range 8 .. 8;
      MCKOE          at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Serial peripheral interface
   type SPI_Peripheral is record
      --  control register 1
      CR1     : aliased CR1_Register;
      --  control register 2
      CR2     : aliased CR2_Register;
      --  status register
      SR      : aliased SR_Register;
      --  data register
      DR      : aliased DR_Register;
      --  CRC polynomial register
      CRCPR   : aliased CRCPR_Register;
      --  RX CRC register
      RXCRCR  : aliased RXCRCR_Register;
      --  TX CRC register
      TXCRCR  : aliased TXCRCR_Register;
      --  I2S configuration register
      I2SCFGR : aliased I2SCFGR_Register;
      --  I2S prescaler register
      I2SPR   : aliased I2SPR_Register;
   end record
     with Volatile;

   for SPI_Peripheral use record
      CR1     at 16#0# range 0 .. 31;
      CR2     at 16#4# range 0 .. 31;
      SR      at 16#8# range 0 .. 31;
      DR      at 16#C# range 0 .. 31;
      CRCPR   at 16#10# range 0 .. 31;
      RXCRCR  at 16#14# range 0 .. 31;
      TXCRCR  at 16#18# range 0 .. 31;
      I2SCFGR at 16#1C# range 0 .. 31;
      I2SPR   at 16#20# range 0 .. 31;
   end record;

   --  Serial peripheral interface
   SPI1_Periph : aliased SPI_Peripheral
     with Import, Address => SPI1_Base;

   --  Serial peripheral interface
   SPI2_Periph : aliased SPI_Peripheral
     with Import, Address => SPI2_Base;

end STM32_SVD.SPI;
