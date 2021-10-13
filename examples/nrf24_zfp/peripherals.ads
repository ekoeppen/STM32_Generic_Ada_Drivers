with STM32_SVD.Interrupts;
with STM32GD.GPIO; use STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.GPIO.Polled;
with STM32GD.SPI;
with STM32GD.SPI.Peripheral;
with STM32GD.Timer;
with STM32GD.Timer.Peripheral;
with STM32GD.Board;
with Drivers;
with Drivers.NRF24;

package Peripherals is

   package CE     is new Pin (Pin => Pin_4, Port => Port_B, Mode => Mode_Out);
   package IRQ    is new Pin (Pin => Pin_5, Port => Port_B, Mode => Mode_In);
   package Radio  is new Drivers.NRF24 (
                              SPI => STM32GD.Board.SPI,
                              Chip_Select => STM32GD.Board.CSN,
                              Chip_Enable => CE, IRQ => IRQ);


   procedure Init;

end Peripherals;
