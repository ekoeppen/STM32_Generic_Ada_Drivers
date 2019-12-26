with System;
with STM32GD;
with STM32_SVD; use STM32_SVD;
with STM32_SVD.Flash; use STM32_SVD.Flash;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.RTC; use STM32_SVD.RTC;
with Startup;

procedure Main is

   procedure Deactivate_Peripherals is
   begin
      RCC_Periph.AHBENR := (
         IOPAEN => 1,
         IOPBEN => 1,
         IOPCEN => 1,
         IOPDEN => 1,
         IOPFEN => 1,
         Reserved_7_16 => 0,
         Reserved_23_31 => 0,
         others => 0);
      GPIOA_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOB_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOC_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOD_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOF_Periph.MODER.Val := 16#FFFF_FFFF#;
      RCC_Periph.AHBENR := (
         Reserved_7_16 => 0,
         Reserved_23_31 => 0,
         others => 0);
      RCC_Periph.APB1ENR := (
         Reserved_2_3   => 0,
         Reserved_5_7   => 0,
         Reserved_9_10  => 0,
         Reserved_12_13 => 0,
         Reserved_15_16 => 0,
         Reserved_18_20 => 0,
         Reserved_23_27 => 0,
         Reserved_29_31 => 0,
         others => 0);
      RCC_Periph.APB2ENR := (
         Reserved_1_8 => 0,
         Reserved_19_21 => 0,
         Reserved_23_31 => 0,
         others => 0);
   end Deactivate_Peripherals;

   procedure Start_RTC is
   begin
      RCC_Periph.CSR.LSION := 1;
      while RCC_Periph.CSR.LSIRDY = 0 loop null; end loop;
      RCC_Periph.BDCR.RTCSEL := 2#10#;
      RCC_Periph.BDCR.RTCEN := 1;
   end Start_RTC;

   procedure Sleep is
   begin
      loop
         STM32GD.WFI;
      end loop;
   end Sleep;

   procedure Stop is
      SCB_SCR : aliased STM32_SVD.UInt32
        with Address => System'To_Address (16#E000ED10#);
      SCR : UInt32;
   begin
      PWR_Periph.CR.LPDS := 1;
      PWR_Periph.CR.PDDS := 0;
      SCR := SCB_SCR or 2#100#;
      SCB_SCR := SCR;
      Deactivate_Peripherals;
      Sleep;
   end Stop;

   procedure Standby is
      SCB_SCR : aliased STM32_SVD.UInt32
        with Address => System'To_Address (16#E000ED10#);
      SCR : UInt32;
   begin
      PWR_Periph.CR.LPDS := 1;
      PWR_Periph.CR.PDDS := 1;
      SCR := SCB_SCR or 2#100#;
      SCB_SCR := SCR;
      Deactivate_Peripherals;
      Sleep;
   end Standby;

begin
   RCC_Periph.APB1ENR.PWREN := 1;
   loop
      Start_RTC;
      --  Sleep;
      --  Low_Power_Sleep;
      Stop;
      --  Standby;
   end loop;
end Main;
