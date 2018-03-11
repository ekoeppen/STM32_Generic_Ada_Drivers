--  This spec has been automatically generated from STM32F103.svd

--  Definition of the device's interrupts
package STM32_SVD.Interrupts is

   ----------------
   -- Interrupts --
   ----------------

   --  Window Watchdog interrupt
   WWDG                       : constant := 0;

   --  PVD through EXTI line detection interrupt
   PVD                        : constant := 1;

   --  Tamper interrupt
   TAMPER                     : constant := 2;

   --  RTC global interrupt
   RTC                        : constant := 3;

   --  Flash global interrupt
   FLASH                      : constant := 4;

   --  RCC global interrupt
   RCC                        : constant := 5;

   --  EXTI Line0 interrupt
   EXTI0                      : constant := 6;

   --  EXTI Line1 interrupt
   EXTI1                      : constant := 7;

   --  EXTI Line2 interrupt
   EXTI2                      : constant := 8;

   --  EXTI Line3 interrupt
   EXTI3                      : constant := 9;

   --  EXTI Line4 interrupt
   EXTI4                      : constant := 10;

   --  DMA1 Channel1 global interrupt
   DMA1_Channel1              : constant := 11;

   --  DMA1 Channel2 global interrupt
   DMA1_Channel2              : constant := 12;

   --  DMA1 Channel3 global interrupt
   DMA1_Channel3              : constant := 13;

   --  DMA1 Channel4 global interrupt
   DMA1_Channel4              : constant := 14;

   --  DMA1 Channel5 global interrupt
   DMA1_Channel5              : constant := 15;

   --  DMA1 Channel6 global interrupt
   DMA1_Channel6              : constant := 16;

   --  DMA1 Channel7 global interrupt
   DMA1_Channel7              : constant := 17;

   --  ADC1 and ADC2 global interrupt
   ADC1_2                     : constant := 18;

   --  USB High Priority or CAN TX interrupts
   USB_HP_CAN_TX              : constant := 19;

   --  USB Low Priority or CAN RX0 interrupts
   USB_LP_CAN_RX0             : constant := 20;

   --  CAN RX1 interrupt
   CAN_RX1                    : constant := 21;

   --  CAN SCE interrupt
   CAN_SCE                    : constant := 22;

   --  EXTI Line[9:5] interrupts
   EXTI9_5                    : constant := 23;

   --  TIM1 Break interrupt
   TIM1_BRK                   : constant := 24;

   --  TIM1 Update interrupt
   TIM1_UP                    : constant := 25;

   --  TIM1 Trigger and Commutation interrupts
   TIM1_TRG_COM               : constant := 26;

   --  TIM1 Capture Compare interrupt
   TIM1_CC                    : constant := 27;

   --  TIM2 global interrupt
   TIM2                       : constant := 28;

   --  TIM3 global interrupt
   TIM3                       : constant := 29;

   --  TIM4 global interrupt
   TIM4                       : constant := 30;

   --  I2C1 event interrupt
   I2C1_EV                    : constant := 31;

   --  I2C1 error interrupt
   I2C1_ER                    : constant := 32;

   --  I2C2 event interrupt
   I2C2_EV                    : constant := 33;

   --  I2C2 error interrupt
   I2C2_ER                    : constant := 34;

   --  SPI1 global interrupt
   SPI1                       : constant := 35;

   --  SPI2 global interrupt
   SPI2                       : constant := 36;

   --  USART1 global interrupt
   USART1                     : constant := 37;

   --  USART2 global interrupt
   USART2                     : constant := 38;

   --  USART3 global interrupt
   USART3                     : constant := 39;

   --  EXTI Line[15:10] interrupts
   EXTI15_10                  : constant := 40;

   --  RTC Alarms through EXTI line interrupt
   RTCAlarm                   : constant := 41;

   --  TIM8 Break interrupt
   TIM8_BRK                   : constant := 43;

   --  TIM8 Update interrupt
   TIM8_UP                    : constant := 44;

   --  TIM8 Trigger and Commutation interrupts
   TIM8_TRG_COM               : constant := 45;

   --  TIM8 Capture Compare interrupt
   TIM8_CC                    : constant := 46;

   --  ADC3 global interrupt
   ADC3                       : constant := 47;

   --  FSMC global interrupt
   FSMC                       : constant := 48;

   --  SDIO global interrupt
   SDIO                       : constant := 49;

   --  TIM5 global interrupt
   TIM5                       : constant := 50;

   --  SPI3 global interrupt
   SPI3                       : constant := 51;

   --  UART4 global interrupt
   UART4                      : constant := 52;

   --  UART5 global interrupt
   UART5                      : constant := 53;

   --  TIM6 global interrupt
   TIM6                       : constant := 54;

   --  TIM7 global interrupt
   TIM7                       : constant := 55;

   --  DMA2 Channel1 global interrupt
   DMA2_Channel1              : constant := 56;

   --  DMA2 Channel2 global interrupt
   DMA2_Channel2              : constant := 57;

   --  DMA2 Channel3 global interrupt
   DMA2_Channel3              : constant := 58;

   --  DMA2 Channel4 and DMA2 Channel5 global interrupt
   DMA2_Channel4_5            : constant := 59;

end STM32_SVD.Interrupts;
