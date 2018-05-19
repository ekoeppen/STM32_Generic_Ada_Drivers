with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;
with Ada.Interrupts.Names;

package Peripherals is

   package GPIO renames STM32GD.GPIO;
   package TX is new GPIO.Pin (
      Pin => GPIO.Pin_9, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package RX is new GPIO.Pin (
      Pin => GPIO.Pin_10, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);

   package USART is new STM32GD.USART.Peripheral (
      USART => STM32GD.USART.USART_1, Speed => 115200, IRQ => Ada.Interrupts.Names.USART1);

   procedure Init;

end Peripherals;
