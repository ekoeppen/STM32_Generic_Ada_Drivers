--  This spec has been automatically generated from STM32F411xx.svd

--  Definition of the device's interrupts
package STM32_SVD.Interrupts is

   ----------------
   -- Interrupts --
   ----------------

   --  PVD through EXTI line detection interrupt
   PVD                           : constant := 1;

   --  Tamper and TimeStamp interrupts through the EXTI line
   TAMP_STAMP                    : constant := 2;

   --  RTC Wakeup interrupt through the EXTI line
   RTC_WKUP                      : constant := 3;

   --  FLASH global interrupt
   FLASH                         : constant := 4;

   --  RCC global interrupt
   RCC                           : constant := 5;

   --  EXTI Line0 interrupt
   EXTI0                         : constant := 6;

   --  EXTI Line1 interrupt
   EXTI1                         : constant := 7;

   --  EXTI Line2 interrupt
   EXTI2                         : constant := 8;

   --  EXTI Line3 interrupt
   EXTI3                         : constant := 9;

   --  EXTI Line4 interrupt
   EXTI4                         : constant := 10;

   --  ADC1 global interrupt
   ADC                           : constant := 18;

   --  EXTI Line[9:5] interrupts
   EXTI9_5                       : constant := 23;

   --  TIM1 Break interrupt and TIM9 global interrupt
   TIM1_BRK_TIM9                 : constant := 24;

   --  TIM1 Update interrupt and TIM10 global interrupt
   TIM1_UP_TIM10                 : constant := 25;

   --  TIM1 Trigger and Commutation interrupts and TIM11 global interrupt
   TIM1_TRG_COM_TIM11            : constant := 26;

   --  TIM1 Capture Compare interrupt
   TIM1_CC                       : constant := 27;

   --  TIM2 global interrupt
   TIM2                          : constant := 28;

   --  TIM3 global interrupt
   TIM3                          : constant := 29;

   --  I2C1 event interrupt
   I2C1_EV                       : constant := 31;

   --  I2C1 error interrupt
   I2C1_ER                       : constant := 32;

   --  I2C2 event interrupt
   I2C2_EV                       : constant := 33;

   --  I2C2 error interrupt
   I2C2_ER                       : constant := 34;

   --  SPI1 global interrupt
   SPI1                          : constant := 35;

   --  SPI2 global interrupt
   SPI2                          : constant := 36;

   --  EXTI Line[15:10] interrupts
   EXTI15_10                     : constant := 40;

   --  RTC Alarms (A and B) through EXTI line interrupt
   RTC_Alarm                     : constant := 41;

   --  USB On-The-Go FS Wakeup through EXTI line interrupt
   OTG_FS_WKUP                   : constant := 42;

   --  SDIO global interrupt
   SDIO                          : constant := 49;

   --  SPI3 global interrupt
   SPI3                          : constant := 51;

   --  USB On The Go FS global interrupt
   OTG_FS                        : constant := 67;

   --  I2C3 event interrupt
   I2C3_EV                       : constant := 72;

   --  I2C3 error interrupt
   I2C3_ER                       : constant := 73;

   --  SPI4 global interrupt
   SPI4                          : constant := 84;

end STM32_SVD.Interrupts;
