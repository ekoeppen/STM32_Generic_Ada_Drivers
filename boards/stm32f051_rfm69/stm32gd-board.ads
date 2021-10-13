with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.USART; use STM32_SVD.USART;
with STM32_SVD.I2C; use STM32_SVD.I2C;
with STM32_SVD.SPI; use STM32_SVD.SPI;
with STM32GD.GPIO;
with STM32GD.USART;
with STM32GD.SPI;
with STM32GD.I2C;
with STM32GD.RTC;
with STM32GD.Clock;
with STM32GD.Clock.Tree;
with Drivers.Text_IO;
with Drivers.RFM69;

package STM32GD.Board is

   package Clocks      is new STM32GD.Clock.Tree;

   package BUTTON       is new STM32GD.GPIO (Pin => 0, Port => GPIOA_Periph);
   package LED          is new STM32GD.GPIO (Pin => 1, Port => GPIOB_Periph, Output => True);
   package LED2         is new STM32GD.GPIO (Pin => 0, Port => GPIOB_Periph, Output => True);
   package LED3         is new STM32GD.GPIO (Pin => 3, Port => GPIOB_Periph, Output => True);
   package SCLK         is new STM32GD.GPIO (Pin => 5, Port => GPIOA_Periph, Alternate => True);
   package MISO         is new STM32GD.GPIO (Pin => 6, Port => GPIOA_Periph, Alternate => True);
   package MOSI         is new STM32GD.GPIO (Pin => 7, Port => GPIOA_Periph, Alternate => True);
   package CSN          is new STM32GD.GPIO (Pin => 4, Port => GPIOA_Periph, Output => True);
   package TX           is new STM32GD.GPIO (Pin => 9, Port => GPIOA_Periph, Pull_Up => True, Alternate => True, Alternate_Function => 1);
   package RX           is new STM32GD.GPIO (Pin => 10, Port => GPIOA_Periph, Pull_Up => True, Alternate => True, Alternate_Function => 1);
   package RFM69_RESET  is new STM32GD.GPIO (Pin => 2, Port => GPIOA_Periph, Output => True);
   package IRQ          is new STM32GD.GPIO (Pin => 3, Port => GPIOA_Periph);
   package SCL          is new STM32GD.GPIO (Pin => 6, Port => GPIOB_Periph, Alternate => True, Alternate_Function => 1);
   package SCL_OUT      is new STM32GD.GPIO (Pin => 6, Port => GPIOB_Periph, Output => True);
   package SDA          is new STM32GD.GPIO (Pin => 7, Port => GPIOB_Periph, Alternate => True, Alternate_Function => 1);

   package SPI          is new STM32GD.SPI (SPI => STM32_SVD.SPI.SPI1_Periph);
   package I2C          is new STM32GD.I2C (I2C => STM32_SVD.I2C.I2C1_Periph);
   package USART        is new STM32GD.USART (USART => STM32_SVD.USART.USART1_Periph, Speed => 115200,
                           Clock_Tree => CLOCKS, Clock => STM32GD.Clock.HSI);

   package Radio        is new Drivers.RFM69 (SPI => SPI, Chip_Select => CSN, IRQ => IRQ, Frequency => 868_000_000);
   package Text_IO      is new Drivers.Text_IO (USART => STM32GD.Board.USART);
   package RTC          is new STM32GD.RTC (Clock_Tree => STM32GD.Board.Clocks, Clock => STM32GD.Clock.LSI);

   procedure Init;
   procedure Enable_Peripherals;
   procedure Disable_Peripherals;

end STM32GD.Board;
