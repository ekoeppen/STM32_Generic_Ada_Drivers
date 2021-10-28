with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.USART; use STM32_SVD.USART;
with STM32_SVD.I2C; use STM32_SVD.I2C;
with STM32GD.GPIO;
with STM32GD.USART;
with STM32GD.RTC;
with STM32GD.I2C;
with STM32GD.Clock;
with STM32GD.Clock.Tree;
with Drivers.Text_IO;

package STM32GD.Board is

   package CLOCKS  is new STM32GD.Clock.Tree;

   package SCLK    is new STM32GD.GPIO (Pin => 5, Port => GPIOA_Periph, Alternate => True);
   package MISO    is new STM32GD.GPIO (Pin => 6, Port => GPIOA_Periph, Alternate => True);
   package MOSI    is new STM32GD.GPIO (Pin => 7, Port => GPIOA_Periph, Alternate => True);
   package CSN     is new STM32GD.GPIO (Pin => 4, Port => GPIOA_Periph, Output => True);
   package BUTTON  is new STM32GD.GPIO (Pin => 0, Port => GPIOA_Periph);
   package LED     is new STM32GD.GPIO (Pin => 8, Port => GPIOC_Periph, Output => True);
   package LED2    is new STM32GD.GPIO (Pin => 9, Port => GPIOC_Periph, Output => True);
   package TX      is new STM32GD.GPIO (Pin => 9, Port => GPIOA_Periph, Pull_Up => True, Alternate => True, Alternate_Function => 1);
   package RX      is new STM32GD.GPIO (Pin => 10, Port => GPIOA_Periph, Pull_Up => True, Alternate => True, Alternate_Function => 1);
   package SCL     is new STM32GD.GPIO (Pin => 6, Port => GPIOB_Periph, Pull_Up => True, Alternate => True, Alternate_Function => 1);
   package SDA     is new STM32GD.GPIO (Pin => 7, Port => GPIOB_Periph, Pull_Up => True, Alternate => True, Alternate_Function => 1);
   package USART   is new STM32GD.USART (
                               USART => USART1_Periph,
                               Speed => 115200,
                               Clock_Tree => CLOCKS,
                               Clock => STM32GD.Clock.PCLK);
   package RTC       is new STM32GD.RTC (Clock_Tree => STM32GD.Board.Clocks, Clock => STM32GD.Clock.LSI);
   package I2C       is new STM32GD.I2C (I2C => I2C1_Periph);
   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);

   procedure Init;

end STM32GD.Board;
