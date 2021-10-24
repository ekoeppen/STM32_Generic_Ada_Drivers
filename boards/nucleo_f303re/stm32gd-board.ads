with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.USART; use STM32_SVD.USART;
with STM32_SVD.SPI; use STM32_SVD.SPI;
with STM32_SVD.I2C;
with STM32GD.GPIO;
with STM32GD.USART;
with STM32GD.SPI;
with STM32GD.I2C;
with STM32GD.RTC;
with STM32GD.Clock;
with STM32GD.Clock.Tree;
with STM32_SVD.Interrupts;
with Drivers.Text_IO;

package STM32GD.Board is

   package Clocks is new STM32GD.Clock.Tree;

   package SCLK   is new STM32GD.GPIO (Pin => 5,
                                 Port => GPIOA_Periph,
                                 Alternate => True,
                                 Alternate_Function => 5);
   package MISO   is new STM32GD.GPIO (Pin => 6,
                                 Port => GPIOA_Periph,
                                 Alternate => True,
                                 Alternate_Function => 5);
   package MOSI   is new STM32GD.GPIO (Pin => 7,
                                 Port => GPIOA_Periph,
                                 Alternate => True,
                                 Alternate_Function => 5);
   package CSN    is new STM32GD.GPIO (Pin => 6,
                                 Port => GPIOB_Periph,
                                 Output => True);
   package BUTTON is new STM32GD.GPIO (Pin => 13,
                                 Port => GPIOC_Periph);
   package LED    is new STM32GD.GPIO (Pin => 5,
                                 Port => GPIOA_Periph,
                                 Output => True);
   package LED2   is new STM32GD.GPIO (Pin => 8,
                                 Port => GPIOC_Periph,
                                 Output => True);
   package LED3   is new STM32GD.GPIO (Pin => 6,
                                 Port => GPIOC_Periph,
                                 Output => True);
   package TX     is new STM32GD.GPIO (Pin => 2,
                                 Port => GPIOA_Periph,
                                 Pull_Up => True,
                                 Alternate => True,
                                 Alternate_Function => 7);
   package RX     is new STM32GD.GPIO (Pin => 3,
                                 Port => GPIOA_Periph,
                                 Pull_Up => True,
                                 Alternate => True,
                                 Alternate_Function => 7);
   package USART  is new STM32GD.USART (
      USART => STM32_SVD.USART.USART2_Periph, Speed => 115200,
      Clock => Clocks.PCLK1, Clock_Tree => Clocks);
   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);
   package SPI     is new STM32GD.SPI (SPI => STM32_SVD.SPI.SPI1_Periph);

   procedure Init;

end STM32GD.Board;
