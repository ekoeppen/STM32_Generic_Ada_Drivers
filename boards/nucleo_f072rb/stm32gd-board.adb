with STM32_SVD; use STM32_SVD;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32GD.Startup; use STM32GD.Startup;
with STM32_SVD.Interrupts; use STM32_SVD.Interrupts;
with System;

package body STM32GD.Board is

   procedure Init is
   begin
      CLOCKS.Init;
      RCC_Periph.AHBENR.IOPAEN := 1;
      RCC_Periph.AHBENR.IOPBEN := 1;
      RCC_Periph.AHBENR.IOPCEN := 1;
      RCC_Periph.APB2ENR.SYSCFGEN := 1;
      RCC_Periph.APB1ENR.USART2EN := 1;
      RCC_Periph.APB1ENR.PWREN := 1;
      RCC_Periph.APB1ENR.I2C1EN := 1;
      PWR_Periph.CR.DBP := 1;
      RCC_Periph.BDCR.BDRST := 2#0#;
      RCC_Periph.BDCR.RTCSEL := 2#10#;
      RCC_Periph.BDCR.RTCEN := 1;
      SCL.Init;
      SDA.Init;
      BUTTON.Init;
      LED.Init;
      LED2.Init;
      TX.Init;
      RX.Init;
      USART.Init;
      I2C.Init;
      RTC.Init;
   end Init;

   Board_Vectors : constant array (17 .. Number_Of_Interrupts) of System.Address := (
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address
      ) with Export => True, External_Name => "board_vectors";
        pragma Linker_Section (Board_Vectors, ".board_vectors");

end STM32GD.Board;
