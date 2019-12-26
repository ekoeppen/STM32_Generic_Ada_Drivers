with System;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32_SVD; use STM32_SVD;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.GPIO; use STM32_SVD.GPIO;

with STM32GD.RTC;
with STM32GD.Board; use STM32GD.Board;
with Drivers.Text_IO;

with RTC_IRQ;

procedure Main is

   package RTC renames STM32GD.RTC;
   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);
   use Text_IO;

   procedure Print_Date is new STM32GD.RTC.Print (Put => Text_IO.Put);

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
      GPIOA_Periph.MODER.Val := 16#28FF_FFFF#;
      GPIOB_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOC_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOD_Periph.MODER.Val := 16#FFFF_FFFF#;
      GPIOF_Periph.MODER.Val := 16#FFFF_FFFF#;

      RCC_Periph.AHBENR.IOPAEN := 0;
      RCC_Periph.AHBENR.IOPBEN := 0;
      RCC_Periph.AHBENR.IOPCEN := 0;
      RCC_Periph.AHBENR.IOPDEN := 0;
      RCC_Periph.AHBENR.IOPFEN := 0;
   end Disable_Peripherals;

   Date_Time : RTC.Date_Time_Type;

begin
   Init;
   RTC.Init;
   LED2.Set;
   --  Enable_Stop_Mode (True);
   loop
      Print_Date (Date_Time);
      RTC.Read (Date_Time);
      RTC.Add_Seconds (Date_Time, 1);
      RTC.Set_Alarm (Date_Time);
      Set_False (RTC_IRQ.Alarm_Occurred);
      Suspend_Until_True (RTC_IRQ.Alarm_Occurred);
      LED2.Toggle;
   end loop;
end Main;
