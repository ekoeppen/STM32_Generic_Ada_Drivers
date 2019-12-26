with STM32_SVD; use STM32_SVD;
with STM32_SVD.NVIC; use STM32_SVD.NVIC;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.RTC; use STM32_SVD.RTC;
with STM32_SVD.SCB; use STM32_SVD.SCB;

package body STM32GD.RTC is

   procedure RTC_Handler is
   begin
      RTC_Periph.CRL.ALRF := 0;
   end RTC_Handler;

   procedure Read (Date_Time : out Date_Time_Type) is
   begin
      Date_Time := Date_Time_Type (RTC_Periph.CNTL.CNTL) +
         Date_Time_Type (RTC_Periph.CNTH.CNTH) * 2 ** 16;
   end Read;

   procedure Print (Date_Time : Date_Time_Type) is
   begin
      --  Put (Integer'Image (Date_Time.Year));
      --  Put (Integer'Image (Date_Time.Month));
      --  Put (Integer'Image (Date_Time.Day));
      --  Put (Integer'Image (Date_Time.Hour));
      --  Put (Integer'Image (Date_Time.Minute));
      --  Put_Line (Integer'Image (Date_Time.Second));
      null;
   end Print;

   procedure Add_Seconds (Date_Time : in out Date_Time_Type ;
      Second_Delta : Second_Delta_Type) is
   begin
      Date_Time := Date_Time + Date_Time_Type (Second_Delta);
   end Add_Seconds;

   procedure Add_Minutes (Date_Time : in out Date_Time_Type ;
      Minute_Delta : Minute_Delta_Type) is
   begin
      Date_Time := Date_Time + Date_Time_Type (Minute_Delta * 60);
   end Add_Minutes;

   function To_Seconds (Date_Time : Date_Time_Type) return Natural is
   begin
      return Natural (Date_Time);
   end To_Seconds;

   procedure Set_Alarm (Date_Time : Date_Time_Type) is
   begin
      while RTC_Periph.CRL.RTOFF = 0 loop null; end loop;
      RTC_Periph.CRL.CNF := 1;
      RTC_Periph.ALRL.ALRL := UInt16 (Date_Time mod 2 ** 16);
      RTC_Periph.ALRH.ALRH := UInt16 (Date_Time / 2 ** 16);
      RTC_Periph.CRL.CNF := 0;
      while RTC_Periph.CRL.RTOFF = 1 loop null; end loop;
      RTC_Periph.CRH.ALRIE := 1;
      EXTI_Periph.EMR.MR.Arr (17) := 1;
      EXTI_Periph.RTSR.TR.Arr (17) := 1;
   end Set_Alarm;

   procedure Clear_Alarm is
      ICPR : UInt32;
   begin
      ICPR := NVIC_Periph.ICPR0;
      ICPR := ICPR or 2 ** 3;
      NVIC_Periph.ICPR0 := ICPR;
      EXTI_Periph.PR.PR.Arr (17) := 1;
      RTC_Periph.CRL.ALRF := 0;
      RTC_Periph.CRH.ALRIE := 0;
   end Clear_Alarm;

   procedure Wait_For_Alarm is
   begin
      SCB.SCB_Periph.SCR.SEVEONPEND := 1;
      STM32GD.WFE;
      Clear_Alarm;
   end Wait_For_Alarm;

   function Alarm_Triggered return Boolean is
   begin
      return RTC_Periph.CRL.ALRF = 1;
   end Alarm_Triggered;

   procedure Init is
      use STM32GD.Clock;
   begin
      RCC_Periph.APB1ENR.PWREN := 1;
      RCC_Periph.APB1ENR.BKPEN := 1;
      PWR_Periph.CR.DBP := 1;
      case Clock is
         when LSE => RCC_Periph.BDCR.RTCSEL := 2#01#;
            pragma Compile_Time_Error (Clock = LSE and not Clock_Tree.LSE_Enabled, "LSE not enabled for RTC");
         when LSI => RCC_Periph.BDCR.RTCSEL := 2#10#;
            pragma Compile_Time_Error (Clock = LSI and not Clock_Tree.LSI_Enabled, "LSE not enabled for RTC");
         when others =>
            pragma Compile_Time_Error (Clock /= LSI and Clock /= LSE, "RTC clock needs to be LSI or LSE");
      end case;
      RCC_Periph.BDCR.RTCEN := 1;
   end Init;

end STM32GD.RTC;
