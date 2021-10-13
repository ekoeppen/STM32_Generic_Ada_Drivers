--  This spec has been automatically generated from STM32F303xE.svd

--  Definition of the device's interrupts
package STM32_SVD.Interrupts is

   pragma Preelaborate;

   ----------------
   -- Interrupts --
   ----------------

   --  Window Watchdog interrupt
   WWDG                          : constant := 0;

   --  PVD through EXTI line detection interrupt
   PVD                           : constant := 1;

   --  Tamper and TimeStamp interrupts
   TAMP_STAMP                    : constant := 2;

   --  RTC Wakeup interrupt through the EXTI line
   RTC_WKUP                      : constant := 3;

   --  Flash global interrupt
   FLASH                         : constant := 4;

   --  RCC global interrupt
   RCC                           : constant := 5;

   --  EXTI Line0 interrupt
   EXTI0                         : constant := 6;

   --  EXTI Line3 interrupt
   EXTI1                         : constant := 7;

   --  EXTI Line2 and Touch sensing interrupts
   EXTI2_TSC                     : constant := 8;

   --  EXTI Line3 interrupt
   EXTI3                         : constant := 9;

   --  EXTI Line4 interrupt
   EXTI4                         : constant := 10;

   --  DMA1 channel 1 interrupt
   DMA1_CH1                      : constant := 11;

   --  DMA1 channel 2 interrupt
   DMA1_CH2                      : constant := 12;

   --  DMA1 channel 3 interrupt
   DMA1_CH3                      : constant := 13;

   --  DMA1 channel 4 interrupt
   DMA1_CH4                      : constant := 14;

   --  DMA1 channel 5 interrupt
   DMA1_CH5                      : constant := 15;

   --  DMA1 channel 6 interrupt
   DMA1_CH6                      : constant := 16;

   --  DMA1 channel 7interrupt
   DMA1_CH7                      : constant := 17;

   --  ADC1 and ADC2 global interrupt
   ADC1_2                        : constant := 18;

   --  USB High Priority/CAN_TX interrupts
   USB_HP_CAN_TX                 : constant := 19;

   --  USB Low Priority/CAN_RX0 interrupts
   USB_LP_CAN_RX0                : constant := 20;

   --  CAN_RX1 interrupt
   CAN_RX1                       : constant := 21;

   --  CAN_SCE interrupt
   CAN_SCE                       : constant := 22;

   --  EXTI Line5 to Line9 interrupts
   EXTI9_5                       : constant := 23;

   --  TIM1 Break/TIM15 global interruts
   TIM1_BRK_TIM15                : constant := 24;

   --  TIM1 Update/TIM16 global interrupts
   TIM1_UP_TIM16                 : constant := 25;

   --  TIM1 trigger and commutation/TIM17 interrupts
   TIM1_TRG_COM_TIM17            : constant := 26;

   --  TIM1 capture compare interrupt
   TIM1_CC                       : constant := 27;

   --  TIM2 global interrupt
   TIM2                          : constant := 28;

   --  TIM3 global interrupt
   TIM3                          : constant := 29;

   --  TIM4 global interrupt
   TIM4                          : constant := 30;

   --  I2C1 event interrupt and EXTI Line23 interrupt
   I2C1_EV_EXTI23                : constant := 31;

   --  I2C1 error interrupt
   I2C1_ER                       : constant := 32;

   --  I2C2 event interrupt & EXTI Line24 interrupt
   I2C2_EV_EXTI24                : constant := 33;

   --  I2C2 error interrupt
   I2C2_ER                       : constant := 34;

   --  SPI1 global interrupt
   SPI1                          : constant := 35;

   --  SPI2 global interrupt
   SPI2                          : constant := 36;

   --  USART1 global interrupt and EXTI Line 25 interrupt
   USART1_EXTI25                 : constant := 37;

   --  USART2 global interrupt and EXTI Line 26 interrupt
   USART2_EXTI26                 : constant := 38;

   --  USART3 global interrupt and EXTI Line 28 interrupt
   USART3_EXTI28                 : constant := 39;

   --  EXTI Line15 to Line10 interrupts
   EXTI15_10                     : constant := 40;

   --  RTC alarm interrupt
   RTCAlarm                      : constant := 41;

   --  USB wakeup from Suspend
   USB_WKUP                      : constant := 42;

   --  TIM8 break interrupt
   TIM8_BRK                      : constant := 43;

   --  TIM8 update interrupt
   TIM8_UP                       : constant := 44;

   --  TIM8 Trigger and commutation interrupts
   TIM8_TRG_COM                  : constant := 45;

   --  TIM8 capture compare interrupt
   TIM8_CC                       : constant := 46;

   --  ADC3 global interrupt
   ADC3                          : constant := 47;

   --  SPI3 global interrupt
   SPI3                          : constant := 51;

   --  UART4 global and EXTI Line 34 interrupts
   UART4_EXTI34                  : constant := 52;

   --  UART5 global and EXTI Line 35 interrupts
   UART5_EXTI35                  : constant := 53;

   --  TIM6 global and DAC12 underrun interrupts
   TIM6_DACUNDER                 : constant := 54;

   --  TIM7 global interrupt
   TIM7                          : constant := 55;

   --  DMA2 channel1 global interrupt
   DMA2_CH1                      : constant := 56;

   --  DMA2 channel2 global interrupt
   DMA2_CH2                      : constant := 57;

   --  DMA2 channel3 global interrupt
   DMA2_CH3                      : constant := 58;

   --  DMA2 channel4 global interrupt
   DMA2_CH4                      : constant := 59;

   --  DMA2 channel5 global interrupt
   DMA2_CH5                      : constant := 60;

   --  ADC4 global interrupt
   ADC4                          : constant := 61;

   --  COMP1 & COMP2 & COMP3 interrupts combined with EXTI Lines 21, 22 and 29
   --  interrupts
   COMP123                       : constant := 64;

   --  COMP4 & COMP5 & COMP6 interrupts combined with EXTI Lines 30, 31 and 32
   --  interrupts
   COMP456                       : constant := 65;

   --  COMP7 interrupt combined with EXTI Line 33 interrupt
   COMP7                         : constant := 66;

   --  USB High priority interrupt
   USB_HP                        : constant := 74;

   --  USB Low priority interrupt
   USB_LP                        : constant := 75;

   --  USB wakeup from Suspend and EXTI Line 18
   USB_WKUP_EXTI                 : constant := 76;

   --  Floating point interrupt
   FPU                           : constant := 81;

   Number_Of_Interrupts          : constant := 81;

end STM32_SVD.Interrupts;
