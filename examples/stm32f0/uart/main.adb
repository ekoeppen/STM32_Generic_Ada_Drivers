with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

--  with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;

with STM32_SVD.RCC;
with STM32_SVD; use STM32_SVD;

with Serial_Port;

procedure Main is

   package GPIO renames STM32GD.GPIO;
   package LED is new GPIO.Pin (Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package TX is new GPIO.Pin (
      Pin => GPIO.Pin_2, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package RX is new GPIO.Pin (
      Pin => GPIO.Pin_3, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);

   package USART is new STM32GD.USART.Peripheral (USART => STM32GD.USART.USART_2, Speed => 115200);

begin
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPAEN := 1;
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPCEN := 1;
   STM32_SVD.RCC.RCC_Periph.APB1ENR.USART2EN := 1;
   LED.Init;
   RX.Init;
   TX.Init;
   USART.Init;

   LED.Set;
   loop
      LED.Toggle;
      USART.Transmit (64);
   end loop;
end Main;

