with System;
with STM32_SVD;         use STM32_SVD;
with STM32_SVD.RCC;     use STM32_SVD.RCC;
with STM32_SVD.DMA;     use STM32_SVD.DMA;
with STM32_SVD.USART;   use STM32_SVD.USART;
with STM32_SVD.PWR;     use STM32_SVD.PWR;
with STM32_SVD.EXTI;    use STM32_SVD.EXTI;
with STM32_SVD.NVIC;    use STM32_SVD.NVIC;
with STM32_SVD.GPIO;    use STM32_SVD.GPIO;
with STM32GD.Board;     use STM32GD.Board;

package body Peripherals is

   procedure Init is
   begin
      Power_Up;
      RFM69_RESET.Clear;
      SPI.Init;
      Radio.Init;
      RX.Init;
      TX.Init;
      USART.Init;
   end Init;

   procedure Enable_Stop_Mode (Low_Power : Boolean) is
      SCB_SCR : aliased STM32_SVD.UInt32
        with Address => System'To_Address (16#E000ED10#);
      SCR : UInt32;
   begin
      PWR_Periph.CR.LPDS := (if Low_Power then 1 else 0);
      PWR_Periph.CR.PDDS := 0;
      SCR := SCB_SCR or 2#100#;
      SCB_SCR := SCR;
   end Enable_Stop_Mode;

   procedure Disable_Stop_Mode is
      SCB_SCR : aliased STM32_SVD.UInt32
        with Address => System'To_Address (16#E000ED10#);
      SCR : UInt32;
   begin
      SCR := SCB_SCR and not 2#100#;
      SCB_SCR := SCR;
   end Disable_Stop_Mode;

   procedure Power_Down is
   begin
      Radio.Power_Down;
      RCC_Periph.AHBENR.IOPAEN := 1;
      RCC_Periph.AHBENR.IOPBEN := 1;
      RCC_Periph.AHBENR.IOPCEN := 1;
      RCC_Periph.AHBENR.IOPDEN := 1;
      RCC_Periph.AHBENR.IOPFEN := 1;
      GPIOA_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOB_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOC_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOD_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOF_Periph.MODER.Val := 16#FFFF_FFFF#;
      SCLK.Set_Mode (STM32GD.GPIO.Mode_In);
      SCLK.Set_Pull_Resistor (STM32GD.GPIO.Pull_Up);
      CSN.Set_Mode (STM32GD.GPIO.Mode_In);
      CSN.Set_Pull_Resistor (STM32GD.GPIO.Pull_Up);

      RCC_Periph.AHBENR.IOPAEN := 0;
      RCC_Periph.AHBENR.IOPBEN := 0;
      RCC_Periph.AHBENR.IOPCEN := 0;
      RCC_Periph.AHBENR.IOPDEN := 0;
      RCC_Periph.AHBENR.IOPFEN := 0;
      RCC_Periph.APB2ENR.USART1EN := 0;
      RCC_Periph.APB2ENR.SPI1EN := 0;
      RCC_Periph.AHBENR.DMAEN := 0;
   end Power_Down;

   procedure Power_Up is
   begin
      STM32GD.Board.Init;
      RCC.RCC_Periph.APB2ENR.SPI1EN := 1;
      RCC.RCC_Periph.APB2ENR.USART1EN := 1;
      RFM69_RESET.Init;
      CSN.Init;
      CSN.Set;
      SCLK.Init;
      MISO.Init;
      MOSI.Init;
      IRQ.Init;
      RX.Init;
      TX.Init;
   end Power_Up;

end Peripherals;
