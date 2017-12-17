--  This spec has been automatically generated from STM32F303xE.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.DBGMCU is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype IDCODE_DEV_ID_Field is STM32_SVD.UInt12;
   subtype IDCODE_REV_ID_Field is STM32_SVD.UInt16;

   --  MCU Device ID Code Register
   type IDCODE_Register is record
      --  Read-only. Device Identifier
      DEV_ID         : IDCODE_DEV_ID_Field;
      --  unspecified
      Reserved_12_15 : STM32_SVD.UInt4;
      --  Read-only. Revision Identifier
      REV_ID         : IDCODE_REV_ID_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDCODE_Register use record
      DEV_ID         at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      REV_ID         at 0 range 16 .. 31;
   end record;

   subtype CR_DBG_SLEEP_Field is STM32_SVD.Bit;
   subtype CR_DBG_STOP_Field is STM32_SVD.Bit;
   subtype CR_DBG_STANDBY_Field is STM32_SVD.Bit;
   subtype CR_TRACE_IOEN_Field is STM32_SVD.Bit;
   subtype CR_TRACE_MODE_Field is STM32_SVD.UInt2;

   --  Debug MCU Configuration Register
   type CR_Register is record
      --  Debug Sleep mode
      DBG_SLEEP     : CR_DBG_SLEEP_Field := 16#0#;
      --  Debug Stop Mode
      DBG_STOP      : CR_DBG_STOP_Field := 16#0#;
      --  Debug Standby Mode
      DBG_STANDBY   : CR_DBG_STANDBY_Field := 16#0#;
      --  unspecified
      Reserved_3_4  : STM32_SVD.UInt2 := 16#0#;
      --  Trace pin assignment control
      TRACE_IOEN    : CR_TRACE_IOEN_Field := 16#0#;
      --  Trace pin assignment control
      TRACE_MODE    : CR_TRACE_MODE_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : STM32_SVD.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      DBG_SLEEP     at 0 range 0 .. 0;
      DBG_STOP      at 0 range 1 .. 1;
      DBG_STANDBY   at 0 range 2 .. 2;
      Reserved_3_4  at 0 range 3 .. 4;
      TRACE_IOEN    at 0 range 5 .. 5;
      TRACE_MODE    at 0 range 6 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype APB1FZ_DBG_TIM2_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_TIM3_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_TIM4_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_TIM5_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_TIM6_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_TIM7_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_TIM12_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_TIM13_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_TIMER14_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_TIM18_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_RTC_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_WWDG_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_IWDG_STOP_Field is STM32_SVD.Bit;
   subtype APB1FZ_I2C1_SMBUS_TIMEOUT_Field is STM32_SVD.Bit;
   subtype APB1FZ_I2C2_SMBUS_TIMEOUT_Field is STM32_SVD.Bit;
   subtype APB1FZ_DBG_CAN_STOP_Field is STM32_SVD.Bit;

   --  APB Low Freeze Register
   type APB1FZ_Register is record
      --  Debug Timer 2 stopped when Core is halted
      DBG_TIM2_STOP      : APB1FZ_DBG_TIM2_STOP_Field := 16#0#;
      --  Debug Timer 3 stopped when Core is halted
      DBG_TIM3_STOP      : APB1FZ_DBG_TIM3_STOP_Field := 16#0#;
      --  Debug Timer 4 stopped when Core is halted
      DBG_TIM4_STOP      : APB1FZ_DBG_TIM4_STOP_Field := 16#0#;
      --  Debug Timer 5 stopped when Core is halted
      DBG_TIM5_STOP      : APB1FZ_DBG_TIM5_STOP_Field := 16#0#;
      --  Debug Timer 6 stopped when Core is halted
      DBG_TIM6_STOP      : APB1FZ_DBG_TIM6_STOP_Field := 16#0#;
      --  Debug Timer 7 stopped when Core is halted
      DBG_TIM7_STOP      : APB1FZ_DBG_TIM7_STOP_Field := 16#0#;
      --  Debug Timer 12 stopped when Core is halted
      DBG_TIM12_STOP     : APB1FZ_DBG_TIM12_STOP_Field := 16#0#;
      --  Debug Timer 13 stopped when Core is halted
      DBG_TIM13_STOP     : APB1FZ_DBG_TIM13_STOP_Field := 16#0#;
      --  Debug Timer 14 stopped when Core is halted
      DBG_TIMER14_STOP   : APB1FZ_DBG_TIMER14_STOP_Field := 16#0#;
      --  Debug Timer 18 stopped when Core is halted
      DBG_TIM18_STOP     : APB1FZ_DBG_TIM18_STOP_Field := 16#0#;
      --  Debug RTC stopped when Core is halted
      DBG_RTC_STOP       : APB1FZ_DBG_RTC_STOP_Field := 16#0#;
      --  Debug Window Wachdog stopped when Core is halted
      DBG_WWDG_STOP      : APB1FZ_DBG_WWDG_STOP_Field := 16#0#;
      --  Debug Independent Wachdog stopped when Core is halted
      DBG_IWDG_STOP      : APB1FZ_DBG_IWDG_STOP_Field := 16#0#;
      --  unspecified
      Reserved_13_20     : STM32_SVD.Byte := 16#0#;
      --  SMBUS timeout mode stopped when Core is halted
      I2C1_SMBUS_TIMEOUT : APB1FZ_I2C1_SMBUS_TIMEOUT_Field := 16#0#;
      --  SMBUS timeout mode stopped when Core is halted
      I2C2_SMBUS_TIMEOUT : APB1FZ_I2C2_SMBUS_TIMEOUT_Field := 16#0#;
      --  unspecified
      Reserved_23_24     : STM32_SVD.UInt2 := 16#0#;
      --  Debug CAN stopped when core is halted
      DBG_CAN_STOP       : APB1FZ_DBG_CAN_STOP_Field := 16#0#;
      --  unspecified
      Reserved_26_31     : STM32_SVD.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1FZ_Register use record
      DBG_TIM2_STOP      at 0 range 0 .. 0;
      DBG_TIM3_STOP      at 0 range 1 .. 1;
      DBG_TIM4_STOP      at 0 range 2 .. 2;
      DBG_TIM5_STOP      at 0 range 3 .. 3;
      DBG_TIM6_STOP      at 0 range 4 .. 4;
      DBG_TIM7_STOP      at 0 range 5 .. 5;
      DBG_TIM12_STOP     at 0 range 6 .. 6;
      DBG_TIM13_STOP     at 0 range 7 .. 7;
      DBG_TIMER14_STOP   at 0 range 8 .. 8;
      DBG_TIM18_STOP     at 0 range 9 .. 9;
      DBG_RTC_STOP       at 0 range 10 .. 10;
      DBG_WWDG_STOP      at 0 range 11 .. 11;
      DBG_IWDG_STOP      at 0 range 12 .. 12;
      Reserved_13_20     at 0 range 13 .. 20;
      I2C1_SMBUS_TIMEOUT at 0 range 21 .. 21;
      I2C2_SMBUS_TIMEOUT at 0 range 22 .. 22;
      Reserved_23_24     at 0 range 23 .. 24;
      DBG_CAN_STOP       at 0 range 25 .. 25;
      Reserved_26_31     at 0 range 26 .. 31;
   end record;

   subtype APB2FZ_DBG_TIM15_STOP_Field is STM32_SVD.Bit;
   subtype APB2FZ_DBG_TIM16_STOP_Field is STM32_SVD.Bit;
   subtype APB2FZ_DBG_TIM17_STO_Field is STM32_SVD.Bit;
   subtype APB2FZ_DBG_TIM19_STOP_Field is STM32_SVD.Bit;

   --  APB High Freeze Register
   type APB2FZ_Register is record
      --  unspecified
      Reserved_0_1   : STM32_SVD.UInt2 := 16#0#;
      --  Debug Timer 15 stopped when Core is halted
      DBG_TIM15_STOP : APB2FZ_DBG_TIM15_STOP_Field := 16#0#;
      --  Debug Timer 16 stopped when Core is halted
      DBG_TIM16_STOP : APB2FZ_DBG_TIM16_STOP_Field := 16#0#;
      --  Debug Timer 17 stopped when Core is halted
      DBG_TIM17_STO  : APB2FZ_DBG_TIM17_STO_Field := 16#0#;
      --  Debug Timer 19 stopped when Core is halted
      DBG_TIM19_STOP : APB2FZ_DBG_TIM19_STOP_Field := 16#0#;
      --  unspecified
      Reserved_6_31  : STM32_SVD.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2FZ_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      DBG_TIM15_STOP at 0 range 2 .. 2;
      DBG_TIM16_STOP at 0 range 3 .. 3;
      DBG_TIM17_STO  at 0 range 4 .. 4;
      DBG_TIM19_STOP at 0 range 5 .. 5;
      Reserved_6_31  at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Debug support
   type DBGMCU_Peripheral is record
      --  MCU Device ID Code Register
      IDCODE : aliased IDCODE_Register;
      --  Debug MCU Configuration Register
      CR     : aliased CR_Register;
      --  APB Low Freeze Register
      APB1FZ : aliased APB1FZ_Register;
      --  APB High Freeze Register
      APB2FZ : aliased APB2FZ_Register;
   end record
     with Volatile;

   for DBGMCU_Peripheral use record
      IDCODE at 16#0# range 0 .. 31;
      CR     at 16#4# range 0 .. 31;
      APB1FZ at 16#8# range 0 .. 31;
      APB2FZ at 16#C# range 0 .. 31;
   end record;

   --  Debug support
   DBGMCU_Periph : aliased DBGMCU_Peripheral
     with Import, Address => System'To_Address (16#E0042000#);

end STM32_SVD.DBGMCU;
