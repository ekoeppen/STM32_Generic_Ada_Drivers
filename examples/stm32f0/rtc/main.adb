with System;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with STM32_SVD; use STM32_SVD;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.RTC; use STM32_SVD.RTC;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;
with STM32_SVD.NVIC; use STM32_SVD.NVIC;
with STM32_SVD.GPIO; use STM32_SVD.GPIO;

with Ada.Real_Time; use Ada.Real_Time;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.Board; use STM32GD.Board;

with RTC_IRQ;

procedure Main is
   subtype Year_Type         is Natural range 2000 .. 2099;
   subtype Month_Type        is Natural range 1 .. 12;
   subtype Day_Type          is Natural range 1 .. 31;
   subtype Hour_Type         is Natural range 0 .. 23;
   subtype Minute_Type       is Natural range 0 .. 59;
   subtype Second_Type       is Natural range 0 .. 59;
   subtype Second_Delta_Type is Natural range 0 .. (60 * 60 * 24);
   subtype Minute_Delta_Type is Natural range 0 .. (60 * 24);

   type Date_Time_Type is record
      Year   : Year_Type;
      Month  : Month_Type;
      Day    : Day_Type;
      Hour   : Hour_Type;
      Minute : Minute_Type;
      Second : Second_Type;
   end record;

   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (1000);
   Date_Time    : Date_Time_Type;

   procedure Unlock_RTC is
   begin
      RTC_Periph.WPR.KEY := 16#CA#;
      RTC_Periph.WPR.KEY := 16#53#;
   end Unlock_RTC;

   procedure Lock_RTC is
   begin
      RTC_Periph.WPR.KEY := 16#FF#;
   end Lock_RTC;

   procedure Read_RTC (Date_Time : out Date_Time_Type) is
   begin
      Date_Time.Day := Natural(RTC_Periph.DR.DU) + Natural(RTC_Periph.DR.DT) * 10;
      Date_Time.Month := Natural(RTC_Periph.DR.MU) + Natural(RTC_Periph.DR.MT) * 10;
      Date_Time.Year := Natural(RTC_Periph.DR.YU) + Natural(RTC_Periph.DR.YT) * 10;
      Date_Time.Hour := Natural(RTC_Periph.TR.HU) + Natural(RTC_Periph.TR.HT) * 10;
      Date_Time.Minute := Natural(RTC_Periph.TR.MNU) + Natural(RTC_Periph.TR.MNT) * 10;
      Date_Time.Second := Natural(RTC_Periph.TR.SU) + Natural(RTC_Periph.TR.ST) * 10;
   end Read_RTC;

   procedure Print (Date_Time : Date_Time_Type) is
   begin
      Put (Integer'Image (Date_Time.Year));
      Put (Integer'Image (Date_Time.Month));
      Put (Integer'Image (Date_Time.Day));
      Put (Integer'Image (Date_Time.Hour));
      Put (Integer'Image (Date_Time.Minute));
      Put_Line (Integer'Image (Date_Time.Second));
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
      Set_False (RTC_IRQ.Alarm_Occurred);
      Unlock_RTC;
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
      Lock_RTC;
      EXTI_Periph.IMR.MR.Arr (17) := 1;
      EXTI_Periph.RTSR.TR.Arr (17) := 1;
   end Set_Alarm;

   procedure Setup_RTC is
   begin
      RCC_Periph.APB1ENR.PWREN := 1;
      RCC_Periph.CSR.LSION := 1;
      while RCC_Periph.CSR.LSIRDY = 0 loop
         null;
      end loop;
      PWR_Periph.CR.DBP := 1;
      RCC_Periph.BDCR.RTCEN := 1;
      RCC_Periph.BDCR.RTCSEL := 2#10#;
   end Setup_RTC;

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

   procedure Disable_Peripherals is
   begin
      RCC_Periph.AHBENR.IOPAEN := 1;
      RCC_Periph.AHBENR.IOPBEN := 1;
      RCC_Periph.AHBENR.IOPCEN := 1;
      RCC_Periph.AHBENR.IOPDEN := 1;
      RCC_Periph.AHBENR.IOPFEN := 1;
      GPIOA_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOB_Periph.MODER.Val := 16#FFFF_FFFF#;
      --  GPIOC_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOD_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOF_Periph.MODER.Val := 16#FFFF_FFFF#;

      RCC_Periph.AHBENR.IOPAEN := 0;
      RCC_Periph.AHBENR.IOPBEN := 0;
      RCC_Periph.AHBENR.IOPCEN := 0;
      RCC_Periph.AHBENR.IOPDEN := 0;
      RCC_Periph.AHBENR.IOPFEN := 0;
      RCC_Periph.APB2ENR.USART1EN := 0;
   end Disable_Peripherals;

begin
   Init;
   Setup_RTC;
   LED_GREEN.Set;
   --  Put_Line ("==== Start");
   Read_RTC (Date_Time);
   Enable_Stop_Mode (True);
   Disable_Peripherals;
   loop
      Read_RTC (Date_Time);
      --  Put ("Now:      ");
      --  Print (Date_Time);
      Add_Seconds (Date_Time, 10);
      Set_Alarm (Date_Time);
      --  Put ("Alarm set:");
      --  Print (Date_Time);
      RCC_Periph.AHBENR.IOPCEN := 0;
      Suspend_Until_True (RTC_IRQ.Alarm_Occurred);

      RCC_Periph.AHBENR.IOPCEN := 1;
      LED_GREEN.Toggle;
      Read_RTC (Date_Time);
      --  Put_Line ("---- Alarm");
   end loop;
end Main;
