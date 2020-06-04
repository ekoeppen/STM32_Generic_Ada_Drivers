with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.SCB; use STM32_SVD.SCB;
with STM32_SVD.Flash; use STM32_SVD.Flash;
with STM32GD.Startup;

package body STM32GD.Board is

   procedure Init is
   begin
      Clocks.Init;
      RCC_Periph.APB1ENR.PWREN := 1;
      RCC_Periph.IOPENR.IOPAEN := 1;
      RCC_Periph.IOPENR.IOPBEN := 1;
      RCC_Periph.APB2ENR.USART1EN := 1;
      RCC_Periph.APB2ENR.SPI1EN := 1;
      --  RCC_Periph.APB2ENR.ADCEN := 1;
      RCC_Periph.APB1ENR.I2C1EN := 1;

      --  BUTTON.Init;
      --  LED.Init;
      --  LED2.Init;
      --  LED3.Init;
      TX.Init;
      RX.Init;
      --  RFM69_RESET.Init;
      --  SCL.Init;
      --  SDA.Init;
      CSN.Init;
      CSN.Set;
      SCLK.Init;
      MISO.Init;
      MOSI.Init;
      IRQ.Init;

      USART.Init;
      SPI.Init;
      RTC.Init;
      --  I2C.Init;
   end Init;

   procedure Power_Down is
   begin
      RCC_Periph.IOPENR := (Reserved_5_6 => 0, Reserved_8_31 => 0, others => 1);
      GPIOA_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOB_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOC_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOD_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOE_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOH_Periph.MODER.Val := 16#FFFF_FFFF#;
      RCC_Periph.IOPENR := (Reserved_5_6 => 0, Reserved_8_31 => 0, others => 0);

      STM32_SVD.RCC.RCC_Periph.APB2ENR.USART1EN := 0;
      STM32_SVD.RCC.RCC_Periph.APB2ENR.SPI1EN := 0;
      STM32_SVD.RCC.RCC_Periph.APB2ENR.ADCEN := 0;
      STM32_SVD.RCC.RCC_Periph.APB1ENR.I2C1EN := 0;
   end Power_Down;

   procedure Power_Up is
   begin
      Init;
   end Power_Up;

   procedure Stop is
   begin
      Flash_Periph.ACR.SLEEP_PD := 1;
      PWR_Periph.CR.LPDS := 1;
      PWR_Periph.CR.PDDS := 0;
      PWR_Periph.CR.ULP := 1;
      SCB_Periph.SCR.SLEEPDEEP := 1;
   end Stop;

end STM32GD.Board;
