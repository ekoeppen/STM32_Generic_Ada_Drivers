--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.NVIC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Interrupt Priority Register 0
   type IPR0_Register is record
      --  priority for interrupt 0
      PRI_0 : STM32_SVD.Byte;
      --  priority for interrupt 1
      PRI_1 : STM32_SVD.Byte;
      --  priority for interrupt 2
      PRI_2 : STM32_SVD.Byte;
      --  priority for interrupt 3
      PRI_3 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR0_Register use record
      PRI_0 at 0 range 0 .. 7;
      PRI_1 at 0 range 8 .. 15;
      PRI_2 at 0 range 16 .. 23;
      PRI_3 at 0 range 24 .. 31;
   end record;

   --  Interrupt Priority Register 1
   type IPR1_Register is record
      --  priority for interrupt n
      PRI_4 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_5 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_6 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_7 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR1_Register use record
      PRI_4 at 0 range 0 .. 7;
      PRI_5 at 0 range 8 .. 15;
      PRI_6 at 0 range 16 .. 23;
      PRI_7 at 0 range 24 .. 31;
   end record;

   --  Interrupt Priority Register 2
   type IPR2_Register is record
      --  priority for interrupt n
      PRI_8  : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_9  : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_10 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_11 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR2_Register use record
      PRI_8  at 0 range 0 .. 7;
      PRI_9  at 0 range 8 .. 15;
      PRI_10 at 0 range 16 .. 23;
      PRI_11 at 0 range 24 .. 31;
   end record;

   --  Interrupt Priority Register 3
   type IPR3_Register is record
      --  priority for interrupt n
      PRI_12 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_13 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_14 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_15 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR3_Register use record
      PRI_12 at 0 range 0 .. 7;
      PRI_13 at 0 range 8 .. 15;
      PRI_14 at 0 range 16 .. 23;
      PRI_15 at 0 range 24 .. 31;
   end record;

   --  Interrupt Priority Register 4
   type IPR4_Register is record
      --  priority for interrupt n
      PRI_16 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_17 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_18 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_19 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR4_Register use record
      PRI_16 at 0 range 0 .. 7;
      PRI_17 at 0 range 8 .. 15;
      PRI_18 at 0 range 16 .. 23;
      PRI_19 at 0 range 24 .. 31;
   end record;

   --  Interrupt Priority Register 5
   type IPR5_Register is record
      --  priority for interrupt n
      PRI_20 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_21 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_22 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_23 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR5_Register use record
      PRI_20 at 0 range 0 .. 7;
      PRI_21 at 0 range 8 .. 15;
      PRI_22 at 0 range 16 .. 23;
      PRI_23 at 0 range 24 .. 31;
   end record;

   --  Interrupt Priority Register 6
   type IPR6_Register is record
      --  priority for interrupt n
      PRI_24 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_25 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_26 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_27 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR6_Register use record
      PRI_24 at 0 range 0 .. 7;
      PRI_25 at 0 range 8 .. 15;
      PRI_26 at 0 range 16 .. 23;
      PRI_27 at 0 range 24 .. 31;
   end record;

   --  Interrupt Priority Register 7
   type IPR7_Register is record
      --  priority for interrupt n
      PRI_28 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_29 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_30 : STM32_SVD.Byte;
      --  priority for interrupt n
      PRI_31 : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR7_Register use record
      PRI_28 at 0 range 0 .. 7;
      PRI_29 at 0 range 8 .. 15;
      PRI_30 at 0 range 16 .. 23;
      PRI_31 at 0 range 24 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Nested Vectored Interrupt Controller
   type NVIC_Peripheral is record
      --  Interrupt Set Enable Register
      ISER : aliased STM32_SVD.UInt32;
      --  Interrupt Clear Enable Register
      ICER : aliased STM32_SVD.UInt32;
      --  Interrupt Set-Pending Register
      ISPR : aliased STM32_SVD.UInt32;
      --  Interrupt Clear-Pending Register
      ICPR : aliased STM32_SVD.UInt32;
      --  Interrupt Priority Register 0
      IPR0 : aliased IPR0_Register;
      --  Interrupt Priority Register 1
      IPR1 : aliased IPR1_Register;
      --  Interrupt Priority Register 2
      IPR2 : aliased IPR2_Register;
      --  Interrupt Priority Register 3
      IPR3 : aliased IPR3_Register;
      --  Interrupt Priority Register 4
      IPR4 : aliased IPR4_Register;
      --  Interrupt Priority Register 5
      IPR5 : aliased IPR5_Register;
      --  Interrupt Priority Register 6
      IPR6 : aliased IPR6_Register;
      --  Interrupt Priority Register 7
      IPR7 : aliased IPR7_Register;
   end record
     with Volatile;

   for NVIC_Peripheral use record
      ISER at 16#0# range 0 .. 31;
      ICER at 16#80# range 0 .. 31;
      ISPR at 16#100# range 0 .. 31;
      ICPR at 16#180# range 0 .. 31;
      IPR0 at 16#300# range 0 .. 31;
      IPR1 at 16#304# range 0 .. 31;
      IPR2 at 16#308# range 0 .. 31;
      IPR3 at 16#30C# range 0 .. 31;
      IPR4 at 16#310# range 0 .. 31;
      IPR5 at 16#314# range 0 .. 31;
      IPR6 at 16#318# range 0 .. 31;
      IPR7 at 16#31C# range 0 .. 31;
   end record;

   --  Nested Vectored Interrupt Controller
   NVIC_Periph : aliased NVIC_Peripheral
     with Import, Address => NVIC_Base;

end STM32_SVD.NVIC;
