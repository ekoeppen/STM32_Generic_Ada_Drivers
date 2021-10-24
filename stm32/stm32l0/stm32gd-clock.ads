package STM32GD.Clock is

   pragma Preelaborate;

   type Clock_Type is (SYSCLK, PCLK1, PCLK2, MSI, HSI, LSI, LSE, HCLK, PLLCLK, RTCCLK);

   type PLL_Source_Type is (HSI, HSE);
   type RTC_Source_Type is (LSE, HSE, LSI);
   type SYSCLK_Source_Type is (PLL, HSI, HSE, MSI);

   subtype MSI_Range is Integer range 1024 * 64 ..  4 * 1024 * 1024;
   subtype HSE_Range is Integer range 4_000_000 .. 32_000_000;
   subtype PLL_Prediv_Range is Integer range 1 .. 16;
   subtype PLL_Mul_Range is Integer range 1 .. 16;
   subtype PLL_Range is Integer range 16_000_000 .. 48_000_000;
   subtype PLL_Input_Range is Integer range 4_000_000 .. 32_000_000;
   subtype SYSCLK_Speed is Integer range 4_000_000 .. 48_000_000;
   type AHB_Prescaler_Type is (DIV1, DIV2, DIV4, DIV8, DIV16,
      DIV64, DIV128, DIV256, DIV512);
   type APB1_Prescaler_Type is (DIV1, DIV2, DIV4, DIV8, DIV16);
   type APB2_Prescaler_Type is (DIV1, DIV2, DIV4, DIV8, DIV16);

   HSI_Value : constant Integer := 16_000_000;
   MSI_Value : constant Integer := 2 * 1024 * 1024;
   LSI_Value : constant Integer := 37_000;
   LSE_Value : constant Integer := 32_768;

end STM32GD.Clock;
