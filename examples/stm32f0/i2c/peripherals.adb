with System;
with STM32_SVD;         use STM32_SVD;
with STM32_SVD.RCC;     use STM32_SVD.RCC;
with STM32GD.Board;     use STM32GD.Board;
with STM32GD.GPIO;      use STM32GD.GPIO;

package body Peripherals is

   procedure Init is
   begin
      RCC.RCC_Periph.APB1ENR.I2C1EN := 1;
      RCC.RCC_Periph.APB2ENR.USART1EN := 1;
      RCC.RCC_Periph.APB2ENR.ADCEN := 1;
      SCL_OUT.Init;
      for I in Integer range 0 .. 10 loop
         --  SCL_OUT.Toggle;
         for J in Integer range 0 .. 1000 loop null; end loop;
      end loop;
      SCL.Init;
      SDA.Init;
      I2C.Init;
      RX.Init;
      TX.Init;
      USART.Init;
   end Init;

end Peripherals;
