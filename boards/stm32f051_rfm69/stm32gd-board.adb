with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.NVIC;
with STM32_SVD.GPIO; use STM32_SVD.GPIO;

with STM32GD.Startup;
with STM32GD.Vectors;

package body STM32GD.Board is

   procedure Enable_Peripherals is
   begin
      STM32_SVD.RCC.RCC_Periph.AHBENR.IOPAEN := 1;
      STM32_SVD.RCC.RCC_Periph.AHBENR.IOPBEN := 1;
      STM32_SVD.RCC.RCC_Periph.APB2ENR.USART1EN := 1;
      STM32_SVD.RCC.RCC_Periph.APB2ENR.SPI1EN := 1;
      STM32_SVD.RCC.RCC_Periph.APB2ENR.ADCEN := 1;
      STM32_SVD.RCC.RCC_Periph.APB1ENR.I2C1EN := 1;

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
   end Disable_Peripherals;

   procedure Init is
   begin
      CLOCKS.Init;
      RTC.Init;
      Enable_Peripherals;
      STM32GD.Clear_Event;
   end Init;

end STM32GD.Board;
