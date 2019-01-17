with STM32_SVD; use STM32_SVD;
with STM32_SVD.RTC; use STM32_SVD.RTC;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;
with RTC_IRQ;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body RTC is

   procedure Unlock is
   begin
      RTC_Periph.WPR.KEY := 16#CA#;
      RTC_Periph.WPR.KEY := 16#53#;
   end Unlock;

   procedure Lock is
   begin
      RTC_Periph.WPR.KEY := 16#FF#;
   end Lock;

   procedure Read (Date_Time : out Date_Time_Type) is
   begin
      Date_Time.Day := Natural(RTC_Periph.DR.DU) + Natural(RTC_Periph.DR.DT) * 10;
      Date_Time.Month := Natural(RTC_Periph.DR.MU) + Natural(RTC_Periph.DR.MT) * 10;
      Date_Time.Year := Natural(RTC_Periph.DR.YU) + Natural(RTC_Periph.DR.YT) * 10;
      Date_Time.Hour := Natural(RTC_Periph.TR.HU) + Natural(RTC_Periph.TR.HT) * 10;
      Date_Time.Minute := Natural(RTC_Periph.TR.MNU) + Natural(RTC_Periph.TR.MNT) * 10;
      Date_Time.Second := Natural(RTC_Periph.TR.SU) + Natural(RTC_Periph.TR.ST) * 10;
   end Read;

   procedure Add_Seconds (Date_Time : in out Date_Time_Type ;
      Second_Delta : Second_Delta_Type) is
      Total_Seconds : Natural;
   begin
      Total_Seconds :=
         Date_Time.Second +
         Date_Time.Minute * 60 +
         Date_Time.Hour * 60 * 60 + Second_Delta;
      Date_Time.Second := Total_Seconds mod 60;
      Date_Time.Minute := Total_Seconds mod (60 * 60) / 60;
      Date_Time.Hour := Total_Seconds / 3600;
      if Total_Seconds / (60 * 60) > Hour_Type'Last then
         Total_Seconds := Total_Seconds - Hour_Type'Last * (60 * 60);
      end if;
      Date_Time.Hour := Total_Seconds / (60 * 60);
   end Add_Seconds;

   procedure Add_Minutes (Date_Time : in out Date_Time_Type ;
      Minute_Delta : Minute_Delta_Type) is
      Total_Minutes : Natural;
   begin
      Total_Minutes := Date_Time.Minute + Date_Time.Hour * 60 + Minute_Delta;
      Date_Time.Minute := Total_Minutes mod 60;
      if Total_Minutes / 60 > Hour_Type'Last then
         Total_Minutes := Total_Minutes - Hour_Type'Last * 60;
      end if;
      Date_Time.Hour := Total_Minutes / 60;
   end Add_Minutes;

   procedure Set_Alarm (Date_Time : Date_Time_Type) is
      Wait : Natural;
   begin
      Set_False (RTC_IRQ.Alarm_Occurred);
      Unlock;
      RTC_Periph.ISR.ALRAF := 0;
      RTC_Periph.CR.ALRAE := 0;
      Wait := 10000;
      while RTC_Periph.ISR.ALRAWF = 0 and Wait > 0 loop
         Wait := Wait - 1;
      end loop;
      RTC_Periph.ALRMAR := (
         MSK1 => 0,
         ST => UInt3 (Date_Time.Second / 10),
         SU => UInt4 (Date_Time.Second mod 10),
         MSK2 => 0,
         MNT => UInt3 (Date_Time.Minute / 10),
         MNU => UInt4 (Date_Time.Minute mod 10),
         MSK3 => 0,
         PM => 0,
         HT => UInt2 (Date_Time.Hour / 10),
         HU => UInt4 (Date_Time.Hour mod 10),
         MSK4 => 1, WDSEL => 0, DT => 0, DU => 0);
      RTC_Periph.CR.ALRAE := 1;
      RTC_Periph.CR.ALRAIE := 1;
      Lock;
      EXTI_Periph.IMR.MR.Arr (17) := 1;
      EXTI_Periph.RTSR.TR.Arr (17) := 1;
   end Set_Alarm;

   procedure Init is
   begin
      RCC_Periph.APB1ENR.PWREN := 1;
      RCC_Periph.CSR.LSION := 1;
      while RCC_Periph.CSR.LSIRDY = 0 loop
         null;
      end loop;
      PWR_Periph.CR.DBP := 1;
      RCC_Periph.BDCR.RTCEN := 1;
      RCC_Periph.BDCR.RTCSEL := 2#10#;
   end Init;

end RTC;
