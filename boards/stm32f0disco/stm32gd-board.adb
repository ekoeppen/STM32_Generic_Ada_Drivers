with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32GD.Startup;

package body STM32GD.Board is

   procedure Init is
   begin
      Clocks.Init;
      RCC_Periph.AHBENR.IOPAEN := 1;
      RCC_Periph.AHBENR.IOPBEN := 1;
      RCC_Periph.AHBENR.IOPCEN := 1;
      RCC_Periph.APB2ENR.USART1EN := 1;
      RCC_Periph.APB2ENR.SYSCFGEN := 1;
      RCC_Periph.APB1ENR.PWREN := 1;
      RCC_Periph.APB1ENR.I2C1EN := 1;
      PWR_Periph.CR.DBP := 1;
      RCC_Periph.BDCR.RTCSEL := 2#10#;
      RCC_Periph.BDCR.RTCEN := 1;

      BUTTON.Init;
      LED.Init;
      LED2.Init;
      TX.Init;
      RX.Init;
      USART.Init;
      RTC.Init;
      I2C.Init;
      SCL.Init;
      SDA.Init;
   end Init;

end STM32GD.Board;
