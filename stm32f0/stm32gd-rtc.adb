with STM32_SVD; use STM32_SVD;
with STM32_SVD.NVIC; use STM32_SVD.NVIC;
with STM32_SVD.SCB; use STM32_SVD.SCB;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.RTC; use STM32_SVD.RTC;

package body STM32GD.RTC is

   Days_Per_Month : constant array (0 .. 12) of Natural := (
      0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

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
   begin
      Unlock;
      RTC_Periph.CR.ALRAIE := 0;
      RTC_Periph.ISR.ALRAF := 0;
      RTC_Periph.CR.ALRAE := 0;
      while RTC_Periph.ISR.ALRAWF = 0 loop
         null;
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
      EXTI_Periph.EMR.MR.Arr (17) := 1;
      EXTI_Periph.RTSR.TR.Arr (17) := 1;
   end Set_Alarm;

   procedure Clear_Alarm is
      ICPR : UInt32;
   begin
      ICPR := NVIC_Periph.ICPR;
      ICPR := ICPR or 2 ** 3;
      NVIC_Periph.ICPR := ICPR;
      EXTI_Periph.PR.PR.Arr (17) := 1;
      Unlock;
      RTC_Periph.ISR.ALRAF := 0;
      RTC_Periph.CR.ALRAE := 0;
      RTC_Periph.CR.ALRAIE := 0;
      Lock;
   end Clear_Alarm;

   procedure Init is
      use STM32GD.Clock;
   begin
      RCC_Periph.APB1ENR.PWREN := 1;
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

   function To_Seconds (Date_Time : Date_Time_Type) return Natural is
   begin
      return Date_Time.Second +
         Date_Time.Minute * 60 +
         Date_Time.Hour * 60 * 60 +
         (Date_Time.Day - 1) * 24 * 60 * 60 +
         Days_Per_Month (Date_Time.Month - 1) * 24 * 60 * 60 +
         Date_Time.Year * 365 * 24 * 60 * 60;
   end To_Seconds;

   procedure Wait_For_Alarm is
   begin
      SCB.SCB_Periph.SCR.SEVEONPEND := 1;
      loop
         STM32GD.WFE;
         exit when RTC_Periph.ISR.ALRAF = 1;
      end loop;
      Clear_Alarm;
   end Wait_For_Alarm;

end STM32GD.RTC;
