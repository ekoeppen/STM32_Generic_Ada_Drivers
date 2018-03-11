with STM32GD.GPIO; use STM32GD.GPIO;

with STM32GD.GPIO.Pin;

package STM32GD.Board is

   package GPIO renames STM32GD.GPIO;

   package BUTTON    is new GPIO.Pin (Pin => GPIO.Pin_0, Port => GPIO.Port_A);
   package LED_RED   is new GPIO.Pin (Pin => GPIO.Pin_8, Port => GPIO.Port_C, Mode => GPIO.Mode_Out);
   package LED_GREEN is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_C, Mode => GPIO.Mode_Out);

   procedure Init;

end STM32GD.Board;
