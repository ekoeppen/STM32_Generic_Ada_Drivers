with STM32GD.USART.Peripheral;

package STM32GD.Board is

   package USART is new STM32GD.USART.Peripheral (Filename => "Test");

   procedure Init;

end STM32GD.Board;
