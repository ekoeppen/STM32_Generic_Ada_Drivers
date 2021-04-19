with STM32GD.GPIO; use STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.Clocks;
with STM32GD.Clocks.Tree;
with STM32GD.USART;
with STM32GD.USART.Peripheral;
with Drivers.Text_IO;

package STM32GD.Board is

   package GPIO renames STM32GD.GPIO;
   package Clocks     is new STM32GD.Clocks.Tree;

   package SCLK      is new GPIO.Pin (Pin => GPIO.Pin_5,  Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package MISO      is new GPIO.Pin (Pin => GPIO.Pin_6,  Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package MOSI      is new GPIO.Pin (Pin => GPIO.Pin_7,  Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package CSN       is new GPIO.Pin (Pin => GPIO.Pin_4,  Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package BUTTON    is new GPIO.Pin (Pin => GPIO.Pin_13, Port => GPIO.Port_C);
   package LED       is new GPIO.Pin (Pin => GPIO.Pin_5,  Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package LED2      is new GPIO.Pin (Pin => GPIO.Pin_8,  Port => GPIO.Port_C, Mode => GPIO.Mode_Out);
   package LED3      is new GPIO.Pin (Pin => GPIO.Pin_6,  Port => GPIO.Port_C, Mode => GPIO.Mode_Out);
   package TX        is new GPIO.Pin (Pin => GPIO.Pin_2,  Port => GPIO.Port_A, Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 7);
   package RX        is new GPIO.Pin (Pin => GPIO.Pin_3,  Port => GPIO.Port_A, Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 7);
   package USART     is new STM32GD.USART.Peripheral (
      USART => STM32GD.USART.USART_2, Speed => 115200,
      RX_DMA_Buffer_Size => 64,
      IRQ => 28,
      Clock => Clocks.PCLK1);
   package Text_IO   is new Drivers.Text_IO (USART => STM32GD.Board.USART);

   procedure Init;

end STM32GD.Board;
