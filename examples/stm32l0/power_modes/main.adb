with STM32GD;
with STM32GD.Board;
with STM32_SVD; use STM32_SVD;
with STM32_SVD.Flash; use STM32_SVD.Flash;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.SCB; use STM32_SVD.SCB;
with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.RTC; use STM32_SVD.RTC;

procedure Main is

   procedure Deactivate_Peripherals is
   begin
      RCC_Periph.IOPENR := (
         IOPAEN => 1,
         IOPBEN => 1,
         IOPCEN => 1,
         IOPDEN => 1,
         IOPEEN => 1,
         IOPHEN => 1,
         Reserved_5_6 => 0,
         Reserved_8_31 => 0);
      GPIOA_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOB_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOC_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOD_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOE_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOH_Periph.MODER.Val := 16#FFFF_FFFF#;
      RCC_Periph.IOPENR := (
         Reserved_5_6 => 0,
         Reserved_8_31 => 0,
         others => 0);
   end Deactivate_Peripherals;

   procedure Start_RTC is
   begin
      RCC_Periph.CSR.LSION := 1;
      while RCC_Periph.CSR.LSIRDY = 0 loop null; end loop;
      RCC_Periph.CSR.RTCSEL := 2#10#;
      RCC_Periph.CSR.RTCEN := 1;
   end Start_RTC;

   procedure Sleep is
   begin
      loop
         STM32GD.Wait_For_Interrupt;
      end loop;
   end Sleep;

   procedure Low_Power_Sleep is
   begin
      Flash_Periph.ACR.SLEEP_PD := 1;
      loop
         STM32GD.Wait_For_Interrupt;
      end loop;
   end Low_Power_Sleep;

   procedure Stop is
   begin
      Flash_Periph.ACR.SLEEP_PD := 1;
      PWR_Periph.CR.LPDS := 1;
      PWR_Periph.CR.PDDS := 0;
      PWR_Periph.CR.ULP := 1;
      SCB_Periph.SCR.SLEEPDEEP := 1;
      Deactivate_Peripherals;
      Sleep;
   end Stop;

   procedure Standby is
   begin
      Flash_Periph.ACR.SLEEP_PD := 1;
      PWR_Periph.CR.LPDS := 1;
      PWR_Periph.CR.PDDS := 1;
      PWR_Periph.CR.ULP := 1;
      SCB_Periph.SCR.SLEEPDEEP := 1;
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
