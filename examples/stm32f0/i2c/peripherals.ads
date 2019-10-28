with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.I2C;
with STM32GD.I2C.Peripheral;
with Drivers.Si7006;

package Peripherals is

   package GPIO renames STM32GD.GPIO;

   package SCL is new GPIO.Pin (Pin => GPIO.Pin_6, Port => GPIO.Port_B,
      Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package SCL_OUT is new GPIO.Pin (Pin => GPIO.Pin_6, Port => GPIO.Port_B,
      Mode => GPIO.Mode_Out);
   package SDA is new GPIO.Pin (Pin => GPIO.Pin_7, Port => GPIO.Port_B,
      Mode => GPIO.Mode_AF, Alternate_Function => 1);
   package I2C is new STM32GD.I2C.Peripheral (
      I2C => STM32GD.I2C.I2C_1);
   package Si7006 is new Drivers.Si7006 (I2C => I2C);

   procedure Init;

end Peripherals;
