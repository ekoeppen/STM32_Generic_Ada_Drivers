with System;
with STM32_SVD;         use STM32_SVD;
with STM32_SVD.RCC;     use STM32_SVD.RCC;
with STM32_SVD.ADC;     use STM32_SVD.ADC;
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
      I2C.Init;
      Radio.Init;
      STM32GD.Board.USART.Init;
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

   procedure Power_Up is
   begin
      STM32GD.Board.Init;
      RCC_Periph.APB2ENR.SPI1EN := 1;
      RCC_Periph.APB2ENR.USART1EN := 1;
      RCC_Periph.APB2ENR.ADCEN := 1;
      RCC_Periph.APB1ENR.I2C1EN := 1;
      RFM69_RESET.Init;
      SCL.Init;
      SDA.Init;
      CSN.Init;
      CSN.Set;
      SCLK.Init;
      MISO.Init;
      MOSI.Init;
      IRQ.Init;
      RX.Init;
      TX.Init;
   end Power_Up;

   procedure Power_Down is
   begin
      Radio.Power_Down;
      RCC_Periph.AHBENR.IOPAEN := 1;
      RCC_Periph.AHBENR.IOPBEN := 1;
      RCC_Periph.AHBENR.IOPCEN := 1;
      RCC_Periph.AHBENR.IOPDEN := 1;
      RCC_Periph.AHBENR.IOPFEN := 1;
      --  GPIOA_Periph.MODER.Val := 16#28FF_FFFF#;
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
      RCC_Periph.APB1ENR.I2C1EN := 0;
      RCC_Periph.AHBENR.DMAEN := 0;
   end Power_Down;

   function Supply_Voltage return Millivolts is
      V : Millivolts;
   begin
      ADC.ADC_Periph.CR.ADEN := 0;
      ADC.ADC_Periph.CR.ADEN := 1;
      ADC.ADC_Periph.CCR.VREFEN := 1;
      while ADC.ADC_Periph.ISR.ADRDY = 0 loop
         null;
      end loop;
      ADC.ADC_Periph.CHSELR.CHSEL.Arr (17) := 1;
      ADC.ADC_Periph.CR.ADSTART := 1;
      while ADC.ADC_Periph.ISR.EOC = 0 loop
         null;
      end loop;
      V :=  1200 * 4096 / Standard.Integer (ADC.ADC_Periph.DR.Data);
      ADC.ADC_Periph.CR.ADDIS := 1;
      return V;
   end Supply_Voltage;

end Peripherals;
