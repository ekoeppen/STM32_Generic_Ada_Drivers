pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);

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
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDCODE_Register use record
      DEV_ID         at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      REV_ID         at 0 range 16 .. 31;
   end record;

   subtype CR_DBG_SLEEP_Field is STM32_SVD.Bit;
   subtype CR_DBG_STOP_Field is STM32_SVD.Bit;
   subtype CR_DBG_STANDBY_Field is STM32_SVD.Bit;

   --  Debug MCU Configuration Register
   type CR_Register is record
      --  Debug Sleep Mode
      DBG_SLEEP     : CR_DBG_SLEEP_Field := 16#0#;
      --  Debug Stop Mode
      DBG_STOP      : CR_DBG_STOP_Field := 16#0#;
      --  Debug Standby Mode
      DBG_STANDBY   : CR_DBG_STANDBY_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : STM32_SVD.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      DBG_SLEEP     at 0 range 0 .. 0;
      DBG_STOP      at 0 range 1 .. 1;
      DBG_STANDBY   at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype APB1_FZ_DBG_TIMER2_STOP_Field is STM32_SVD.Bit;
   subtype APB1_FZ_DBG_TIMER6_STOP_Field is STM32_SVD.Bit;
   subtype APB1_FZ_DBG_RTC_STOP_Field is STM32_SVD.Bit;
   subtype APB1_FZ_DBG_WWDG_STOP_Field is STM32_SVD.Bit;
   subtype APB1_FZ_DBG_IWDG_STOP_Field is STM32_SVD.Bit;
   subtype APB1_FZ_DBG_I2C1_STOP_Field is STM32_SVD.Bit;
   subtype APB1_FZ_DBG_I2C2_STOP_Field is STM32_SVD.Bit;
   subtype APB1_FZ_DBG_LPTIMER_STOP_Field is STM32_SVD.Bit;

   --  APB Low Freeze Register
   type APB1_FZ_Register is record
      --  Debug Timer 2 stopped when Core is halted
      DBG_TIMER2_STOP  : APB1_FZ_DBG_TIMER2_STOP_Field := 16#0#;
      --  unspecified
      Reserved_1_3     : STM32_SVD.UInt3 := 16#0#;
      --  Debug Timer 6 stopped when Core is halted
      DBG_TIMER6_STOP  : APB1_FZ_DBG_TIMER6_STOP_Field := 16#0#;
      --  unspecified
      Reserved_5_9     : STM32_SVD.UInt5 := 16#0#;
      --  Debug RTC stopped when Core is halted
      DBG_RTC_STOP     : APB1_FZ_DBG_RTC_STOP_Field := 16#0#;
      --  Debug Window Wachdog stopped when Core is halted
      DBG_WWDG_STOP    : APB1_FZ_DBG_WWDG_STOP_Field := 16#0#;
      --  Debug Independent Wachdog stopped when Core is halted
      DBG_IWDG_STOP    : APB1_FZ_DBG_IWDG_STOP_Field := 16#0#;
      --  unspecified
      Reserved_13_20   : STM32_SVD.Byte := 16#0#;
      --  I2C1 SMBUS timeout mode stopped when core is halted
      DBG_I2C1_STOP    : APB1_FZ_DBG_I2C1_STOP_Field := 16#0#;
      --  I2C2 SMBUS timeout mode stopped when core is halted
      DBG_I2C2_STOP    : APB1_FZ_DBG_I2C2_STOP_Field := 16#0#;
      --  unspecified
      Reserved_23_30   : STM32_SVD.Byte := 16#0#;
      --  LPTIM1 counter stopped when core is halted
      DBG_LPTIMER_STOP : APB1_FZ_DBG_LPTIMER_STOP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1_FZ_Register use record
      DBG_TIMER2_STOP  at 0 range 0 .. 0;
      Reserved_1_3     at 0 range 1 .. 3;
      DBG_TIMER6_STOP  at 0 range 4 .. 4;
      Reserved_5_9     at 0 range 5 .. 9;
      DBG_RTC_STOP     at 0 range 10 .. 10;
      DBG_WWDG_STOP    at 0 range 11 .. 11;
      DBG_IWDG_STOP    at 0 range 12 .. 12;
      Reserved_13_20   at 0 range 13 .. 20;
      DBG_I2C1_STOP    at 0 range 21 .. 21;
      DBG_I2C2_STOP    at 0 range 22 .. 22;
      Reserved_23_30   at 0 range 23 .. 30;
      DBG_LPTIMER_STOP at 0 range 31 .. 31;
   end record;

   subtype APB2_FZ_DBG_TIMER21_STOP_Field is STM32_SVD.Bit;
   subtype APB2_FZ_DBG_TIMER22_STO_Field is STM32_SVD.Bit;

   --  APB High Freeze Register
   type APB2_FZ_Register is record
      --  unspecified
      Reserved_0_1     : STM32_SVD.UInt2 := 16#0#;
      --  Debug Timer 21 stopped when Core is halted
      DBG_TIMER21_STOP : APB2_FZ_DBG_TIMER21_STOP_Field := 16#0#;
      --  unspecified
      Reserved_3_5     : STM32_SVD.UInt3 := 16#0#;
      --  Debug Timer 22 stopped when Core is halted
      DBG_TIMER22_STO  : APB2_FZ_DBG_TIMER22_STO_Field := 16#0#;
      --  unspecified
      Reserved_7_31    : STM32_SVD.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2_FZ_Register use record
      Reserved_0_1     at 0 range 0 .. 1;
      DBG_TIMER21_STOP at 0 range 2 .. 2;
      Reserved_3_5     at 0 range 3 .. 5;
      DBG_TIMER22_STO  at 0 range 6 .. 6;
      Reserved_7_31    at 0 range 7 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Debug support
   type DBG_Peripheral is record
      --  MCU Device ID Code Register
      IDCODE  : aliased IDCODE_Register;
      --  Debug MCU Configuration Register
      CR      : aliased CR_Register;
      --  APB Low Freeze Register
      APB1_FZ : aliased APB1_FZ_Register;
      --  APB High Freeze Register
      APB2_FZ : aliased APB2_FZ_Register;
   end record
     with Volatile;

   for DBG_Peripheral use record
      IDCODE  at 16#0# range 0 .. 31;
      CR      at 16#4# range 0 .. 31;
      APB1_FZ at 16#8# range 0 .. 31;
      APB2_FZ at 16#C# range 0 .. 31;
   end record;

   --  Debug support
   DBG_Periph : aliased DBG_Peripheral
     with Import, Address => DBG_Base;

end STM32_SVD.DBGMCU;
