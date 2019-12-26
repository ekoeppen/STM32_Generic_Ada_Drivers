with System; use System;
with STM32GD;
with STM32_SVD; use STM32_SVD;
with STM32_SVD.Flash; use STM32_SVD.Flash;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.RTC; use STM32_SVD.RTC;
with STM32GD.Board; use STM32GD.Board;
with STM32GD.GPIO;

package body Power is

   procedure Deactivate_Peripherals is
   begin
      RCC_Periph.AHBENR.IOPAEN := 1;
      RCC_Periph.AHBENR.IOPBEN := 1;
      RCC_Periph.AHBENR.IOPCEN := 1;
      RCC_Periph.AHBENR.IOPDEN := 1;
      RCC_Periph.AHBENR.IOPFEN := 1;
      GPIOA_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOB_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOC_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOD_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOF_Periph.MODER.Val := 16#FFFF_FFFF#;
      MOSI.Set_Mode (STM32GD.GPIO.Mode_In);
      MOSI.Set_Pull_Resistor (STM32GD.GPIO.Pull_Down);
      MISO.Set_Mode (STM32GD.GPIO.Mode_In);
      MISO.Set_Pull_Resistor (STM32GD.GPIO.Pull_Down);
      SCLK.Set_Mode (STM32GD.GPIO.Mode_In);
      SCLK.Set_Pull_Resistor (STM32GD.GPIO.Pull_Up);
      CSN.Set_Mode (STM32GD.GPIO.Mode_In);
      CSN.Set_Pull_Resistor (STM32GD.GPIO.Pull_Up);

      RCC_Periph.AHBENR.IOPAEN := 0;
      RCC_Periph.AHBENR.IOPBEN := 0;
      RCC_Periph.AHBENR.IOPCEN := 0;
      RCC_Periph.AHBENR.IOPDEN := 0;
      RCC_Periph.AHBENR.IOPFEN := 0;
      RCC_Periph.APB2ENR.USART1EN := 0;
      RCC_Periph.APB2ENR.SPI1EN := 0;
      RCC_Periph.APB1ENR.I2C1EN := 0;
      RCC_Periph.AHBENR.DMAEN := 0;
      RCC_Periph.APB2ENR.ADCEN := 0;
   end Deactivate_Peripherals;

   procedure Stop is
      SCB_SCR : aliased STM32_SVD.UInt32
        with Address => System'To_Address (16#E000ED10#);
      SCR : UInt32;
   begin
      PWR_Periph.CR.CWUF := 1;
      PWR_Periph.CR.LPDS := 1;
      PWR_Periph.CR.PDDS := 0;
      SCR := SCB_SCR or 2#100#;
      SCB_SCR := SCR;
      STM32GD.WFE;
   end Stop;

end Power;
