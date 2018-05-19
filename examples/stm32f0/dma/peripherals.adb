with STM32_SVD.RCC;
with STM32_SVD.DMA; use STM32_SVD.DMA;
with STM32_SVD.USART;
with STM32_SVD; use STM32_SVD;

package body Peripherals is

   procedure Init is
   begin
      STM32_SVD.RCC.RCC_Periph.APB2ENR.USART1EN := 1;
      STM32_SVD.RCC.RCC_Periph.AHBENR.DMAEN := 1;
      Peripherals.RX.Init;
      Peripherals.TX.Init;
      Peripherals.USART.Init;
      STM32_SVD.USART.USART1_Periph.CR1.RXNEIE := 1;
   end Init;

end Peripherals;
