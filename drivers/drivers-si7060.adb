with STM32_SVD; use STM32_SVD;

package body Drivers.Si7060 is

   function Init return Boolean is
   begin
      return I2C.Write_Register (Address, 16#C4#, 2#0000_0001#);
   end Init;

   function Temperature_x100 (R : out Temperature_Type) return Boolean is
      M, LSB, MSB : Byte;
   begin
      if not I2C.Test (Address) then return False; end if;

      if I2C.Write_Register (Address, 16#C4#, 2#0000_0100#)
         and then I2C.Read_Register (Address, 16#C4#, M)
         and then (M and 2#0000_0010#) /= 0
         and then I2C.Read_Register (Address, 16#C1#, MSB)
         and then I2C.Read_Register (Address, 16#C2#, LSB)
         and then I2C.Write_Register (Address, 16#C4#, 2#0000_0001#)
      then
         R := Temperature_Type (
            5500 +
            (Integer (MSB and 2#0111_1111#) * 256 + Integer (LSB) - 16384) *
            10 / 16);
         return True;
      end if;

      return False;
   end Temperature_x100;

end Drivers.Si7060;
