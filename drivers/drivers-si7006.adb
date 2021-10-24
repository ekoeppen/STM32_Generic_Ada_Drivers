with STM32GD.I2C;
with STM32_SVD; use STM32_SVD;

package body Drivers.Si7006 is

   Measurement : STM32GD.Byte_Array (0 .. 2);

   function Temperature_x100 return Temperature_Type is
   begin
      if I2C.Master_Transmit (16#40#, 16#E3#, True)
      and then I2C.Master_Receive (16#40#, Measurement)
      then return Temperature_Type (
         Shift_Right ((UInt32 (Measurement (0)) * 256 +
                       UInt32 (Measurement (1))) * 17572, 16) - 4685);
      else return 0;
      end if;
   end Temperature_x100;

   function Humidity return Humidity_Type is
   begin
      if I2C.Master_Transmit (16#40#, 16#E5#, True)
      and then I2C.Master_Receive (16#40#, Measurement)
      then return Humidity_Type (
         Shift_Right ((UInt32 (Measurement (0)) * 256 +
                       UInt32 (Measurement (1))) * 125, 16) - 6);
      else return 0;
      end if;
   end Humidity;

end Drivers.Si7006;
