--  This spec has been automatically generated from STM32F0xx.svd

--  Definition of the device's interrupts
package STM32_SVD.Interrupts is

   ----------------
   -- Interrupts --
   ----------------

   --  Window Watchdog interrupt
   WWDG                       : constant := 0;

   --  PVD through EXTI line detection
   PVD                        : constant := 1;

   --  RTC global interrupt
   RTC                        : constant := 2;

   --  Flash global interrupt
   FLASH                      : constant := 3;

   --  RCC global interrupt
   RCC                        : constant := 4;

   --  EXTI Line[1:0] interrupts
   EXTI0_1                    : constant := 5;

   --  EXTI Line[3:2] interrupts
   EXTI2_3                    : constant := 6;

   --  EXTI Line15 and EXTI4 interrupts
   EXTI4_15                   : constant := 7;

   --  Touch sensing interrupt
   TSC                        : constant := 8;

   --  DMA channel 1 interrupt
   DMA_CH1                    : constant := 9;

   --  DMA channel 2 and 3 interrupts
   DMA_CH2_3                  : constant := 10;

   --  DMA channel 4 and 5 interrupts
   DMA_CH4_5                  : constant := 11;

   --  ADC and comparator 1 and 2
   ADC_COMP                   : constant := 12;

   --  TIM1 Break, update, trigger and
   TIM1_BRK_UP                : constant := 13;

   --  TIM1 Capture Compare interrupt
   TIM1_CC                    : constant := 14;

   --  TIM2 global interrupt
   TIM2                       : constant := 15;

   --  TIM3 global interrupt
   TIM3                       : constant := 16;

   --  TIM6 global interrupt and DAC
   TIM6_DAC                   : constant := 17;

   --  TIM14 global interrupt
   TIM14                      : constant := 19;

   --  TIM15 global interrupt
   TIM15                      : constant := 20;

   --  TIM16 global interrupt
   TIM16                      : constant := 21;

   --  TIM17 global interrupt
   TIM17                      : constant := 22;

   --  I2C1 global interrupt
   I2C1                       : constant := 23;

   --  I2C2 global interrupt
   I2C2                       : constant := 24;

   --  SPI1_global_interrupt
   SPI1                       : constant := 25;

   --  SPI2 global interrupt
   SPI2                       : constant := 26;

   --  USART1 global interrupt
   USART1                     : constant := 27;

   --  USART2 global interrupt
   USART2                     : constant := 28;

   --  CEC global interrupt
   CEC                        : constant := 30;

end STM32_SVD.Interrupts;
