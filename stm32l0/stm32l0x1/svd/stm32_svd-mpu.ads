--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.MPU is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  MPU type register
   type MPU_TYPER_Register is record
      --  Read-only. Separate flag
      SEPARATE_k     : STM32_SVD.Bit;
      --  unspecified
      Reserved_1_7   : STM32_SVD.UInt7;
      --  Read-only. Number of MPU data regions
      DREGION        : STM32_SVD.Byte;
      --  Read-only. Number of MPU instruction regions
      IREGION        : STM32_SVD.Byte;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_TYPER_Register use record
      SEPARATE_k     at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      DREGION        at 0 range 8 .. 15;
      IREGION        at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  MPU control register
   type MPU_CTRL_Register is record
      --  Read-only. Enables the MPU
      ENABLE        : STM32_SVD.Bit;
      --  Read-only. Enables the operation of MPU during hard fault
      HFNMIENA      : STM32_SVD.Bit;
      --  Read-only. Enable priviliged software access to default memory map
      PRIVDEFENA    : STM32_SVD.Bit;
      --  unspecified
      Reserved_3_31 : STM32_SVD.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      HFNMIENA      at 0 range 1 .. 1;
      PRIVDEFENA    at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  MPU region number register
   type MPU_RNR_Register is record
      --  MPU region
      REGION        : STM32_SVD.Byte;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RNR_Register use record
      REGION        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  MPU region base address register
   type MPU_RBAR_Register is record
      --  MPU region field
      REGION : STM32_SVD.UInt4;
      --  MPU region number valid
      VALID  : STM32_SVD.Bit;
      --  Region base address field
      ADDR   : STM32_SVD.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RBAR_Register use record
      REGION at 0 range 0 .. 3;
      VALID  at 0 range 4 .. 4;
      ADDR   at 0 range 5 .. 31;
   end record;

   --  MPU region attribute and size register
   type MPU_RASR_Register is record
      --  Region enable bit.
      ENABLE         : STM32_SVD.Bit;
      --  Size of the MPU protection region
      SIZE           : STM32_SVD.UInt5;
      --  unspecified
      Reserved_6_7   : STM32_SVD.UInt2;
      --  Subregion disable bits
      SRD            : STM32_SVD.Byte;
      --  memory attribute
      B              : STM32_SVD.Bit;
      --  memory attribute
      C              : STM32_SVD.Bit;
      --  Shareable memory attribute
      S              : STM32_SVD.Bit;
      --  memory attribute
      TEX            : STM32_SVD.UInt3;
      --  unspecified
      Reserved_22_23 : STM32_SVD.UInt2;
      --  Access permission
      AP             : STM32_SVD.UInt3;
      --  unspecified
      Reserved_27_27 : STM32_SVD.Bit;
      --  Instruction access disable bit
      XN             : STM32_SVD.Bit;
      --  unspecified
      Reserved_29_31 : STM32_SVD.UInt3;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RASR_Register use record
      ENABLE         at 0 range 0 .. 0;
      SIZE           at 0 range 1 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SRD            at 0 range 8 .. 15;
      B              at 0 range 16 .. 16;
      C              at 0 range 17 .. 17;
      S              at 0 range 18 .. 18;
      TEX            at 0 range 19 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      AP             at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      XN             at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Memory protection unit
   type MPU_Peripheral is record
      --  MPU type register
      MPU_TYPER : aliased MPU_TYPER_Register;
      --  MPU control register
      MPU_CTRL  : aliased MPU_CTRL_Register;
      --  MPU region number register
      MPU_RNR   : aliased MPU_RNR_Register;
      --  MPU region base address register
      MPU_RBAR  : aliased MPU_RBAR_Register;
      --  MPU region attribute and size register
      MPU_RASR  : aliased MPU_RASR_Register;
   end record
     with Volatile;

   for MPU_Peripheral use record
      MPU_TYPER at 16#0# range 0 .. 31;
      MPU_CTRL  at 16#4# range 0 .. 31;
      MPU_RNR   at 16#8# range 0 .. 31;
      MPU_RBAR  at 16#C# range 0 .. 31;
      MPU_RASR  at 16#10# range 0 .. 31;
   end record;

   --  Memory protection unit
   MPU_Periph : aliased MPU_Peripheral
     with Import, Address => MPU_Base;

end STM32_SVD.MPU;
