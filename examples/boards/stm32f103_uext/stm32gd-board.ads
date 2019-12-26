with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with STM32GD.GPIO; use STM32GD.GPIO;
with Drivers.Text_IO;

package STM32GD.Board is

   package GPIO renames STM32GD.GPIO;

   package BUTTON    is new GPIO.Pin (Pin => GPIO.Pin_7, Port => GPIO.Port_B);
   package SWO       is new GPIO.Pin (Pin => GPIO.Pin_3, Port => GPIO.Port_B, Mode => GPIO.Speed_50MHz, Out_Conf => GPIO.Alt_PushPull);
   package LED_RED   is new GPIO.Pin (Pin => GPIO.Pin_8, Port => GPIO.Port_B, Mode => GPIO.Speed_2MHz, Out_Conf => GPIO.Out_PushPull);
   package LED_GREEN is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_B, Mode => GPIO.Speed_2MHz, Out_Conf => GPIO.Out_PushPull);
   package SCLK      is new GPIO.Pin (Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Speed_50MHz, Out_Conf => GPIO.Alt_PushPull);
   package MISO      is new GPIO.Pin (Pin => GPIO.Pin_6, Port => GPIO.Port_A, Mode => GPIO.Speed_50MHz, Out_Conf => GPIO.Alt_PushPull);
   package MOSI      is new GPIO.Pin (Pin => GPIO.Pin_7, Port => GPIO.Port_A, Mode => GPIO.Speed_50MHz, Out_Conf => GPIO.Alt_PushPull);
   package CSN       is new GPIO.Pin (Pin => GPIO.Pin_4, Port => GPIO.Port_A, Mode => GPIO.Speed_50MHz, Out_Conf => GPIO.Out_PushPull);
   package TX        is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_A, Mode => GPIO.Speed_50MHz, Out_Conf => GPIO.Alt_PushPull);
   package RX        is new GPIO.Pin (Pin => GPIO.Pin_10, Port => GPIO.Port_A, Mode => GPIO.Speed_50MHz, Out_Conf => GPIO.Alt_PushPull);
   package SCL       is new GPIO.Pin (Pin => GPIO.Pin_6, Port => GPIO.Port_B, Mode => GPIO.Speed_50MHz, Out_Conf => GPIO.Alt_OpenDrain);
   package SDA       is new GPIO.Pin (Pin => GPIO.Pin_7, Port => GPIO.Port_B, Mode => GPIO.Speed_50MHz, Out_Conf => GPIO.Alt_OpenDrain);

   package SPI       is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1);
   package USART     is new STM32GD.USART.Peripheral (USART => STM32GD.USART.USART_1, Speed => 115200, Clock => 8_000_000);

   package Text_IO   is new Drivers.Text_IO (USART => STM32GD.Board.USART);

   procedure Init;
   procedure USB_Re_Enumerate;

end STM32GD.Board;
