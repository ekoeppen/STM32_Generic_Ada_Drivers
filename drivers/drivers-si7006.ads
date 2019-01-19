with HAL;

generic

   with package I2C is new HAL.I2C (<>);

package Drivers.Si7006 is

   subtype Temperature_Type is Integer range -10000 .. 10000;
   subtype Humidity_Type is Natural range 0 .. 100; 

   function Temperature_x100 return Temperature_Type;
   function Humidity return Humidity_Type;

end Drivers.Si7006;
