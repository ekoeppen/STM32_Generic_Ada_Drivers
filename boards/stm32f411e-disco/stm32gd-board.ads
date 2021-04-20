with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.CLOCKS;
with STM32GD.CLOCKS.Tree;
with STM32GD.USART;
with STM32GD.USART.Peripheral;
with Drivers.Text_IO;

package STM32GD.Board is

   package GPIO   renames STM32GD.GPIO;
   package Clocks is new STM32GD.Clocks.Tree;

   package BUTTON is new GPIO.Pin (Pin => GPIO.Pin_12,
                                   Port => GPIO.Port_D,
                                   Mode => GPIO.Mode_Out);
   package LED    is new GPIO.Pin (Pin => GPIO.Pin_12,
                                   Port => GPIO.Port_D,
                                   Mode => GPIO.Mode_Out);
   package LED2   is new GPIO.Pin (Pin => GPIO.Pin_13,
                                   Port => GPIO.Port_D,
                                   Mode => GPIO.Mode_Out);
   package LED3   is new GPIO.Pin (Pin => GPIO.Pin_14,
                                   Port => GPIO.Port_D,
                                   Mode => GPIO.Mode_Out);
   package LED4   is new GPIO.Pin (Pin => GPIO.Pin_15,
                                   Port => GPIO.Port_D,
                                   Mode => GPIO.Mode_Out);
   package TX     is new GPIO.Pin (Pin => GPIO.Pin_2,
                                   Port => GPIO.Port_A,
                                   Pull_Resistor => GPIO.Pull_Up,
                                   Mode => GPIO.Mode_AF,
                                   Alternate_Function => 7);
   package RX     is new GPIO.Pin (Pin => GPIO.Pin_3,
                                   Port => GPIO.Port_A,
                                   Pull_Resistor => GPIO.Pull_Up,
                                   Mode => GPIO.Mode_AF,
                                   Alternate_Function => 7);
   package USART  is new STM32GD.USART.Peripheral (
                                   USART => STM32GD.USART.USART_2,
                                   Speed => 115200,
                                   Clock => Clocks.PCLK1);

   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);

   procedure Init;

end STM32GD.Board;
