--  This spec has been automatically generated from STM32F072x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.NVIC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype IPR0_PRI_00_Field is STM32_SVD.UInt2;
   subtype IPR0_PRI_01_Field is STM32_SVD.UInt2;
   subtype IPR0_PRI_02_Field is STM32_SVD.UInt2;
   subtype IPR0_PRI_03_Field is STM32_SVD.UInt2;

   --  Interrupt Priority Register 0
   type IPR0_Register is record
      --  unspecified
      Reserved_0_5   : STM32_SVD.UInt6 := 16#0#;
      --  PRI_00
      PRI_00         : IPR0_PRI_00_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : STM32_SVD.UInt6 := 16#0#;
      --  PRI_01
      PRI_01         : IPR0_PRI_01_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_02
      PRI_02         : IPR0_PRI_02_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_03
      PRI_03         : IPR0_PRI_03_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR0_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      PRI_00         at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      PRI_01         at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      PRI_02         at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      PRI_03         at 0 range 30 .. 31;
   end record;

   subtype IPR1_PRI_40_Field is STM32_SVD.UInt2;
   subtype IPR1_PRI_41_Field is STM32_SVD.UInt2;
   subtype IPR1_PRI_42_Field is STM32_SVD.UInt2;
   subtype IPR1_PRI_43_Field is STM32_SVD.UInt2;

   --  Interrupt Priority Register 1
   type IPR1_Register is record
      --  unspecified
      Reserved_0_5   : STM32_SVD.UInt6 := 16#0#;
      --  PRI_40
      PRI_40         : IPR1_PRI_40_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : STM32_SVD.UInt6 := 16#0#;
      --  PRI_41
      PRI_41         : IPR1_PRI_41_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_42
      PRI_42         : IPR1_PRI_42_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_43
      PRI_43         : IPR1_PRI_43_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR1_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      PRI_40         at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      PRI_41         at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      PRI_42         at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      PRI_43         at 0 range 30 .. 31;
   end record;

   subtype IPR2_PRI_80_Field is STM32_SVD.UInt2;
   subtype IPR2_PRI_81_Field is STM32_SVD.UInt2;
   subtype IPR2_PRI_82_Field is STM32_SVD.UInt2;
   subtype IPR2_PRI_83_Field is STM32_SVD.UInt2;

   --  Interrupt Priority Register 2
   type IPR2_Register is record
      --  unspecified
      Reserved_0_5   : STM32_SVD.UInt6 := 16#0#;
      --  PRI_80
      PRI_80         : IPR2_PRI_80_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : STM32_SVD.UInt6 := 16#0#;
      --  PRI_81
      PRI_81         : IPR2_PRI_81_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_82
      PRI_82         : IPR2_PRI_82_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_83
      PRI_83         : IPR2_PRI_83_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR2_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      PRI_80         at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      PRI_81         at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      PRI_82         at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      PRI_83         at 0 range 30 .. 31;
   end record;

   subtype IPR3_PRI_120_Field is STM32_SVD.UInt2;
   subtype IPR3_PRI_121_Field is STM32_SVD.UInt2;
   subtype IPR3_PRI_122_Field is STM32_SVD.UInt2;
   subtype IPR3_PRI_123_Field is STM32_SVD.UInt2;

   --  Interrupt Priority Register 3
   type IPR3_Register is record
      --  unspecified
      Reserved_0_5   : STM32_SVD.UInt6 := 16#0#;
      --  PRI_120
      PRI_120        : IPR3_PRI_120_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : STM32_SVD.UInt6 := 16#0#;
      --  PRI_121
      PRI_121        : IPR3_PRI_121_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_122
      PRI_122        : IPR3_PRI_122_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_123
      PRI_123        : IPR3_PRI_123_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR3_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      PRI_120        at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      PRI_121        at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      PRI_122        at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      PRI_123        at 0 range 30 .. 31;
   end record;

   subtype IPR4_PRI_160_Field is STM32_SVD.UInt2;
   subtype IPR4_PRI_161_Field is STM32_SVD.UInt2;
   subtype IPR4_PRI_162_Field is STM32_SVD.UInt2;
   subtype IPR4_PRI_163_Field is STM32_SVD.UInt2;

   --  Interrupt Priority Register 4
   type IPR4_Register is record
      --  unspecified
      Reserved_0_5   : STM32_SVD.UInt6 := 16#0#;
      --  PRI_160
      PRI_160        : IPR4_PRI_160_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : STM32_SVD.UInt6 := 16#0#;
      --  PRI_161
      PRI_161        : IPR4_PRI_161_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_162
      PRI_162        : IPR4_PRI_162_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_163
      PRI_163        : IPR4_PRI_163_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR4_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      PRI_160        at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      PRI_161        at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      PRI_162        at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      PRI_163        at 0 range 30 .. 31;
   end record;

   subtype IPR5_PRI_200_Field is STM32_SVD.UInt2;
   subtype IPR5_PRI_201_Field is STM32_SVD.UInt2;
   subtype IPR5_PRI_202_Field is STM32_SVD.UInt2;
   subtype IPR5_PRI_203_Field is STM32_SVD.UInt2;

   --  Interrupt Priority Register 5
   type IPR5_Register is record
      --  unspecified
      Reserved_0_5   : STM32_SVD.UInt6 := 16#0#;
      --  PRI_200
      PRI_200        : IPR5_PRI_200_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : STM32_SVD.UInt6 := 16#0#;
      --  PRI_201
      PRI_201        : IPR5_PRI_201_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_202
      PRI_202        : IPR5_PRI_202_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_203
      PRI_203        : IPR5_PRI_203_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR5_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      PRI_200        at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      PRI_201        at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      PRI_202        at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      PRI_203        at 0 range 30 .. 31;
   end record;

   subtype IPR6_PRI_240_Field is STM32_SVD.UInt2;
   subtype IPR6_PRI_241_Field is STM32_SVD.UInt2;
   subtype IPR6_PRI_242_Field is STM32_SVD.UInt2;
   subtype IPR6_PRI_243_Field is STM32_SVD.UInt2;

   --  Interrupt Priority Register 6
   type IPR6_Register is record
      --  unspecified
      Reserved_0_5   : STM32_SVD.UInt6 := 16#0#;
      --  PRI_240
      PRI_240        : IPR6_PRI_240_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : STM32_SVD.UInt6 := 16#0#;
      --  PRI_241
      PRI_241        : IPR6_PRI_241_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_242
      PRI_242        : IPR6_PRI_242_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_243
      PRI_243        : IPR6_PRI_243_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR6_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      PRI_240        at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      PRI_241        at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      PRI_242        at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      PRI_243        at 0 range 30 .. 31;
   end record;

   subtype IPR7_PRI_280_Field is STM32_SVD.UInt2;
   subtype IPR7_PRI_281_Field is STM32_SVD.UInt2;
   subtype IPR7_PRI_282_Field is STM32_SVD.UInt2;
   subtype IPR7_PRI_283_Field is STM32_SVD.UInt2;

   --  Interrupt Priority Register 7
   type IPR7_Register is record
      --  unspecified
      Reserved_0_5   : STM32_SVD.UInt6 := 16#0#;
      --  PRI_280
      PRI_280        : IPR7_PRI_280_Field := 16#0#;
      --  unspecified
      Reserved_8_13  : STM32_SVD.UInt6 := 16#0#;
      --  PRI_281
      PRI_281        : IPR7_PRI_281_Field := 16#0#;
      --  unspecified
      Reserved_16_21 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_282
      PRI_282        : IPR7_PRI_282_Field := 16#0#;
      --  unspecified
      Reserved_24_29 : STM32_SVD.UInt6 := 16#0#;
      --  PRI_283
      PRI_283        : IPR7_PRI_283_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR7_Register use record
      Reserved_0_5   at 0 range 0 .. 5;
      PRI_280        at 0 range 6 .. 7;
      Reserved_8_13  at 0 range 8 .. 13;
      PRI_281        at 0 range 14 .. 15;
      Reserved_16_21 at 0 range 16 .. 21;
      PRI_282        at 0 range 22 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      PRI_283        at 0 range 30 .. 31;
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
     with Import, Address => System'To_Address (16#E000E100#);

end STM32_SVD.NVIC;
