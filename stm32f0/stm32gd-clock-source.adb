with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.PWR; use STM32_SVD.PWR;
with STM32_SVD.RTC; use STM32_SVD.RTC;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;
with STM32_SVD.NVIC; use STM32_SVD.NVIC;

package body STM32GD.Clock.Source is

   procedure Init_PLLCLK is
      PLLMUL : UInt4;
   begin
      case Input is
         when HSI =>
            PLLMUL :=
               (if Frequency / 4_000_000 >= 16 then 15
               elsif Frequency / 4_000_000 >= 15 then 14
               elsif Frequency / 4_000_000 >= 14 then 13
               elsif Frequency / 4_000_000 >= 13 then 12
               elsif Frequency / 4_000_000 >= 12 then 11
               elsif Frequency / 4_000_000 >= 11 then 10
               elsif Frequency / 4_000_000 >= 10 then 9
               elsif Frequency / 4_000_000 >= 9 then 8
               elsif Frequency / 4_000_000 >= 8 then 7
               elsif Frequency / 4_000_000 >= 7 then 6
               elsif Frequency / 4_000_000 >= 6 then 5
               elsif Frequency / 4_000_000 >= 5 then 5
               elsif Frequency / 4_000_000 >= 4 then 3
               elsif Frequency / 4_000_000 >= 3 then 2
               elsif Frequency / 4_000_000 >= 2 then 1
               else 0);
            RCC_Periph.CFGR.PLLSRC := 0;
         when HSE =>
            PLLMUL := 0;
            RCC_Periph.CFGR.PLLSRC := 1;
         when others =>
            pragma Compile_Time_Error (Clock = PLLCLK and (Input /= HSI and Input /= HSE), "Invalid clock input for PLL clock");
      end case;
      RCC_Periph.CFGR.PLLMUL := PLLMUL;
      RCC_Periph.CR.PLLON := 1;
      while RCC_Periph.CR.PLLRDY = 0 loop null; end loop;
   end Init_PLLCLK;

   procedure Init_SYSCLK is
   begin
      case Input is
         when HSI =>
            RCC_Periph.CFGR.SW := 2#00#;
            while RCC_Periph.CFGR.SWS /= 2#00# loop null; end loop;
         when HSE =>
            RCC_Periph.CFGR.SW := 2#01#;
            while RCC_Periph.CFGR.SWS /= 2#01# loop null; end loop;
         when PLLCLK =>
            RCC_Periph.CFGR.SW := 2#10#;
            while RCC_Periph.CFGR.SWS /= 2#10# loop null; end loop;
         when others =>
            pragma Compile_Time_Error (Clock = SYSCLK and (Input /= PLLCLK and Input /= HSI and Input /= HSE), "Invalid clock input for system clock");
      end case;
   end Init_SYSCLK;

   procedure Init_RTCCLK is
      Div_A : UInt7;
      Div_S : UInt15;
   begin
      pragma Compile_Time_Error (Clock = RTCCLK and Frequency /= 1, "RTC clock can only run at 1Hz");
      RCC_Periph.APB1ENR.PWREN := 1;
      PWR_Periph.CR.DBP := 1;
      RCC_Periph.BDCR.RTCEN := 1;

      RTC_Periph.WPR.KEY := 16#CA#;
      RTC_Periph.WPR.KEY := 16#53#;
      RTC_Periph.ISR.INIT := 1;
      while RTC_Periph.ISR.INITF = 0 loop null; end loop;
      case Input is
         when LSE => Div_A := 127; Div_S := 255;
            RCC_Periph.BDCR.RTCSEL := 2#01#;
         when LSI => Div_A := 63; Div_S := 624;
            RCC_Periph.BDCR.RTCSEL := 2#10#;
         when HSE => Div_A := 127; Div_S := UInt15 (Input_Frequency / 128);
            RCC_Periph.BDCR.RTCSEL := 2#11#;
         when others =>
            pragma Compile_Time_Error (Clock = RTCCLK and (Input /= LSI and Input /= LSE and Input /= HSE), "Invalid clock input for RTC clock");
      end case;
      RTC_Periph.PRER.PREDIV_A := Div_A;
      RTC_Periph.PRER.PREDIV_S := Div_S;
      RTC_Periph.ISR.INIT := 0;
      RTC_Periph.WPR.KEY := 16#FF#;
   end Init_RTCCLK;

   procedure Init_LSI is
   begin
      RCC_Periph.CSR.LSION := 1;
      while RCC_Periph.CSR.LSIRDY = 0 loop null; end loop;
   end Init_LSI;

   procedure Init is
   begin
      case Clock is
         when SYSCLK => Init_SYSCLK;
         when PCLK => null;
         when HSI => null;
         when LSI => Init_LSI;
         when LSE => null;
         when HCLK => null;
         when RTCCLK => Init_RTCCLK;
         when PLLCLK => Init_PLLCLK;
      end case;
   end Init;

   procedure Delay_us (us : Natural) is
   begin
      null;
   end Delay_us;

   procedure Delay_ms (ms : Natural) is
   begin
      null;
   end Delay_ms;

   procedure Delay_RTCCLK_s (s : Natural) is
   begin
      RTC_Periph.WPR.KEY := 16#CA#;
      RTC_Periph.WPR.KEY := 16#53#;
      RTC_Periph.CR.ALRAE := 0;
      RTC_Periph.ISR.ALRAF := 0;

      RTC_Periph.ISR.INIT := 1;
      while RTC_Periph.ISR.INITF = 0 loop null; end loop;
      RTC_Periph.TR := (SU => 0, ST => 0, MNU => 0, MNT => 0, HU => 0, HT => 0, PM => 0, Reserved_23_31 => 0, others => 0);

      RTC_Periph.ALRMAR := (
         SU => UInt4 (s mod 10), ST => UInt3 (s / 10),
         MNU => UInt4 ((s / 60) mod 10), MNT => UInt3 ((s / 60) / 10),
         HU => UInt4 ((s / 3600) mod 10), HT => UInt2 ((s / 3600) / 10),
         DU => 0, DT => 0, PM => 0, MSK4 => 1, others => 0);
      RTC_Periph.CR.ALRAE := 1;
      RTC_Periph.CR.ALRAIE := 1;
      EXTI_Periph.IMR.MR.Arr (17) := 1;
      EXTI_Periph.RTSR.TR.Arr (17) := 1;

      RTC_Periph.ISR.INIT := 0;
      RTC_Periph.WPR.KEY := 16#FF#;
      --  NVIC_Periph.ICPR := 16#FFFF_FFFF#;
      --  NVIC_Periph.ICER := 16#0000_0000#;
      NVIC_Periph.ISER := 2#00000000_00000000_00000000_00000100#;
      WFI;
   end Delay_RTCCLK_s;

   procedure Delay_s (s : Natural) is
   begin
      case Clock is
         when RTCCLK => Delay_RTCCLK_s (s);
         when others => null;
      end case;
   end Delay_s;

   function Millisecond_Counter return Unsigned_32 is
   begin
      return 0;
   end Millisecond_Counter;

   procedure Delay_Slow_Periods (P : Unsigned_16) is
   begin
      null;
   end Delay_Slow_Periods;

   function Maximum_Delay_ms return Unsigned_16 is
   begin
      return 0;
   end Maximum_Delay_ms;

end STM32GD.Clock.Source;
