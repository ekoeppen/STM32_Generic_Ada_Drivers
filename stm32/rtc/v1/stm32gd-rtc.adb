with STM32_SVD; use STM32_SVD;
with STM32_SVD.NVIC; use STM32_SVD.NVIC;
with STM32_SVD.SCB; use STM32_SVD.SCB;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.RTC; use STM32_SVD.RTC;

with STM32GD.EXTI;

package body STM32GD.RTC is

   Days_Per_Month : constant array (0 .. 12) of Natural := (
      0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

   procedure Unlock is
   begin
      null;
   end Unlock;

   procedure Lock is
   begin
      null;
   end Lock;

   procedure Read (Date_Time : out Date_Time_Type) is
   begin
      null;
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
      Lock;
      EXTI.Enable_External_Interrupt (17, EXTI.Interrupt_Rising_Edge);
   end Set_Alarm;

   procedure Clear_Alarm is
      ICPR : UInt32;
   begin
      ICPR := NVIC_Periph.ICPR0;
      ICPR := ICPR or 2 ** 3;
      NVIC_Periph.ICPR0 := ICPR;
      EXTI.Clear_External_Interrupt (17);
      Unlock;
      RTC_Periph.CRL.ALRF := 0;
      Lock;
   end Clear_Alarm;

   procedure Init is
   begin
      null;
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
      loop
         STM32GD.Wait_For_Event;
         exit when Alarm_Triggered;
      end loop;
      Clear_Alarm;
   end Wait_For_Alarm;

   function Alarm_Triggered return Boolean is
   begin
      return RTC_Periph.CRL.ALRF = 1;
   end Alarm_Triggered;

end STM32GD.RTC;
