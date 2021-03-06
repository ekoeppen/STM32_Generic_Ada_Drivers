with STM32_SVD; use STM32_SVD;

generic

   I2C : Natural;

package STM32GD.I2C.Peripheral is

   pragma Preelaborate;

   procedure Init;
   function Master_Transmit (Address : I2C_Address; Data : Byte;
      Restart : Boolean := False) return Boolean;
   function Master_Receive (Address : I2C_Address; Data : out Byte)
      return Boolean;
   function Master_Receive (Address : I2C_Address; Data : out I2C_Data)
      return Boolean;
   function Write_Register (Address : I2C_Address; Register : Byte;
      Data : Byte) return Boolean;
   function Read_Register (Address : I2C_Address; Register : Byte;
      Data : out Byte) return Boolean;

end STM32GD.I2C.Peripheral;
