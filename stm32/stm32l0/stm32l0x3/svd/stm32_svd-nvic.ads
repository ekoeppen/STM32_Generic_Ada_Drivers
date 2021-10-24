pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x3.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.NVIC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype IPR0_PRI_0_Field is STM32_SVD.Byte;
   subtype IPR0_PRI_1_Field is STM32_SVD.Byte;
   subtype IPR0_PRI_2_Field is STM32_SVD.Byte;
   subtype IPR0_PRI_3_Field is STM32_SVD.Byte;

   --  Interrupt Priority Register 0
   type IPR0_Register is record
      --  priority for interrupt 0
      PRI_0 : IPR0_PRI_0_Field := 16#0#;
      --  priority for interrupt 1
      PRI_1 : IPR0_PRI_1_Field := 16#0#;
      --  priority for interrupt 2
      PRI_2 : IPR0_PRI_2_Field := 16#0#;
      --  priority for interrupt 3
      PRI_3 : IPR0_PRI_3_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR0_Register use record
      PRI_0 at 0 range 0 .. 7;
      PRI_1 at 0 range 8 .. 15;
      PRI_2 at 0 range 16 .. 23;
      PRI_3 at 0 range 24 .. 31;
   end record;

   subtype IPR1_PRI_4_Field is STM32_SVD.Byte;
   subtype IPR1_PRI_5_Field is STM32_SVD.Byte;
   subtype IPR1_PRI_6_Field is STM32_SVD.Byte;
   subtype IPR1_PRI_7_Field is STM32_SVD.Byte;

   --  Interrupt Priority Register 1
   type IPR1_Register is record
      --  priority for interrupt n
      PRI_4 : IPR1_PRI_4_Field := 16#0#;
      --  priority for interrupt n
      PRI_5 : IPR1_PRI_5_Field := 16#0#;
      --  priority for interrupt n
      PRI_6 : IPR1_PRI_6_Field := 16#0#;
      --  priority for interrupt n
      PRI_7 : IPR1_PRI_7_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR1_Register use record
      PRI_4 at 0 range 0 .. 7;
      PRI_5 at 0 range 8 .. 15;
      PRI_6 at 0 range 16 .. 23;
      PRI_7 at 0 range 24 .. 31;
   end record;

   subtype IPR2_PRI_8_Field is STM32_SVD.Byte;
   subtype IPR2_PRI_9_Field is STM32_SVD.Byte;
   subtype IPR2_PRI_10_Field is STM32_SVD.Byte;
   subtype IPR2_PRI_11_Field is STM32_SVD.Byte;

   --  Interrupt Priority Register 2
   type IPR2_Register is record
      --  priority for interrupt n
      PRI_8  : IPR2_PRI_8_Field := 16#0#;
      --  priority for interrupt n
      PRI_9  : IPR2_PRI_9_Field := 16#0#;
      --  priority for interrupt n
      PRI_10 : IPR2_PRI_10_Field := 16#0#;
      --  priority for interrupt n
      PRI_11 : IPR2_PRI_11_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR2_Register use record
      PRI_8  at 0 range 0 .. 7;
      PRI_9  at 0 range 8 .. 15;
      PRI_10 at 0 range 16 .. 23;
      PRI_11 at 0 range 24 .. 31;
   end record;

   subtype IPR3_PRI_12_Field is STM32_SVD.Byte;
   subtype IPR3_PRI_13_Field is STM32_SVD.Byte;
   subtype IPR3_PRI_14_Field is STM32_SVD.Byte;
   subtype IPR3_PRI_15_Field is STM32_SVD.Byte;

   --  Interrupt Priority Register 3
   type IPR3_Register is record
      --  priority for interrupt n
      PRI_12 : IPR3_PRI_12_Field := 16#0#;
      --  priority for interrupt n
      PRI_13 : IPR3_PRI_13_Field := 16#0#;
      --  priority for interrupt n
      PRI_14 : IPR3_PRI_14_Field := 16#0#;
      --  priority for interrupt n
      PRI_15 : IPR3_PRI_15_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR3_Register use record
      PRI_12 at 0 range 0 .. 7;
      PRI_13 at 0 range 8 .. 15;
      PRI_14 at 0 range 16 .. 23;
      PRI_15 at 0 range 24 .. 31;
   end record;

   subtype IPR4_PRI_16_Field is STM32_SVD.Byte;
   subtype IPR4_PRI_17_Field is STM32_SVD.Byte;
   subtype IPR4_PRI_18_Field is STM32_SVD.Byte;
   subtype IPR4_PRI_19_Field is STM32_SVD.Byte;

   --  Interrupt Priority Register 4
   type IPR4_Register is record
      --  priority for interrupt n
      PRI_16 : IPR4_PRI_16_Field := 16#0#;
      --  priority for interrupt n
      PRI_17 : IPR4_PRI_17_Field := 16#0#;
      --  priority for interrupt n
      PRI_18 : IPR4_PRI_18_Field := 16#0#;
      --  priority for interrupt n
      PRI_19 : IPR4_PRI_19_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR4_Register use record
      PRI_16 at 0 range 0 .. 7;
      PRI_17 at 0 range 8 .. 15;
      PRI_18 at 0 range 16 .. 23;
      PRI_19 at 0 range 24 .. 31;
   end record;

   subtype IPR5_PRI_20_Field is STM32_SVD.Byte;
   subtype IPR5_PRI_21_Field is STM32_SVD.Byte;
   subtype IPR5_PRI_22_Field is STM32_SVD.Byte;
   subtype IPR5_PRI_23_Field is STM32_SVD.Byte;

   --  Interrupt Priority Register 5
   type IPR5_Register is record
      --  priority for interrupt n
      PRI_20 : IPR5_PRI_20_Field := 16#0#;
      --  priority for interrupt n
      PRI_21 : IPR5_PRI_21_Field := 16#0#;
      --  priority for interrupt n
      PRI_22 : IPR5_PRI_22_Field := 16#0#;
      --  priority for interrupt n
      PRI_23 : IPR5_PRI_23_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR5_Register use record
      PRI_20 at 0 range 0 .. 7;
      PRI_21 at 0 range 8 .. 15;
      PRI_22 at 0 range 16 .. 23;
      PRI_23 at 0 range 24 .. 31;
   end record;

   subtype IPR6_PRI_24_Field is STM32_SVD.Byte;
   subtype IPR6_PRI_25_Field is STM32_SVD.Byte;
   subtype IPR6_PRI_26_Field is STM32_SVD.Byte;
   subtype IPR6_PRI_27_Field is STM32_SVD.Byte;

   --  Interrupt Priority Register 6
   type IPR6_Register is record
      --  priority for interrupt n
      PRI_24 : IPR6_PRI_24_Field := 16#0#;
      --  priority for interrupt n
      PRI_25 : IPR6_PRI_25_Field := 16#0#;
      --  priority for interrupt n
      PRI_26 : IPR6_PRI_26_Field := 16#0#;
      --  priority for interrupt n
      PRI_27 : IPR6_PRI_27_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR6_Register use record
      PRI_24 at 0 range 0 .. 7;
      PRI_25 at 0 range 8 .. 15;
      PRI_26 at 0 range 16 .. 23;
      PRI_27 at 0 range 24 .. 31;
   end record;

   subtype IPR7_PRI_28_Field is STM32_SVD.Byte;
   subtype IPR7_PRI_29_Field is STM32_SVD.Byte;
   subtype IPR7_PRI_30_Field is STM32_SVD.Byte;
   subtype IPR7_PRI_31_Field is STM32_SVD.Byte;

   --  Interrupt Priority Register 7
   type IPR7_Register is record
      --  priority for interrupt n
      PRI_28 : IPR7_PRI_28_Field := 16#0#;
      --  priority for interrupt n
      PRI_29 : IPR7_PRI_29_Field := 16#0#;
      --  priority for interrupt n
      PRI_30 : IPR7_PRI_30_Field := 16#0#;
      --  priority for interrupt n
      PRI_31 : IPR7_PRI_31_Field := 16#0#;
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
