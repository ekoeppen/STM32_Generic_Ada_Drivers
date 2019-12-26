with System;
with STM32_SVD;         use STM32_SVD;
with STM32_SVD.RCC;     use STM32_SVD.RCC;
with STM32_SVD.ADC;     use STM32_SVD.ADC;
with STM32_SVD.PWR;     use STM32_SVD.PWR;
with STM32_SVD.GPIO;    use STM32_SVD.GPIO;
with STM32GD.Board;     use STM32GD.Board;
with STM32GD.GPIO;

package body Peripherals is

   procedure Idle_Hook;
      pragma Export (
         Convention => C,
         Entity => Idle_Hook,
         External_Name => "vApplicationIdleHook");

   procedure Idle_Hook is
   begin
      STM32GD.WFI;
   end Idle_Hook;


   procedure Init is
   begin
      Power_Up;
      RFM69_RESET.Clear;
      Radio.Init;
      Enable_Stop_Mode (True);
   end Init;

   procedure Enter_Stop_Mode is
   begin
      Enable_Stop_Mode (True);
      STM32GD.WFI;
   end Enter_Stop_Mode;

   procedure Enable_Stop_Mode (Low_Power : Boolean) is
      SCB_SCR : aliased STM32_SVD.UInt32
        with Address => System'To_Address (16#E000ED10#);
      SCR : UInt32;
   begin
      PWR_Periph.CR.CWUF := 1;
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
      RCC_Periph.APB2ENR.ADCEN := 1;
   end Power_Up;

   procedure Power_Down_New is
   begin
      Radio.Power_Down;
      RCC_Periph.AHBENR.IOPAEN := 1;
      RCC_Periph.AHBENR.IOPBEN := 1;
      RCC_Periph.AHBENR.IOPCEN := 1;
      RCC_Periph.AHBENR.IOPDEN := 1;
      RCC_Periph.AHBENR.IOPFEN := 1;
      GPIOA_Periph.MODER.Val := 16#0000_0000#;
      GPIOB_Periph.MODER.Val := 16#0000_0000#;
      GPIOC_Periph.MODER.Val := 16#0000_0000#;
      GPIOD_Periph.MODER.Val := 16#0000_0000#;
      GPIOF_Periph.MODER.Val := 16#0000_0000#;

      GPIOA_Periph.PUPDR.Val := 16#5555_5565#;
      GPIOB_Periph.PUPDR.Val := 16#AAAA_AAAA#;
      GPIOC_Periph.PUPDR.Val := 16#AAAA_AAAA#;
      GPIOD_Periph.PUPDR.Val := 16#AAAA_AAAA#;
      GPIOF_Periph.PUPDR.Val := 16#AAAA_AAAA#;

      RCC_Periph.AHBENR.IOPAEN := 0;
      RCC_Periph.AHBENR.IOPBEN := 0;
      RCC_Periph.AHBENR.IOPCEN := 0;
      RCC_Periph.AHBENR.IOPDEN := 0;
      RCC_Periph.AHBENR.IOPFEN := 0;
      RCC_Periph.APB2ENR.USART1EN := 0;
      RCC_Periph.APB2ENR.SPI1EN := 0;
      RCC_Periph.APB1ENR.I2C1EN := 0;
      RCC_Periph.AHBENR.DMAEN := 0;
      RCC_Periph.APB2ENR.ADCEN := 0;
   end Power_Down_New;

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
      MOSI.Set_Mode (STM32GD.GPIO.Mode_In);
      MOSI.Set_Pull_Resistor (STM32GD.GPIO.Pull_Down);
      MISO.Set_Mode (STM32GD.GPIO.Mode_In);
      MISO.Set_Pull_Resistor (STM32GD.GPIO.Pull_Down);
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
      RCC_Periph.APB2ENR.ADCEN := 0;
   end Power_Down;

   function Supply_Voltage return Millivolts is
      V : Millivolts;
      VREFINT_CAL : aliased STM32_SVD.UInt16
        with Address => System'To_Address (16#1FFF_F7BA#);
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
      V := 3300 * Standard.Integer (VREFINT_CAL) / Standard.Integer (ADC.ADC_Periph.DR.Data);
      ADC.ADC_Periph.CR.ADDIS := 1;
      return V;
   end Supply_Voltage;

end Peripherals;
