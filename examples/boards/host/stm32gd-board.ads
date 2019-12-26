with STM32GD.USART.Peripheral;
with Drivers.Text_IO;

package STM32GD.Board is

   pragma Preelaborate;

   package USART     is new STM32GD.USART.Peripheral (Filename => "Test");
   package Text_IO   is new Drivers.Text_IO (USART => STM32GD.Board.USART);

   procedure Init;

end STM32GD.Board;
