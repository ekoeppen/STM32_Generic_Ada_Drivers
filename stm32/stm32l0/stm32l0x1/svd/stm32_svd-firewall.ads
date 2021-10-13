pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.Firewall is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype FIREWALL_CSSA_ADD_Field is STM32_SVD.UInt16;

   --  Code segment start address
   type FIREWALL_CSSA_Register is record
      --  unspecified
      Reserved_0_7   : STM32_SVD.Byte := 16#0#;
      --  code segment start address
      ADD            : FIREWALL_CSSA_ADD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIREWALL_CSSA_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      ADD            at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype FIREWALL_CSL_LENG_Field is STM32_SVD.UInt14;

   --  Code segment length
   type FIREWALL_CSL_Register is record
      --  unspecified
      Reserved_0_7   : STM32_SVD.Byte := 16#0#;
      --  code segment length
      LENG           : FIREWALL_CSL_LENG_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : STM32_SVD.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIREWALL_CSL_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      LENG           at 0 range 8 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype FIREWALL_NVDSSA_ADD_Field is STM32_SVD.UInt16;

   --  Non-volatile data segment start address
   type FIREWALL_NVDSSA_Register is record
      --  unspecified
      Reserved_0_7   : STM32_SVD.Byte := 16#0#;
      --  Non-volatile data segment start address
      ADD            : FIREWALL_NVDSSA_ADD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIREWALL_NVDSSA_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      ADD            at 0 range 8 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype FIREWALL_NVDSL_LENG_Field is STM32_SVD.UInt14;

   --  Non-volatile data segment length
   type FIREWALL_NVDSL_Register is record
      --  unspecified
      Reserved_0_7   : STM32_SVD.Byte := 16#0#;
      --  Non-volatile data segment length
      LENG           : FIREWALL_NVDSL_LENG_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : STM32_SVD.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIREWALL_NVDSL_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      LENG           at 0 range 8 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype FIREWALL_VDSSA_ADD_Field is STM32_SVD.UInt10;

   --  Volatile data segment start address
   type FIREWALL_VDSSA_Register is record
      --  unspecified
      Reserved_0_5   : STM32_SVD.UInt6 := 16#0#;
      --  Volatile data segment start address
      ADD            : FIREWALL_VDSSA_ADD_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIREWALL_VDSSA_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      ADD            at 0 range 6 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype FIREWALL_VDSL_LENG_Field is STM32_SVD.UInt10;

   --  Volatile data segment length
   type FIREWALL_VDSL_Register is record
      --  unspecified
      Reserved_0_5   : STM32_SVD.UInt6 := 16#0#;
      --  Non-volatile data segment length
      LENG           : FIREWALL_VDSL_LENG_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIREWALL_VDSL_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      LENG           at 0 range 6 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype FIREWALL_CR_FPA_Field is STM32_SVD.Bit;
   subtype FIREWALL_CR_VDS_Field is STM32_SVD.Bit;
   subtype FIREWALL_CR_VDE_Field is STM32_SVD.Bit;

   --  Configuration register
   type FIREWALL_CR_Register is record
      --  Firewall pre alarm
      FPA           : FIREWALL_CR_FPA_Field := 16#0#;
      --  Volatile data shared
      VDS           : FIREWALL_CR_VDS_Field := 16#0#;
      --  Volatile data execution
      VDE           : FIREWALL_CR_VDE_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : STM32_SVD.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FIREWALL_CR_Register use record
      FPA           at 0 range 0 .. 0;
      VDS           at 0 range 1 .. 1;
      VDE           at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Firewall
   type Firewall_Peripheral is record
      --  Code segment start address
      FIREWALL_CSSA   : aliased FIREWALL_CSSA_Register;
      --  Code segment length
      FIREWALL_CSL    : aliased FIREWALL_CSL_Register;
      --  Non-volatile data segment start address
      FIREWALL_NVDSSA : aliased FIREWALL_NVDSSA_Register;
      --  Non-volatile data segment length
      FIREWALL_NVDSL  : aliased FIREWALL_NVDSL_Register;
      --  Volatile data segment start address
      FIREWALL_VDSSA  : aliased FIREWALL_VDSSA_Register;
      --  Volatile data segment length
      FIREWALL_VDSL   : aliased FIREWALL_VDSL_Register;
      --  Configuration register
      FIREWALL_CR     : aliased FIREWALL_CR_Register;
   end record
     with Volatile;

   for Firewall_Peripheral use record
      FIREWALL_CSSA   at 16#0# range 0 .. 31;
      FIREWALL_CSL    at 16#4# range 0 .. 31;
      FIREWALL_NVDSSA at 16#8# range 0 .. 31;
      FIREWALL_NVDSL  at 16#C# range 0 .. 31;
      FIREWALL_VDSSA  at 16#10# range 0 .. 31;
      FIREWALL_VDSL   at 16#14# range 0 .. 31;
      FIREWALL_CR     at 16#20# range 0 .. 31;
   end record;

   --  Firewall
   Firewall_Periph : aliased Firewall_Peripheral
     with Import, Address => Firewall_Base;

end STM32_SVD.Firewall;
