--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.I2C is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Control register 1
   type CR1_Register is record
      --  Peripheral enable
      PE             : STM32_SVD.Bit;
      --  TX Interrupt enable
      TXIE           : STM32_SVD.Bit;
      --  RX Interrupt enable
      RXIE           : STM32_SVD.Bit;
      --  Address match interrupt enable (slave only)
      ADDRIE         : STM32_SVD.Bit;
      --  Not acknowledge received interrupt enable
      NACKIE         : STM32_SVD.Bit;
      --  STOP detection Interrupt enable
      STOPIE         : STM32_SVD.Bit;
      --  Transfer Complete interrupt enable
      TCIE           : STM32_SVD.Bit;
      --  Error interrupts enable
      ERRIE          : STM32_SVD.Bit;
      --  Digital noise filter
      DNF            : STM32_SVD.UInt4;
      --  Analog noise filter OFF
      ANFOFF         : STM32_SVD.Bit;
      --  unspecified
      Reserved_13_13 : STM32_SVD.Bit;
      --  DMA transmission requests enable
      TXDMAEN        : STM32_SVD.Bit;
      --  DMA reception requests enable
      RXDMAEN        : STM32_SVD.Bit;
      --  Slave byte control
      SBC            : STM32_SVD.Bit;
      --  Clock stretching disable
      NOSTRETCH      : STM32_SVD.Bit;
      --  Wakeup from STOP enable
      WUPEN          : STM32_SVD.Bit;
      --  General call enable
      GCEN           : STM32_SVD.Bit;
      --  SMBus Host address enable
      SMBHEN         : STM32_SVD.Bit;
      --  SMBus Device Default address enable
      SMBDEN         : STM32_SVD.Bit;
      --  SMBUS alert enable
      ALERTEN        : STM32_SVD.Bit;
      --  PEC enable
      PECEN          : STM32_SVD.Bit;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      PE             at 0 range 0 .. 0;
      TXIE           at 0 range 1 .. 1;
      RXIE           at 0 range 2 .. 2;
      ADDRIE         at 0 range 3 .. 3;
      NACKIE         at 0 range 4 .. 4;
      STOPIE         at 0 range 5 .. 5;
      TCIE           at 0 range 6 .. 6;
      ERRIE          at 0 range 7 .. 7;
      DNF            at 0 range 8 .. 11;
      ANFOFF         at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      TXDMAEN        at 0 range 14 .. 14;
      RXDMAEN        at 0 range 15 .. 15;
      SBC            at 0 range 16 .. 16;
      NOSTRETCH      at 0 range 17 .. 17;
      WUPEN          at 0 range 18 .. 18;
      GCEN           at 0 range 19 .. 19;
      SMBHEN         at 0 range 20 .. 20;
      SMBDEN         at 0 range 21 .. 21;
      ALERTEN        at 0 range 22 .. 22;
      PECEN          at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Control register 2
   type CR2_Register is record
      --  Slave address bit (master mode)
      SADD           : STM32_SVD.UInt10;
      --  Transfer direction (master mode)
      RD_WRN         : STM32_SVD.Bit;
      --  10-bit addressing mode (master mode)
      ADD10          : STM32_SVD.Bit;
      --  10-bit address header only read direction (master receiver mode)
      HEAD10R        : STM32_SVD.Bit;
      --  Start generation
      START          : STM32_SVD.Bit;
      --  Stop generation (master mode)
      STOP           : STM32_SVD.Bit;
      --  NACK generation (slave mode)
      NACK           : STM32_SVD.Bit;
      --  Number of bytes
      NBYTES         : STM32_SVD.Byte;
      --  NBYTES reload mode
      RELOAD         : STM32_SVD.Bit;
      --  Automatic end mode (master mode)
      AUTOEND        : STM32_SVD.Bit;
      --  Packet error checking byte
      PECBYTE        : STM32_SVD.Bit;
      --  unspecified
      Reserved_27_31 : STM32_SVD.UInt5;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      SADD           at 0 range 0 .. 9;
      RD_WRN         at 0 range 10 .. 10;
      ADD10          at 0 range 11 .. 11;
      HEAD10R        at 0 range 12 .. 12;
      START          at 0 range 13 .. 13;
      STOP           at 0 range 14 .. 14;
      NACK           at 0 range 15 .. 15;
      NBYTES         at 0 range 16 .. 23;
      RELOAD         at 0 range 24 .. 24;
      AUTOEND        at 0 range 25 .. 25;
      PECBYTE        at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   --  Own address register 1
   type OAR1_Register is record
      --  Interface address
      OA1            : STM32_SVD.UInt10;
      --  Own Address 1 10-bit mode
      OA1MODE        : STM32_SVD.Bit;
      --  unspecified
      Reserved_11_14 : STM32_SVD.UInt4;
      --  Own Address 1 enable
      OA1EN          : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OAR1_Register use record
      OA1            at 0 range 0 .. 9;
      OA1MODE        at 0 range 10 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      OA1EN          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Own address register 2
   type OAR2_Register is record
      --  unspecified
      Reserved_0_0   : STM32_SVD.Bit;
      --  Interface address
      OA2            : STM32_SVD.UInt7;
      --  Own Address 2 masks
      OA2MSK         : STM32_SVD.UInt3;
      --  unspecified
      Reserved_11_14 : STM32_SVD.UInt4;
      --  Own Address 2 enable
      OA2EN          : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OAR2_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      OA2            at 0 range 1 .. 7;
      OA2MSK         at 0 range 8 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      OA2EN          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Timing register
   type TIMINGR_Register is record
      --  SCL low period (master mode)
      SCLL           : STM32_SVD.Byte;
      --  SCL high period (master mode)
      SCLH           : STM32_SVD.Byte;
      --  Data hold time
      SDADEL         : STM32_SVD.UInt4;
      --  Data setup time
      SCLDEL         : STM32_SVD.UInt4;
      --  unspecified
      Reserved_24_27 : STM32_SVD.UInt4;
      --  Timing prescaler
      PRESC          : STM32_SVD.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMINGR_Register use record
      SCLL           at 0 range 0 .. 7;
      SCLH           at 0 range 8 .. 15;
      SDADEL         at 0 range 16 .. 19;
      SCLDEL         at 0 range 20 .. 23;
      Reserved_24_27 at 0 range 24 .. 27;
      PRESC          at 0 range 28 .. 31;
   end record;

   --  Status register 1
   type TIMEOUTR_Register is record
      --  Bus timeout A
      TIMEOUTA       : STM32_SVD.UInt12;
      --  Idle clock timeout detection
      TIDLE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_13_14 : STM32_SVD.UInt2;
      --  Clock timeout enable
      TIMOUTEN       : STM32_SVD.Bit;
      --  Bus timeout B
      TIMEOUTB       : STM32_SVD.UInt12;
      --  unspecified
      Reserved_28_30 : STM32_SVD.UInt3;
      --  Extended clock timeout enable
      TEXTEN         : STM32_SVD.Bit;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMEOUTR_Register use record
      TIMEOUTA       at 0 range 0 .. 11;
      TIDLE          at 0 range 12 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      TIMOUTEN       at 0 range 15 .. 15;
      TIMEOUTB       at 0 range 16 .. 27;
      Reserved_28_30 at 0 range 28 .. 30;
      TEXTEN         at 0 range 31 .. 31;
   end record;

   --  Interrupt and Status register
   type ISR_Register is record
      --  Transmit data register empty (transmitters)
      TXE            : STM32_SVD.Bit;
      --  Transmit interrupt status (transmitters)
      TXIS           : STM32_SVD.Bit;
      --  Read-only. Receive data register not empty (receivers)
      RXNE           : STM32_SVD.Bit;
      --  Read-only. Address matched (slave mode)
      ADDR           : STM32_SVD.Bit;
      --  Read-only. Not acknowledge received flag
      NACKF          : STM32_SVD.Bit;
      --  Read-only. Stop detection flag
      STOPF          : STM32_SVD.Bit;
      --  Read-only. Transfer Complete (master mode)
      TC             : STM32_SVD.Bit;
      --  Read-only. Transfer Complete Reload
      TCR            : STM32_SVD.Bit;
      --  Read-only. Bus error
      BERR           : STM32_SVD.Bit;
      --  Read-only. Arbitration lost
      ARLO           : STM32_SVD.Bit;
      --  Read-only. Overrun/Underrun (slave mode)
      OVR            : STM32_SVD.Bit;
      --  Read-only. PEC Error in reception
      PECERR         : STM32_SVD.Bit;
      --  Read-only. Timeout or t_low detection flag
      TIMEOUT        : STM32_SVD.Bit;
      --  Read-only. SMBus alert
      ALERT          : STM32_SVD.Bit;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit;
      --  Read-only. Bus busy
      BUSY           : STM32_SVD.Bit;
      --  Read-only. Transfer direction (Slave mode)
      DIR            : STM32_SVD.Bit;
      --  Read-only. Address match code (Slave mode)
      ADDCODE        : STM32_SVD.UInt7;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      TXE            at 0 range 0 .. 0;
      TXIS           at 0 range 1 .. 1;
      RXNE           at 0 range 2 .. 2;
      ADDR           at 0 range 3 .. 3;
      NACKF          at 0 range 4 .. 4;
      STOPF          at 0 range 5 .. 5;
      TC             at 0 range 6 .. 6;
      TCR            at 0 range 7 .. 7;
      BERR           at 0 range 8 .. 8;
      ARLO           at 0 range 9 .. 9;
      OVR            at 0 range 10 .. 10;
      PECERR         at 0 range 11 .. 11;
      TIMEOUT        at 0 range 12 .. 12;
      ALERT          at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      BUSY           at 0 range 15 .. 15;
      DIR            at 0 range 16 .. 16;
      ADDCODE        at 0 range 17 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  Interrupt clear register
   type ICR_Register is record
      --  unspecified
      Reserved_0_2   : STM32_SVD.UInt3;
      --  Write-only. Address Matched flag clear
      ADDRCF         : STM32_SVD.Bit;
      --  Write-only. Not Acknowledge flag clear
      NACKCF         : STM32_SVD.Bit;
      --  Write-only. Stop detection flag clear
      STOPCF         : STM32_SVD.Bit;
      --  unspecified
      Reserved_6_7   : STM32_SVD.UInt2;
      --  Write-only. Bus error flag clear
      BERRCF         : STM32_SVD.Bit;
      --  Write-only. Arbitration lost flag clear
      ARLOCF         : STM32_SVD.Bit;
      --  Write-only. Overrun/Underrun flag clear
      OVRCF          : STM32_SVD.Bit;
      --  Write-only. PEC Error flag clear
      PECCF          : STM32_SVD.Bit;
      --  Write-only. Timeout detection flag clear
      TIMOUTCF       : STM32_SVD.Bit;
      --  Write-only. Alert flag clear
      ALERTCF        : STM32_SVD.Bit;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      ADDRCF         at 0 range 3 .. 3;
      NACKCF         at 0 range 4 .. 4;
      STOPCF         at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      BERRCF         at 0 range 8 .. 8;
      ARLOCF         at 0 range 9 .. 9;
      OVRCF          at 0 range 10 .. 10;
      PECCF          at 0 range 11 .. 11;
      TIMOUTCF       at 0 range 12 .. 12;
      ALERTCF        at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   --  PEC register
   type PECR_Register is record
      --  Read-only. Packet error checking register
      PEC           : STM32_SVD.Byte;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PECR_Register use record
      PEC           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Receive data register
   type RXDR_Register is record
      --  Read-only. 8-bit receive data
      RXDATA        : STM32_SVD.Byte;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXDR_Register use record
      RXDATA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  Transmit data register
   type TXDR_Register is record
      --  8-bit transmit data
      TXDATA        : STM32_SVD.Byte;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXDR_Register use record
      TXDATA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Inter-integrated circuit
   type I2C_Peripheral is record
      --  Control register 1
      CR1      : aliased CR1_Register;
      --  Control register 2
      CR2      : aliased CR2_Register;
      --  Own address register 1
      OAR1     : aliased OAR1_Register;
      --  Own address register 2
      OAR2     : aliased OAR2_Register;
      --  Timing register
      TIMINGR  : aliased TIMINGR_Register;
      --  Status register 1
      TIMEOUTR : aliased TIMEOUTR_Register;
      --  Interrupt and Status register
      ISR      : aliased ISR_Register;
      --  Interrupt clear register
      ICR      : aliased ICR_Register;
      --  PEC register
      PECR     : aliased PECR_Register;
      --  Receive data register
      RXDR     : aliased RXDR_Register;
      --  Transmit data register
      TXDR     : aliased TXDR_Register;
   end record
     with Volatile;

   for I2C_Peripheral use record
      CR1      at 16#0# range 0 .. 31;
      CR2      at 16#4# range 0 .. 31;
      OAR1     at 16#8# range 0 .. 31;
      OAR2     at 16#C# range 0 .. 31;
      TIMINGR  at 16#10# range 0 .. 31;
      TIMEOUTR at 16#14# range 0 .. 31;
      ISR      at 16#18# range 0 .. 31;
      ICR      at 16#1C# range 0 .. 31;
      PECR     at 16#20# range 0 .. 31;
      RXDR     at 16#24# range 0 .. 31;
      TXDR     at 16#28# range 0 .. 31;
   end record;

   --  Inter-integrated circuit
   I2C1_Periph : aliased I2C_Peripheral
     with Import, Address => I2C1_Base;

   --  Inter-integrated circuit
   I2C2_Periph : aliased I2C_Peripheral
     with Import, Address => I2C2_Base;

   --  Inter-integrated circuit
   I2C3_Periph : aliased I2C_Peripheral
     with Import, Address => I2C3_Base;

end STM32_SVD.I2C;
