with STM32GD.GPIO; use STM32GD.GPIO;

with STM32GD.GPIO.Pin;

package STM32GD.Board is

   package GPIO renames STM32GD.GPIO;

   package BUTTON    is new GPIO.Pin (Pin => GPIO.Pin_7, Port => GPIO.Port_B);
   package SWO       is new GPIO.Pin (Pin => GPIO.Pin_3, Port => GPIO.Port_B, Mode => GPIO.Speed_50MHz, Out_Conf => GPIO.Alt_PushPull);
   package LED_RED   is new GPIO.Pin (Pin => GPIO.Pin_8, Port => GPIO.Port_B, Mode => GPIO.Speed_2MHz, Out_Conf => GPIO.Out_PushPull);
   package LED_GREEN is new GPIO.Pin (Pin => GPIO.Pin_9, Port => GPIO.Port_B, Mode => GPIO.Speed_2MHz, Out_Conf => GPIO.Out_PushPull);

   procedure Init;
   procedure USB_Re_Enumerate;

end STM32GD.Board;
