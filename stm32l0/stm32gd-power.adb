with System;
with STM32_SVD; use STM32_SVD;
with STM32_SVD.Flash; use STM32_SVD.Flash;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.SCB; use STM32_SVD.SCB;
with STM32_SVD.ADC; use STM32_SVD.ADC;

package body STM32GD.Power is

   procedure Enable_Sleep is
   begin
      Flash_Periph.ACR.SLEEP_PD := 1;
      PWR_Periph.CR.LPDS := 0;
      PWR_Periph.CR.PDDS := 0;
      PWR_Periph.CR.ULP := 0;
      SCB_Periph.SCR.SLEEPDEEP := 0;
   end Enable_Sleep;

   procedure Enable_Stop is
   begin
      Flash_Periph.ACR.SLEEP_PD := 1;
      PWR_Periph.CR.LPDS := 1;
      PWR_Periph.CR.PDDS := 0;
      PWR_Periph.CR.ULP := 1;
      SCB_Periph.SCR.SLEEPDEEP := 1;
   end Enable_Stop;

   procedure Enable_Standby is
   begin
      Flash_Periph.ACR.SLEEP_PD := 1;
      PWR_Periph.CR.LPDS := 1;
      PWR_Periph.CR.PDDS := 1;
      PWR_Periph.CR.ULP := 1;
      SCB_Periph.SCR.SLEEPDEEP := 1;
   end Enable_Standby;

   function Supply_Voltage return Millivolts is
      V : Millivolts;
      VREFINT_CAL : aliased STM32_SVD.UInt16
        with Address => System'To_Address (16#1FF8_0078#);
   begin
      ADC_Periph.CFGR2.CKMODE := 1;
      ADC_Periph.CR.ADCAL := 1;
      while ADC_Periph.CR.ADCAL = 1 loop
         null;
      end loop;
      ADC_Periph.CCR.VREFEN := 1;
      ADC_Periph.ISR.ADRDY := 1;
      ADC_Periph.CR.ADEN := 1;
      while ADC_Periph.ISR.ADRDY = 0 loop
         null;
      end loop;
      ADC_Periph.CHSELR.CHSEL.Arr (17) := 1;
      ADC_Periph.CR.ADSTART := 1;
      while ADC_Periph.ISR.EOC = 0 loop
         null;
      end loop;
      V := 3000 * Standard.Integer (VREFINT_CAL) / Standard.Integer (ADC_Periph.DR.Data);
      ADC_Periph.CR.ADDIS := 1;
      ADC_Periph.CCR.VREFEN := 0;
      return V;
   end Supply_Voltage;

end STM32GD.Power;
