with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with System; use System;
with System.Machine_Code;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Unchecked_Conversion;

with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;

with STM32_SVD.RCC;
with STM32_SVD.DMA; use STM32_SVD.DMA;
with STM32_SVD.USART;
with STM32_SVD; use STM32_SVD;

with STM32GD.Board; use STM32GD.Board;

procedure Main is

   package GPIO renames STM32GD.GPIO;
   package TX is new GPIO.Pin (
      Pin => GPIO.Pin_9, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package RX is new GPIO.Pin (
      Pin => GPIO.Pin_10, Port => GPIO.Port_A,
      Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 1);

   package USART is new STM32GD.USART.Peripheral (USART => STM32GD.USART.USART_1, Speed => 115200, RX_DMA_Buffer_Size => 64);

   RX_Buffer : STM32GD.USART.USART_Data (1 .. 16);
   RX_Count : Natural;

   procedure WFI is use System.Machine_Code; begin Asm (Template => "wfi", Volatile => True); return; end WFI;

begin
   Init;
   STM32_SVD.RCC.RCC_Periph.APB2ENR.USART1EN := 1;
   STM32_SVD.RCC.RCC_Periph.AHBENR.DMAEN := 1;
   RX.Init;
   TX.Init;
   USART.Init;
   while True loop
      LED_GREEN.Toggle;
      USART.DMA_Receive (10, RX_Buffer, RX_Count);
      if RX_Count > 0 then
         USART.DMA_Transmit (RX_Buffer, RX_Count);
      end if;
   end loop;
end Main;
