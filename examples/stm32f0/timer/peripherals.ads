with Ada.Interrupts.Names;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;
with STM32GD.Timer;
with STM32GD.Timer.Peripheral;

package Peripherals is

   package GPIO renames STM32GD.GPIO;
   package TX is new GPIO.Pin (
      Pin => GPIO.Pin_9, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);

   package USART is new STM32GD.USART.Peripheral (USART => STM32GD.USART.USART_1, Speed => 115200);
   package Timer is new STM32GD.Timer.Peripheral (Timer => STM32GD.Timer.Timer_14, IRQ => Ada.Interrupts.Names.TIM14);

   procedure Init;

end Peripherals;
