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

   package BUTTON    is new STM32GD.GPIO (Pin => 9, Port => GPIOC_Periph);
   package SWO       is new STM32GD.GPIO (Pin => 3, Port => GPIOB_Periph, Alternate_Output => True);
   package LED       is new STM32GD.GPIO (Pin => 5, Port => GPIOA_Periph, Output => True);
   package LED2      is new STM32GD.GPIO (Pin => 1, Port => GPIOA_Periph, Output => True);
   package USB_DISC  is new STM32GD.GPIO (Pin => 12, Port => GPIOC_Periph, Output => True);

   procedure Init;
   procedure USB_Re_Enumerate;

end STM32GD.Board;
