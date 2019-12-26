--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.IWDG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  Key register
   type KR_Register is record
      --  Write-only. Key value (write only, read 0x0000)
      KEY            : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for KR_Register use record
      KEY            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Prescaler register
   type PR_Register is record
      --  Prescaler divider
      PR            : STM32_SVD.UInt3;
      --  unspecified
      Reserved_3_31 : STM32_SVD.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PR_Register use record
      PR            at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Reload register
   type RLR_Register is record
      --  Watchdog counter reload value
      RL             : STM32_SVD.UInt12;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RLR_Register use record
      RL             at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  Status register
   type SR_Register is record
      --  Read-only. Watchdog prescaler value update
      PVU           : STM32_SVD.Bit;
      --  Read-only. Watchdog counter reload value update
      RVU           : STM32_SVD.Bit;
      --  Read-only. Watchdog counter window value update
      WVU           : STM32_SVD.Bit;
      --  unspecified
      Reserved_3_31 : STM32_SVD.UInt29;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      PVU           at 0 range 0 .. 0;
      RVU           at 0 range 1 .. 1;
      WVU           at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   --  Window register
   type WINR_Register is record
      --  Watchdog counter window value
      WIN            : STM32_SVD.UInt12;
      --  unspecified
      Reserved_12_31 : STM32_SVD.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WINR_Register use record
      WIN            at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Independent watchdog
   type IWDG_Peripheral is record
      --  Key register
      KR   : aliased KR_Register;
      --  Prescaler register
      PR   : aliased PR_Register;
      --  Reload register
      RLR  : aliased RLR_Register;
      --  Status register
      SR   : aliased SR_Register;
      --  Window register
      WINR : aliased WINR_Register;
   end record
     with Volatile;

   for IWDG_Peripheral use record
      KR   at 16#0# range 0 .. 31;
      PR   at 16#4# range 0 .. 31;
      RLR  at 16#8# range 0 .. 31;
      SR   at 16#C# range 0 .. 31;
      WINR at 16#10# range 0 .. 31;
   end record;

   --  Independent watchdog
   IWDG_Periph : aliased IWDG_Peripheral
     with Import, Address => IWDG_Base;

end STM32_SVD.IWDG;
