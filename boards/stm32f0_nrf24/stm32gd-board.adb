with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC;

with STM32GD.Startup;
with STM32GD.Vectors;

package body STM32GD.Board is

   procedure Init is
   begin
      STM32_SVD.RCC.RCC_Periph.AHBENR.IOPAEN := 1;
      STM32_SVD.RCC.RCC_Periph.AHBENR.IOPBEN := 1;
      STM32_SVD.RCC.RCC_Periph.APB2ENR.USART1EN := 1;
      STM32_SVD.RCC.RCC_Periph.APB2ENR.SPI1EN := 1;

      CLOCKS.Init;

      BUTTON.Init;
      LED.Init;
      LED2.Init;
      CSN.Init;
      CSN.Set;
      SCLK.Init;
      MISO.Init;
      MOSI.Init;
      IRQ.Init;
      CE.Init;
      TX.Init;
      RX.Init;

      USART.Init;
      SPI.Init;
      RTC.Init;
      STM32GD.Clear_Event;
   end Init;

end STM32GD.Board;
