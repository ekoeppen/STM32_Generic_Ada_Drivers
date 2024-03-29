with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.NVIC;
with STM32_SVD.GPIO; use STM32_SVD.GPIO;

with STM32GD.Startup;

package body STM32GD.Board is

   procedure Enable_Peripherals is
   begin
      CLOCKS.Init;
      RCC_Periph.AHBENR.IOPAEN := 1;
      RCC_Periph.AHBENR.IOPBEN := 1;
      RCC_Periph.APB2ENR.USART1EN := 1;
      RCC_Periph.APB2ENR.SPI1EN := 1;
      RCC_Periph.APB2ENR.ADCEN := 1;
      RCC_Periph.APB1ENR.I2C1EN := 1;

      BUTTON.Init;
      LED.Init;
      LED2.Init;
      LED3.Init;
      TX.Init;
      RX.Init;
      RFM69_RESET.Init;
      SCL.Init;
      SDA.Init;
      CSN.Init;
      CSN.Set;
      SCLK.Init;
      MISO.Init;
      MOSI.Init;
      IRQ.Init;

      USART.Init;
      SPI.Init;
      I2C.Init;
   end Enable_Peripherals;

   procedure Disable_Peripherals is
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
      MOSI.Set_Input;
      MOSI.Set_Pull_Down;
      MISO.Set_Input;
      MISO.Set_Pull_Down;
      SCLK.Set_Input;
      SCLK.Set_Pull_Up;
      CSN.Set_Input;
      CSN.Set_Pull_Up;

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
   end Disable_Peripherals;

   procedure Init is
   begin
      CLOCKS.Init;
      RCC_Periph.APB1ENR.PWREN := 1;
      PWR_Periph.CR.DBP := 1;
      RCC_Periph.BDCR.BDRST := 2#0#;
      RCC_Periph.BDCR.RTCSEL := 2#10#;
      RCC_Periph.BDCR.RTCEN := 1;
      Enable_Peripherals;
      RTC.Init;
   end Init;

end STM32GD.Board;
