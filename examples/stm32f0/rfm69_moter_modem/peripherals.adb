with STM32_SVD;         use STM32_SVD;
with STM32_SVD.RCC;     use STM32_SVD.RCC;
with STM32_SVD.DMA;     use STM32_SVD.DMA;
with STM32_SVD.USART;   use STM32_SVD.USART;
with STM32GD.Board;     use STM32GD.Board;

package body Peripherals is

   procedure Init is
   begin
      RCC.RCC_Periph.APB2ENR.USART1EN := 1;
      RCC.RCC_Periph.APB2ENR.SPI1EN := 1;
      RCC.RCC_Periph.AHBENR.DMAEN := 1;

      RFM69_RESET.Init;
      RFM69_RESET.Clear;
      CSN.Init;
      CSN.Set;
      SCLK.Init;
      MISO.Init;
      MOSI.Init;
      IRQ.Init;
      SPI.Init;
      Radio.Init;

      RX.Init;
      TX.Init;
      USART.Init;
      USART1_Periph.CR1.RXNEIE := 1;

   end Init;

end Peripherals;
