with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32GD.Startup;
with STM32GD.GPIO;

package body STM32GD.Board is

   procedure Init is
   begin
      CLOCKS.Init;
      RCC_Periph.IOPENR.IOPAEN := 1;
      RCC_Periph.IOPENR.IOPBEN := 1;
      RCC_Periph.IOPENR.IOPCEN := 1;
      RCC_Periph.APB2ENR.SYSCFGEN := 1;
      RCC_Periph.APB2ENR.SPI1EN := 1;
      RCC_Periph.APB1ENR.I2C1EN := 1;
      RCC_Periph.APB1ENR.USART2EN := 1;
      LED.Init;
      SCL.Init;
      SDA.Init;
      TX.Init;
      RX.Init;
      USART.Init;
      SPI.Init;
      I2C.Init;
      RTC.Init;
   end Init;

end STM32GD.Board;
