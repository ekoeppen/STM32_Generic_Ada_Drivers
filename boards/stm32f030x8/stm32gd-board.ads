with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.SPI;
with STM32_SVD.TIM;
with STM32_SVD.Interrupts;
with STM32_SVD.USART;

with STM32GD.GPIO;
with STM32GD.USART;
with STM32GD.SPI;
with STM32GD.GPIO;
with STM32GD.RTC;
with STM32GD.Clock;
with STM32GD.Clock.Tree;

package STM32GD.Board is

   package BUTTON    is new STM32GD.GPIO (Pin => 0, Port => GPIOA_Periph);
   package LED       is new STM32GD.GPIO (Pin => 1, Port => GPIOA_Periph, Output => True);

   procedure Init;

end STM32GD.Board;
