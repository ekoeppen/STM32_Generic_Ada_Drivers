with STM32GD.GPIO; use STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.Clocks;
with STM32GD.Clocks.Tree;
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with STM32GD.USART;
with STM32GD.USART.Peripheral;
with STM32_SVD.Interrupts;
with Drivers.Text_IO;

package STM32GD.Board is

   package GPIO renames STM32GD.GPIO;
   package Clocks     is new STM32GD.Clocks.Tree;

   package SCLK      is new Pin (Pin => Pin_5,
                                 Port => Port_A,
                                 Mode => Mode_AF,
                                 Alternate_Function => 5);
   package MISO      is new Pin (Pin => Pin_6,
                                 Port => Port_A,
                                 Mode => Mode_AF,
                                 Alternate_Function => 5);
   package MOSI      is new Pin (Pin => Pin_7,
                                 Port => Port_A,
                                 Mode => Mode_AF,
                                 Alternate_Function => 5);
   package CSN       is new Pin (Pin => Pin_4,
                                 Port => Port_A,
                                 Mode => Mode_Out);
   package BUTTON    is new Pin (Pin => Pin_13,
                                 Port => Port_C);
   package LED       is new Pin (Pin => Pin_5,
                                 Port => Port_A,
                                 Mode => Mode_Out);
   package LED2      is new Pin (Pin => Pin_8,
                                 Port => Port_C,
                                 Mode => Mode_Out);
   package LED3      is new Pin (Pin => Pin_6,
                                 Port => Port_C,
                                 Mode => Mode_Out);
   package TX        is new Pin (Pin => Pin_2,
                                 Port => Port_A,
                                 Pull_Resistor => Pull_Up,
                                 Mode => Mode_AF,
                                 Alternate_Function => 7);
   package RX        is new Pin (Pin => Pin_3,
                                 Port => Port_A,
                                 Pull_Resistor => Pull_Up,
                                 Mode => Mode_AF,
                                 Alternate_Function => 7);
   package USART     is new STM32GD.USART.Peripheral (
      USART => STM32GD.USART.USART_2, Speed => 115200,
      RX_DMA_Buffer_Size => 64,
      IRQ => STM32_SVD.Interrupts.USART2_EXTI26,
      Clock => Clocks.PCLK1);
   package Text_IO   is new Drivers.Text_IO (USART => STM32GD.Board.USART);
   package SPI     is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1);

   procedure Init;

end STM32GD.Board;
