--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.AES is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  control register
   type CR_Register is record
      --  AES enable
      EN             : STM32_SVD.Bit;
      --  Data type selection (for data in and data out to/from the
      --  cryptographic block)
      DATATYPE       : STM32_SVD.UInt2;
      --  AES operating mode
      MODE           : STM32_SVD.UInt2;
      --  AES chaining mode
      CHMOD          : STM32_SVD.UInt2;
      --  Computation Complete Flag Clear
      CCFC           : STM32_SVD.Bit;
      --  Error clear
      ERRC           : STM32_SVD.Bit;
      --  CCF flag interrupt enable
      CCFIE          : STM32_SVD.Bit;
      --  Error interrupt enable
      ERRIE          : STM32_SVD.Bit;
      --  Enable DMA management of data input phase
      DMAINEN        : STM32_SVD.Bit;
      --  Enable DMA management of data output phase
      DMAOUTEN       : STM32_SVD.Bit;
      --  unspecified
      Reserved_13_31 : STM32_SVD.UInt19;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      EN             at 0 range 0 .. 0;
      DATATYPE       at 0 range 1 .. 2;
      MODE           at 0 range 3 .. 4;
      CHMOD          at 0 range 5 .. 6;
      CCFC           at 0 range 7 .. 7;
      ERRC           at 0 range 8 .. 8;
      CCFIE          at 0 range 9 .. 9;
      ERRIE          at 0 range 10 .. 10;
      DMAINEN        at 0 range 11 .. 11;
      DMAOUTEN       at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   --  status register
   type SR_Register is record
      --  Read-only. Computation complete flag
      CCF           : STM32_SVD.Bit;
      --  Read-only. Read error flag
      RDERR         : STM32_SVD.Bit;
      --  Read-only. Write error flag
      WRERR         : STM32_SVD.Bit;
      --  unspecified
      Reserved_3_31 : STM32_SVD.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      CCF           at 0 range 0 .. 0;
      RDERR         at 0 range 1 .. 1;
      WRERR         at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Advanced encryption standard hardware accelerator
   type AES_Peripheral is record
      --  control register
      CR    : aliased CR_Register;
      --  status register
      SR    : aliased SR_Register;
      --  data input register
      DINR  : aliased STM32_SVD.UInt32;
      --  data output register
      DOUTR : aliased STM32_SVD.UInt32;
      --  key register 0
      KEYR0 : aliased STM32_SVD.UInt32;
      --  key register 1
      KEYR1 : aliased STM32_SVD.UInt32;
      --  key register 2
      KEYR2 : aliased STM32_SVD.UInt32;
      --  key register 3
      KEYR3 : aliased STM32_SVD.UInt32;
      --  initialization vector register 0
      IVR0  : aliased STM32_SVD.UInt32;
      --  initialization vector register 1
      IVR1  : aliased STM32_SVD.UInt32;
      --  initialization vector register 2
      IVR2  : aliased STM32_SVD.UInt32;
      --  initialization vector register 3
      IVR3  : aliased STM32_SVD.UInt32;
   end record
     with Volatile;

   for AES_Peripheral use record
      CR    at 16#0# range 0 .. 31;
      SR    at 16#4# range 0 .. 31;
      DINR  at 16#8# range 0 .. 31;
      DOUTR at 16#C# range 0 .. 31;
      KEYR0 at 16#10# range 0 .. 31;
      KEYR1 at 16#14# range 0 .. 31;
      KEYR2 at 16#18# range 0 .. 31;
      KEYR3 at 16#1C# range 0 .. 31;
      IVR0  at 16#20# range 0 .. 31;
      IVR1  at 16#24# range 0 .. 31;
      IVR2  at 16#28# range 0 .. 31;
      IVR3  at 16#2C# range 0 .. 31;
   end record;

   --  Advanced encryption standard hardware accelerator
   AES_Periph : aliased AES_Peripheral
     with Import, Address => AES_Base;

end STM32_SVD.AES;
