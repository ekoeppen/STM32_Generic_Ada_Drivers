with STM32_SVD.RCC;
with STM32_SVD.DMA; use STM32_SVD.DMA;
with STM32_SVD.USART;
with STM32_SVD; use STM32_SVD;

package body Peripherals is

   procedure Init is
   begin
      STM32_SVD.RCC.RCC_Periph.APB2ENR.SPI1EN := 1;
      CE.Init;
      CSN.Init;
      CSN.Set;
      SCLK.Init;
      MISO.Init;
      MOSI.Init;
      IRQ.Init;
      SPI.Init;
      Timer.Init;
      Radio.Init;
   end Init;

end Peripherals;
