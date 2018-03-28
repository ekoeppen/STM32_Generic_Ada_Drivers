with Ada.Interrupts.Names;

with STM32GD.GPIO; use STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;

package STM32GD.Board is

   package GPIO renames STM32GD.GPIO;

   package BUTTON    is new GPIO.Pin (Pin => GPIO.Pin_0, Port => GPIO.Port_A);
   package LED_RED   is new GPIO.Pin (Pin => GPIO.Pin_8, Port => GPIO.Port_C, Mode => GPIO.Mode_Out);
   package LED_GREEN is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_C, Mode => GPIO.Mode_Out);
   package TX        is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_A, Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package RX        is new GPIO.Pin (Pin => GPIO.Pin_10, Port => GPIO.Port_A, Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package USART     is new STM32GD.USART.Peripheral (USART => STM32GD.USART.USART_1, Speed => 115200, RX_DMA_Buffer_Size => 64, IRQ => Ada.Interrupts.Names.USART1);

   procedure Init;

end STM32GD.Board;
