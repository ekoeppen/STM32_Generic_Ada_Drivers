--  This spec has been automatically generated from STM32F0xx.svd

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
   subtype IDCODE_DIV_ID_Field is STM32_SVD.UInt4;
   subtype IDCODE_REV_ID_Field is STM32_SVD.UInt16;

   --  MCU Device ID Code Register
   type IDCODE_Register is record
      --  Read-only. Device Identifier
      DEV_ID : IDCODE_DEV_ID_Field;
      --  Read-only. Division Identifier
      DIV_ID : IDCODE_DIV_ID_Field;
      --  Read-only. Revision Identifier
      REV_ID : IDCODE_REV_ID_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDCODE_Register use record
      DEV_ID at 0 range 0 .. 11;
      DIV_ID at 0 range 12 .. 15;
      REV_ID at 0 range 16 .. 31;
   end record;

   subtype CR_DBG_STOP_Field is STM32_SVD.Bit;
   subtype CR_DBG_STANDBY_Field is STM32_SVD.Bit;

   --  Debug MCU Configuration Register
   type CR_Register is record
      --  unspecified
      Reserved_0_0  : STM32_SVD.Bit := 16#0#;
      --  Debug Stop Mode
      DBG_STOP      : CR_DBG_STOP_Field := 16#0#;
      --  Debug Standby Mode
      DBG_STANDBY   : CR_DBG_STANDBY_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : STM32_SVD.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      DBG_STOP      at 0 range 1 .. 1;
      DBG_STANDBY   at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype APBLFZ_DBG_TIMER2_STOP_Field is STM32_SVD.Bit;
   subtype APBLFZ_DBG_TIMER3_STOP_Field is STM32_SVD.Bit;
   subtype APBLFZ_DBG_TIMER6_STOP_Field is STM32_SVD.Bit;
   subtype APBLFZ_DBG_TIMER14_STOP_Field is STM32_SVD.Bit;
   subtype APBLFZ_DBG_RTC_STOP_Field is STM32_SVD.Bit;
   subtype APBLFZ_DBG_WWDG_STOP_Field is STM32_SVD.Bit;
   subtype APBLFZ_DBG_IWDG_STOP_Field is STM32_SVD.Bit;
   subtype APBLFZ_I2C1_SMBUS_TIMEOUT_Field is STM32_SVD.Bit;

   --  APB Low Freeze Register
   type APBLFZ_Register is record
      --  Debug Timer 2 stopped when Core is halted
      DBG_TIMER2_STOP    : APBLFZ_DBG_TIMER2_STOP_Field := 16#0#;
      --  Debug Timer 3 stopped when Core is halted
      DBG_TIMER3_STOP    : APBLFZ_DBG_TIMER3_STOP_Field := 16#0#;
      --  unspecified
      Reserved_2_3       : STM32_SVD.UInt2 := 16#0#;
      --  Debug Timer 6 stopped when Core is halted
      DBG_TIMER6_STOP    : APBLFZ_DBG_TIMER6_STOP_Field := 16#0#;
      --  unspecified
      Reserved_5_7       : STM32_SVD.UInt3 := 16#0#;
      --  Debug Timer 14 stopped when Core is halted
      DBG_TIMER14_STOP   : APBLFZ_DBG_TIMER14_STOP_Field := 16#0#;
      --  unspecified
      Reserved_9_9       : STM32_SVD.Bit := 16#0#;
      --  Debug RTC stopped when Core is halted
      DBG_RTC_STOP       : APBLFZ_DBG_RTC_STOP_Field := 16#0#;
      --  Debug Window Wachdog stopped when Core is halted
      DBG_WWDG_STOP      : APBLFZ_DBG_WWDG_STOP_Field := 16#0#;
      --  Debug Independent Wachdog stopped when Core is halted
      DBG_IWDG_STOP      : APBLFZ_DBG_IWDG_STOP_Field := 16#0#;
      --  unspecified
      Reserved_13_20     : STM32_SVD.Byte := 16#0#;
      --  SMBUS timeout mode stopped when Core is halted
      I2C1_SMBUS_TIMEOUT : APBLFZ_I2C1_SMBUS_TIMEOUT_Field := 16#0#;
      --  unspecified
      Reserved_22_31     : STM32_SVD.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APBLFZ_Register use record
      DBG_TIMER2_STOP    at 0 range 0 .. 0;
      DBG_TIMER3_STOP    at 0 range 1 .. 1;
      Reserved_2_3       at 0 range 2 .. 3;
      DBG_TIMER6_STOP    at 0 range 4 .. 4;
      Reserved_5_7       at 0 range 5 .. 7;
      DBG_TIMER14_STOP   at 0 range 8 .. 8;
      Reserved_9_9       at 0 range 9 .. 9;
      DBG_RTC_STOP       at 0 range 10 .. 10;
      DBG_WWDG_STOP      at 0 range 11 .. 11;
      DBG_IWDG_STOP      at 0 range 12 .. 12;
      Reserved_13_20     at 0 range 13 .. 20;
      I2C1_SMBUS_TIMEOUT at 0 range 21 .. 21;
      Reserved_22_31     at 0 range 22 .. 31;
   end record;

   subtype APBHFZ_DBG_TIMER1_STOP_Field is STM32_SVD.Bit;
   subtype APBHFZ_DBG_TIMER15_STO_Field is STM32_SVD.Bit;
   subtype APBHFZ_DBG_TIMER16_STO_Field is STM32_SVD.Bit;
   subtype APBHFZ_DBG_TIMER17_STO_Field is STM32_SVD.Bit;

   --  APB High Freeze Register
   type APBHFZ_Register is record
      --  unspecified
      Reserved_0_10   : STM32_SVD.UInt11 := 16#0#;
      --  Debug Timer 1 stopped when Core is halted
      DBG_TIMER1_STOP : APBHFZ_DBG_TIMER1_STOP_Field := 16#0#;
      --  unspecified
      Reserved_12_15  : STM32_SVD.UInt4 := 16#0#;
      --  Debug Timer 15 stopped when Core is halted
      DBG_TIMER15_STO : APBHFZ_DBG_TIMER15_STO_Field := 16#0#;
      --  Debug Timer 16 stopped when Core is halted
      DBG_TIMER16_STO : APBHFZ_DBG_TIMER16_STO_Field := 16#0#;
      --  Debug Timer 17 stopped when Core is halted
      DBG_TIMER17_STO : APBHFZ_DBG_TIMER17_STO_Field := 16#0#;
      --  unspecified
      Reserved_19_31  : STM32_SVD.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APBHFZ_Register use record
      Reserved_0_10   at 0 range 0 .. 10;
      DBG_TIMER1_STOP at 0 range 11 .. 11;
      Reserved_12_15  at 0 range 12 .. 15;
      DBG_TIMER15_STO at 0 range 16 .. 16;
      DBG_TIMER16_STO at 0 range 17 .. 17;
      DBG_TIMER17_STO at 0 range 18 .. 18;
      Reserved_19_31  at 0 range 19 .. 31;
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
      APBLFZ : aliased APBLFZ_Register;
      --  APB High Freeze Register
      APBHFZ : aliased APBHFZ_Register;
   end record
     with Volatile;

   for DBGMCU_Peripheral use record
      IDCODE at 16#0# range 0 .. 31;
      CR     at 16#4# range 0 .. 31;
      APBLFZ at 16#8# range 0 .. 31;
      APBHFZ at 16#C# range 0 .. 31;
   end record;

   --  Debug support
   DBGMCU_Periph : aliased DBGMCU_Peripheral
     with Import, Address => System'To_Address (16#40015800#);

end STM32_SVD.DBGMCU;
