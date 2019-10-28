with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC;

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
      --  Timer.Init;
      Radio.Init;
   end Init;

end Peripherals;
