with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32GD.Startup;

package body STM32GD.Board is

   procedure Enable_Peripherals is
   begin
      RCC_Periph.IOPENR.IOPAEN := 1;
      RCC_Periph.IOPENR.IOPBEN := 1;
      RCC_Periph.IOPENR.IOPCEN := 1;
      RCC_Periph.APB1ENR.USART2EN := 1;
      RCC_Periph.APB2ENR.SPI1EN := 1;
      RCC_Periph.APB1ENR.I2C1EN := 1;
      RCC_Periph.APB2ENR.ADCEN := 1;

      BUTTON.Init;
      LED.Init;
      LED2.Init;
      CSN.Init;
      CSN.Set;
      SCLK.Init;
      MISO.Init;
      MOSI.Init;
      IRQ.Init;
      CE.Init;
      TX.Init;
      RX.Init;
      SCL.Init;
      SDA.Init;

      USART.Init;
      I2C.Init;
      SPI.Init;
   end Enable_Peripherals;

   procedure Disable_Peripherals is
   begin
      RCC_Periph.IOPENR := ( Reserved_5_6 => 0, Reserved_8_31 => 0, others => 1);
      GPIOA_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOB_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOC_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOD_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOE_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOH_Periph.MODER.Val := 16#FFFF_FFFF#;
      MOSI.Set_Input;
      MOSI.Set_Pull_Down;
      MISO.Set_Input;
      MISO.Set_Pull_Down;
      SCLK.Set_Input;
      SCLK.Set_Pull_Up;
      CSN.Set_Input;
      CSN.Set_Pull_Up;
      CE.Set_Input;
      CE.Set_Pull_Down;
      RCC_Periph.IOPENR := ( Reserved_5_6 => 0, Reserved_8_31 => 0, others => 0);
      RCC_Periph.APB1ENR.USART2EN := 0;
      RCC_Periph.APB2ENR.SPI1EN := 0;
      RCC_Periph.APB1ENR.I2C1EN := 0;
      RCC_Periph.APB2ENR.ADCEN := 0;
   end Disable_Peripherals;

   procedure Init is
   begin
      CLOCKS.Init;
      RTC.Init;
      Enable_Peripherals;
      STM32GD.Clear_Event;
   end Init;

end STM32GD.Board;
