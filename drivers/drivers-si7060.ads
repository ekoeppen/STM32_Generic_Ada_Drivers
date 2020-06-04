with HAL;

generic

   with package I2C is new HAL.I2C (<>);
   Address : I2C.I2C_Address;

package Drivers.Si7060 is

   subtype Temperature_Type is Integer range -10000 .. 10000;
   function Init return Boolean;
   function Temperature_x100 (R : out Temperature_Type) return Boolean;

end Drivers.Si7060;
