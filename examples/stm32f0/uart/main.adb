with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;

with STM32_SVD.RCC;
with STM32_SVD; use STM32_SVD;

with STM32GD.Board; use STM32GD.Board;

--  with Serial_Port;

procedure Main is

   package GPIO renames STM32GD.GPIO;
   package TX is new GPIO.Pin (
      Pin => GPIO.Pin_9, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package RX is new GPIO.Pin (
      Pin => GPIO.Pin_10, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);

   package USART is new STM32GD.USART.Peripheral (USART => STM32GD.USART.USART_1, Speed => 115200);

begin
   Init;
   STM32_SVD.RCC.RCC_Periph.APB2ENR.USART1EN := 1;
   RX.Init;
   TX.Init;
   USART.Init;

   LED_GREEN.Set;
   loop
      USART.Transmit (USART.Receive);
      LED_GREEN.Toggle;
   end loop;
end Main;

