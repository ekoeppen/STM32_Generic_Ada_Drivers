with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC;
with STM32_SVD.NVIC;
with STM32_SVD.GPIO;
with Ada.Text_IO;

package body STM32GD.Board is

   procedure Init is
   begin
      STM32_SVD.RCC.RCC_Periph.AHBENR.IOPAEN := 1;
      STM32_SVD.RCC.RCC_Periph.AHBENR.IOPFEN := 1;
      BUTTON.Init;
      LED.Init;
   end Init;

end STM32GD.Board;
