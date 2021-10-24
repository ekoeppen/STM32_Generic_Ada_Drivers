pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x3.svd

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

   --  DMA1 Channel1 global interrupt
   DMA1_Channel1              : constant := 9;

   --  DMA1 Channel2 and 3 interrupts
   DMA1_Channel2_3            : constant := 10;

   --  DMA1 Channel4 to 7 interrupts
   DMA1_Channel4_7            : constant := 11;

   --  ADC and comparator 1 and 2
   ADC_COMP                   : constant := 12;

   --  LPTIMER1 interrupt through EXTI29
   LPTIM1                     : constant := 13;

   --  USART4/USART5 global interrupt
   USART4_USART5              : constant := 14;

   --  TIM2 global interrupt
   TIM2                       : constant := 15;

   --  TIM3 global interrupt
   TIM3                       : constant := 16;

   --  TIM6 global interrupt and DAC
   TIM6_DAC                   : constant := 17;

   --  TIM7 global interrupt and DAC
   TIM7                       : constant := 18;

   --  TIMER21 global interrupt
   TIM21                      : constant := 20;

   --  I2C3 global interrupt
   I2C3                       : constant := 21;

   --  TIMER22 global interrupt
   TIM22                      : constant := 22;

   --  I2C1 global interrupt
   I2C1                       : constant := 23;

   --  I2C2 global interrupt
   I2C2                       : constant := 24;

   --  SPI1_global          
   SPI1                       : constant := 25;

   --  SPI2 global interrupt
   SPI2                       : constant := 26;

   --  USART1 global interrupt
   USART1                     : constant := 27;

   --  USART2 global interrupt
   USART2                     : constant := 28;

   --  AES global interrupt RNG global interrupt and LPUART1 global interrupt
   --  through
   AES_RNG_LPUART1            : constant := 29;

   --  LCD global interrupt
   LCD                        : constant := 30;

   --  USB event interrupt through EXTI18
   USB                        : constant := 31;

   Number_Of_Interrupts       : constant := 31;

end STM32_SVD.Interrupts;
