generic

   HSE_Value : HSE_Range := 8_000_000;
   PLL_Source : PLL_Source_Type := HSI;
   SYSCLK_Source : SYSCLK_Source_Type := HSI;
   RTC_Source : RTC_Source_Type := LSI;

   PLL_Prediv : PLL_Prediv_Range := 1;
   PLL_Mul : PLL_Mul_Range := 1;

   AHB_Prescaler : AHB_Prescaler_Type := DIV1;
   APB1_Prescaler : APB1_Prescaler_Type := DIV1;
   APB2_Prescaler : APB2_Prescaler_Type := DIV1;

   LSI_Enabled : Boolean := True;
   LSE_Enabled : Boolean := False;

package STM32GD.Clock.Tree is

   pragma Preelaborate;

   PLL_Value : constant Integer := (
     case PLL_Source is
       when HSI => HSI_Value / 2,
       when HSE => HSE_Value / PLL_Prediv);

   PLL_Output_Value : constant Integer := (PLL_Value / PLL_Prediv) * PLL_Mul;

   SYSCLK : constant Integer := (
     case SYSCLK_Source is
       when HSI => HSI_Value,
       when MSI => MSI_Value,
       when PLL => PLL_Output_Value,
       when HSE => HSE_Value);

   HCLK : constant Integer := (
     case AHB_Prescaler is
       when DIV1   => SYSCLK,
       when DIV2   => SYSCLK / 2,
       when DIV4   => SYSCLK / 4,
       when DIV8   => SYSCLK / 8,
       when DIV16  => SYSCLK / 16,
       when DIV64  => SYSCLK / 64,
       when DIV128 => SYSCLK / 128,
       when DIV256 => SYSCLK / 256,
       when DIV512 => SYSCLK / 512);

   PCLK1 : constant Integer := (
     case APB1_Prescaler is
       when DIV1  => HCLK,
       when DIV2  => HCLK / 2,
       when DIV4  => HCLK / 4,
       when DIV8  => HCLK / 8,
       when DIV16 => HCLK / 16);

   PCLK2 : constant Integer := (
     case APB2_Prescaler is
       when DIV1  => HCLK,
       when DIV2  => HCLK / 2,
       when DIV4  => HCLK / 4,
       when DIV8  => HCLK / 8,
       when DIV16 => HCLK / 16);

   RTCCLK : constant Integer := (
      case RTC_Source is
         when LSI => LSI_Value,
         when LSE => LSE_Value,
         when HSE => HSE_Value / 32);

   function Frequency (Clock : Clock_Type) return Integer;
   procedure Init;

end STM32GD.Clock.Tree;
