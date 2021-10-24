with STM32GD;
with STM32_SVD; use STM32_SVD;
with STM32_SVD.Flash; use STM32_SVD.Flash;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.SCB; use STM32_SVD.SCB;

package body STM32GD.Power is

   procedure Enable_Stop is
   begin
      Flash_Periph.ACR.SLEEP_PD := 1;
      PWR_Periph.CR.LPDS := 1;
      PWR_Periph.CR.PDDS := 0;
      PWR_Periph.CR.ULP := 1;
      SCB_Periph.SCR.SLEEPDEEP := 1;
   end Enable_Stop;

   procedure Stop is
   begin
      Enable_Stop;
      Wait_For_Interrupt;
   end Stop;

   procedure Standby is
   begin
      Flash_Periph.ACR.SLEEP_PD := 1;
      PWR_Periph.CR.LPDS := 1;
      PWR_Periph.CR.PDDS := 1;
      PWR_Periph.CR.ULP := 1;
      SCB_Periph.SCR.SLEEPDEEP := 1;
      Wait_For_Interrupt;
   end Standby;

end STM32GD.Power;
