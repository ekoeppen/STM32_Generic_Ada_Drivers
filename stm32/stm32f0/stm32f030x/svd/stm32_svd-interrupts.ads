--  This spec has been automatically generated from STM32F030.svd

--  Definition of the device's interrupts
package STM32_SVD.Interrupts is

   pragma Preelaborate;

   ----------------
   -- Interrupts --
   ----------------

   --  Window Watchdog interrupt
   WWDG                           : constant := 0;

   --  PVD and VDDIO2 supply comparator interrupt
   PVD                            : constant := 1;

   --  RCC and CRS global interrupts
   RCC_CRS                        : constant := 4;

   --  EXTI Line[1:0] interrupts
   EXTI0_1                        : constant := 5;

   --  EXTI Line[3:2] interrupts
   EXTI2_3                        : constant := 6;

   --  EXTI Line15 and EXTI4 interrupts
   EXTI4_15                       : constant := 7;

   --  DMA channel 1 interrupt
   DMA_CH1                        : constant := 9;

   --  DMA channel 2 and 3 interrupts
   DMA_CH2_3                      : constant := 10;

   --  DMA channel 4, 5, 6 and 7 interrupts
   DMA_CH4_5_6_7                  : constant := 11;

   --  ADC and comparator interrupts
   ADC_COMP                       : constant := 12;

   --  TIM1 break, update, trigger and commutation interrupt
   TIM1_BRK_UP_TRG_COM            : constant := 13;

   --  TIM1 Capture Compare interrupt
   TIM1_CC                        : constant := 14;

   --  TIM2 global interrupt
   TIM2                           : constant := 15;

   --  TIM3 global interrupt
   TIM3                           : constant := 16;

   --  TIM6 global interrupt and DAC underrun interrupt
   TIM6_DAC                       : constant := 17;

   --  TIM7 global interrupt
   TIM7                           : constant := 18;

   --  TIM14 global interrupt
   TIM14                          : constant := 19;

   --  I2C1 global interrupt
   I2C1                           : constant := 23;

   --  I2C2 global interrupt
   I2C2                           : constant := 24;

   --  SPI1_global_interrupt
   SPI1                           : constant := 25;

   --  SPI2 global interrupt
   SPI2                           : constant := 26;

   --  USART1 global interrupt
   USART1                         : constant := 27;

   --  USART2 global interrupt
   USART2                         : constant := 28;

   --  USART3 and USART4 global interrupt
   USART3_4                       : constant := 29;

   Number_Of_Interrupts           : constant := 30;

end STM32_SVD.Interrupts;
