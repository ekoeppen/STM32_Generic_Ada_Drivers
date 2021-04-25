with STM32GD.GPIO; use STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with STM32GD.RTC;
with STM32GD.Clock;
with STM32GD.Clock.Tree;
with Drivers.Text_IO;

package STM32GD.Board is

   package CLOCKS     is new STM32GD.Clock.Tree;

   package LED       is new Pin (Pin => Pin_5, Port => Port_A, Mode => Speed_2MHz, Out_Conf => Out_PushPull);
   package LED2      is new Pin (Pin => Pin_8, Port => Port_C, Mode => Speed_2MHz, Out_Conf => Out_PushPull);
   package LED3      is new Pin (Pin => Pin_6, Port => Port_C, Mode => Speed_2MHz, Out_Conf => Out_PushPull);
   package SCLK      is new Pin (Pin => Pin_5, Port => Port_A, Mode => Speed_50MHz, Out_Conf => Alt_PushPull);
   package MISO      is new Pin (Pin => Pin_6, Port => Port_A, Mode => Speed_50MHz, Out_Conf => Alt_PushPull);
   package MOSI      is new Pin (Pin => Pin_7, Port => Port_A, Mode => Speed_50MHz, Out_Conf => Alt_PushPull);
   package CSN       is new Pin (Pin => Pin_4, Port => Port_A, Mode => Speed_50MHz, Out_Conf => Out_PushPull);
   package TX        is new Pin (Pin => Pin_2, Port => Port_A, Mode => Speed_50MHz, Out_Conf => Alt_PushPull);
   package RX        is new Pin (Pin => Pin_3, Port => Port_A);
   package SCL       is new Pin (Pin => Pin_6, Port => Port_B, Mode => Speed_50MHz, Out_Conf => Alt_OpenDrain);
   package SDA       is new Pin (Pin => Pin_7, Port => Port_B, Mode => Speed_50MHz, Out_Conf => Alt_OpenDrain);

   package SPI       is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1);
   package USART     is new STM32GD.USART.Peripheral (USART => STM32GD.USART.USART_2, Speed => 115200, Clock => 8_000_000);

   package Text_IO   is new Drivers.Text_IO (USART => STM32GD.Board.USART);
   package BUTTON    is new Pin (Pin => Pin_13, Port => Port_C, Mode => Input);
   package RTC       is new STM32GD.RTC (Clock_Tree => STM32GD.Board.Clocks, Clock => STM32GD.Clock.LSI);

   procedure Init;

end STM32GD.Board;
