with Ada.Interrupts.Names;

with STM32GD.GPIO; use STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.Clocks;
with STM32GD.Clocks.Tree;
with STM32GD.USART;
with STM32GD.USART.Peripheral;

package STM32GD.Board is

   package GPIO renames STM32GD.GPIO;
   package Clocks_Tree is new STM32GD.Clocks.Tree;

   package SCLK       is new GPIO.Pin (Pin => GPIO.Pin_5,  Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package MISO       is new GPIO.Pin (Pin => GPIO.Pin_6,  Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package MOSI       is new GPIO.Pin (Pin => GPIO.Pin_7,  Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package CSN        is new GPIO.Pin (Pin => GPIO.Pin_4,  Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package BUTTON     is new GPIO.Pin (Pin => GPIO.Pin_13, Port => GPIO.Port_C);
   package LED_RED    is new GPIO.Pin (Pin => GPIO.Pin_8,  Port => GPIO.Port_C, Mode => GPIO.Mode_Out);
   package LED_YELLOW is new GPIO.Pin (Pin => GPIO.Pin_6,  Port => GPIO.Port_C, Mode => GPIO.Mode_Out);
   package LED_GREEN  is new GPIO.Pin (Pin => GPIO.Pin_5,  Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package TX         is new GPIO.Pin (Pin => GPIO.Pin_2,  Port => GPIO.Port_A, Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 7);
   package RX         is new GPIO.Pin (Pin => GPIO.Pin_3,  Port => GPIO.Port_A, Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 7);
   package USART      is new STM32GD.USART.Peripheral (
      USART => STM32GD.USART.USART_2, Speed => 115200,
      RX_DMA_Buffer_Size => 64,
      IRQ => Ada.Interrupts.Names.USART2_EXTI26,
      Clock => Clocks_Tree.PCLK1);

   procedure Init;

end STM32GD.Board;
