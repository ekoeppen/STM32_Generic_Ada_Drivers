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
with Drivers.Text_IO;

package STM32GD.Board is

   package Clocks    is new STM32GD.Clock.Tree (LSE_Enabled => True);

   package BUTTON    is new STM32GD.GPIO (Pin => 7, Port => GPIOA_Periph);
   package SWO       is new STM32GD.GPIO (Pin => 3, Port => GPIOB_Periph, Alternate_Output => True);
   package LED       is new STM32GD.GPIO (Pin => 13, Port => GPIOC_Periph, Output => True);
   package LED2      is new STM32GD.GPIO (Pin => 9, Port => GPIOB_Periph, Output => True);
   package SCLK      is new STM32GD.GPIO (Pin => 5, Port => GPIOA_Periph, Alternate_Output => True);
   package MISO      is new STM32GD.GPIO (Pin => 6, Port => GPIOA_Periph, Alternate_Output => True);
   package MOSI      is new STM32GD.GPIO (Pin => 7, Port => GPIOA_Periph, Alternate_Output => True);
   package CSN       is new STM32GD.GPIO (Pin => 4, Port => GPIOA_Periph, Output => True);
   package TX        is new STM32GD.GPIO (Pin => 9, Port => GPIOA_Periph, Alternate_Output => True);
   package RX        is new STM32GD.GPIO (Pin => 10, Port => GPIOA_Periph);
   package SCL       is new STM32GD.GPIO (Pin => 6, Port => GPIOB_Periph, Open_Drain => True, Alternate_Output => True);
   package SDA       is new STM32GD.GPIO (Pin => 7, Port => GPIOB_Periph, Open_Drain => True, Alternate_Output => True);

   package SPI       is new STM32GD.SPI (SPI => STM32_SVD.SPI.SPI1_Periph);
   package USART     is new STM32GD.USART (USART => STM32_SVD.USART.USART2_Periph, Speed => 115200, Clock_Tree => STM32GD.Board.Clocks, Clock => STM32GD.Clock.HSI);
   package RTC       is new STM32GD.RTC (Clock_Tree => STM32GD.Board.Clocks, Clock => STM32GD.Clock.LSE);

   package Text_IO   is new Drivers.Text_IO (USART => STM32GD.Board.USART);

   procedure Init;
   procedure USB_Re_Enumerate;

end STM32GD.Board;
