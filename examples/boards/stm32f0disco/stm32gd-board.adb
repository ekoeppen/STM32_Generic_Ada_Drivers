with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;

package body STM32GD.Board is

   procedure Init is
   begin
      RCC_Periph.AHBENR.IOPAEN := 1;
      RCC_Periph.AHBENR.IOPBEN := 1;
      RCC_Periph.AHBENR.IOPCEN := 1;
      RCC_Periph.APB2ENR.SYSCFGEN := 1;
      RCC_Periph.APB2ENR.USART1EN := 1;
      BUTTON.Init;
      LED_RED.Init;
      LED_GREEN.Init;
      --  TX.Init;
      --  RX.Init;
      --  USART.Init;
   end Init;

end STM32GD.Board;
