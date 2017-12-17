with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32_SVD.RCC;
with Peripherals;

procedure Main is

   package GPIO renames STM32GD.GPIO;

   package LED is new GPIO.Pin (Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package Button is new GPIO.Pin (Pin => GPIO.Pin_2, Port => GPIO.Port_A);


begin
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPAEN := True;
   Button.Init;
   LED.Init;
   Peripherals.Handler.Run;
end Main;

