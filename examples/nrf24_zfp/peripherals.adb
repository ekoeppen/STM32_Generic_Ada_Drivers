with STM32_SVD;      use STM32_SVD;
with STM32_SVD.RCC;  use STM32_SVD.RCC;
with STM32GD.Board;  use STM32GD.Board;

package body Peripherals is

   procedure Init is
   begin
      RCC_Periph.APB2ENR.SPI1EN := 1;
      CE.Init;
      CSN.Init;
      CSN.Set;
      SCLK.Init;
      MISO.Init;
      MOSI.Init;
      IRQ.Init;
      SPI.Init;
      Radio.Init;
   end Init;

end Peripherals;
