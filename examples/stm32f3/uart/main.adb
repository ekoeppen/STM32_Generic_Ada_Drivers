with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

--  with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32GD.Clocks;
with STM32GD.Clocks.Tree;
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;

with STM32_SVD.RCC;

procedure Main is

   package GPIO renames STM32GD.GPIO;
   package USART renames STM32GD.USART;
   package Clocks renames STM32GD.Clocks;

   package Clock_Tree is new Clocks.Tree (
      PLL_Source => Clocks.HSI_Input);

   package LED is new GPIO.Pin (
      Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);

   package TX is new GPIO.Pin (
      Pin => GPIO.Pin_2, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 7);
 
   package RX is new GPIO.Pin (
      Pin => GPIO.Pin_3, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 7);

   package Serial is new USART.Peripheral (
      Clock => Clock_Tree.PCLK1, USART => USART.USART_2, Speed => 115200);

begin
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPAEN := True;
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPCEN := True;
   STM32_SVD.RCC.RCC_Periph.APB1ENR.USART2EN := True;
   Clock_Tree.Init;
   LED.Init;
   RX.Init;
   TX.Init;
   Serial.Init;

   LED.Set;
   loop
      LED.Toggle;
      Serial.Transmit (64);
   end loop;
end Main;

