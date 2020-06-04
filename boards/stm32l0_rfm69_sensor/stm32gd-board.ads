with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.USART;
with STM32GD.USART.Peripheral;
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with STM32GD.I2C;
with STM32GD.I2C.Peripheral;
with STM32GD.RTC;
with STM32GD.Clock;
with STM32GD.Clock.Tree;
with Drivers.Text_IO;
with Drivers.RFM69;
with STM32GD.Board_Variant;

package STM32GD.Board is

   package CLOCKS    is new STM32GD.Clock.Tree;

   package GPIO      renames STM32GD.GPIO;

   package BUTTON    is new GPIO.Pin (Pin => GPIO.Pin_15, Port => GPIO.Port_C);
   package LED       is new GPIO.Pin (Pin => GPIO.Pin_1, Port => GPIO.Port_B, Mode => GPIO.Mode_Out);
   package LED2      is new GPIO.Pin (Pin => GPIO.Pin_14, Port => GPIO.Port_C, Mode => GPIO.Mode_Out);
   package SCLK      is new GPIO.Pin (Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package MISO      is new GPIO.Pin (Pin => GPIO.Pin_6, Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package MOSI      is new GPIO.Pin (Pin => GPIO.Pin_7, Port => GPIO.Port_A, Mode => GPIO.Mode_AF);
   package CSN       is new GPIO.Pin (Pin => GPIO.Pin_4, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package RFM69_RESET  is new GPIO.Pin (Pin => GPIO.Pin_1, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package TX        is new GPIO.Pin (Pin => GPIO.Pin_2, Port => GPIO.Port_A, Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 4);
   package RX        is new GPIO.Pin (Pin => GPIO.Pin_3, Port => GPIO.Port_A, Pull_Resistor => GPIO.Pull_Up, Mode => GPIO.Mode_AF, Alternate_Function => 4);
   package IRQ       is new GPIO.Pin (Pin => GPIO.Pin_0, Port => GPIO.Port_A, Mode => GPIO.Mode_In);
   package SCL       is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_A, Output_Type => GPIO.Open_Drain, Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package SCL_OUT   is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package SDA       is new GPIO.Pin (Pin => GPIO.Pin_10, Port => GPIO.Port_A, Output_Type => GPIO.Open_Drain, Mode => GPIO.Mode_AF, Alternate_Function => 1);

   package SPI       is new STM32GD.SPI.Peripheral (SPI => STM32GD.SPI.SPI_1);
   package USART     is new STM32GD.USART.Peripheral (USART => STM32GD.USART.USART_2, Speed => 115200, Clock_Tree => CLOCKS, Clock => STM32GD.Clock.PCLK1);
   package I2C       is new STM32GD.I2C.Peripheral (I2C => STM32GD.I2C.I2C_1);
   package RTC       is new STM32GD.RTC (Clock_Tree => STM32GD.Board.Clocks, Clock => STM32GD.Clock.LSI);

   package Radio     is new Drivers.RFM69 (SPI => SPI, Chip_Select => CSN, IRQ => IRQ, Frequency => 868_000_000,
      TX_PA_Boost => STM32GD.Board_Variant.TX_PA_Boost);
   package Text_IO   is new Drivers.Text_IO (USART => STM32GD.Board.USART);

   procedure Init;
   procedure Enable_Peripherals;
   procedure Disable_Peripherals;

end STM32GD.Board;
