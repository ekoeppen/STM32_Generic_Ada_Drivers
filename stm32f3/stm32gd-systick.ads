pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;
with STM32_SVD; use STM32_SVD;

package STM32GD.SysTick is
   pragma Preelaborate;

   type SysTick_Callback_Type is access procedure;

   subtype CSR_ENABLE_Field is STM32_SVD.Bit;
   subtype CSR_TICKINT_Field is STM32_SVD.Bit;
   subtype CSR_CLKSOURCE_Field is STM32_SVD.Bit;
   subtype CSR_COUNTFLAG_Field is STM32_SVD.Bit;

   --  control and status register
   type CSR_Register is record
      --  Enable counter
      ENABLE                    : CSR_ENABLE_Field    := 16#0#;
      --  Enable tick interrupt
      TICKINT                   : CSR_CLKSOURCE_Field := 16#0#;
      --  Clock source
      CLKSOURCE                 : CSR_TICKINT_Field   := 16#0#;
      --  unspecified
      Reserved_3_15             : STM32_SVD.UInt13    := 16#0#;
      --  Counter wraparound
      COUNTFLAG                 : CSR_COUNTFLAG_Field := 16#0#;
      --  unspecified
      Reserved_17_31            : STM32_SVD.UInt15    := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      ENABLE         at 0 range 0 .. 0;
      TICKINT        at 0 range 1 .. 1;
      CLKSOURCE      at 0 range 2 .. 2;
      Reserved_3_15  at 0 range 3 .. 15;
      COUNTFLAG      at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype RVR_RELOAD_Field is STM32_SVD.UInt24;

   --  Reload value register
   type RVR_Register is record
      --  Reload value
      RELOAD             : RVR_RELOAD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RVR_Register use record
      RELOAD             at 0 range 0 .. 23;
   end record;

   subtype CVR_CURRENT_Field is STM32_SVD.UInt24;

   --  Reload value register
   type CVR_Register is record
      --  Reload value
      CURRENT            : CVR_CURRENT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CVR_Register use record
      CURRENT            at 0 range 0 .. 23;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Power control
   type SysTick_Peripheral is record
      --  SysTick control/status register
      CSR : aliased CSR_Register;
      RVR : aliased RVR_Register;
      CVR : aliased CVR_Register;
   end record
     with Volatile;

   for SysTick_Peripheral use record
      CSR at 16#0# range 0 .. 31;
      RVR at 16#4# range 0 .. 31;
      CVR at 16#8# range 0 .. 31;
   end record;

   --  SysTick
   SysTick_Periph : aliased SysTick_Peripheral
     with Import, Address => System'To_Address (16#E000E010#);

end STM32GD.SysTick;
