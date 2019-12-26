with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC;
with STM32_SVD.NVIC;
with STM32_SVD.GPIO;

with STM32GD.Startup;
with STM32GD.Vectors;

package body STM32GD.Board is

   procedure Init is
   begin
      Clocks.Init;
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
      RTC.Init;
   end Init;

end STM32GD.Board;
