package STM32GD.CLOCK is

   pragma Preelaborate;

   type Clock_Type is (SYSCLK, PCLK1, PCLK2, HSI, LSI, LSE, HCLK, PLLCLK, RTCCLK);

   type PLL_Source_Type is (HSI_Input, HSE_Input);
   type RTC_Source_Type is (LSE_Input, HSE_Input, LSI_Input);
   type SYSCLK_Source_Type is (PLL_Input, HSI_Input, HSE_Input);

   subtype HSE_Range is Integer range 4_000_000 .. 32_000_000;
   subtype PLL_Prediv_Range is Integer range 1 .. 16;
   subtype PLL_Mul_Range is Integer range 1 .. 16;
   subtype PLL_Range is Integer range 16_000_000 .. 72_000_000;
   subtype PLL_Input_Range is Integer range 4_000_000 .. 16_000_000;
   subtype SYSCLK_Speed is Integer range 4_000_000 .. 72_000_000;
   type AHB_Prescaler_Type is (DIV1, DIV2, DIV4, DIV8, DIV16, 
      DIV64, DIV128, DIV256, DIV512);
   type APB_Prescaler_Type is (DIV1, DIV2, DIV4, DIV8, DIV16);

   HSI_Value : constant Integer := 8_000_000;
   LSI_Value : constant Integer := 40_000;
   

end STM32GD.CLOCK;
