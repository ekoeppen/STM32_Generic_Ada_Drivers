with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32GD.Startup;
with STM32GD.Vectors;

package body STM32GD.Board is

   procedure Init is
   begin
      Clocks.Init;
      RCC_Periph.AHBENR.IOPAEN := 1;
      RCC_Periph.AHBENR.IOPBEN := 1;
      RCC_Periph.AHBENR.IOPCEN := 1;
      RCC_Periph.APB2ENR.SPI1EN := 1;
      RCC_Periph.APB1ENR.USART2EN := 1;
      RCC_Periph.APB2ENR.SYSCFGEN := 1;
      LED.Init;
      TX.Init;
      RX.Init;
      P1_IN.Init;
      P2_IN.Init;
      SCLK.Init;
      MOSI.Init;
      MISO.Init;
      CSN.Init;
      CSN.Set;
      SPI.Init;
      USART.Init;
      RTC.Init;
      STM32GD.Clear_Event;
   end Init;

end STM32GD.Board;
