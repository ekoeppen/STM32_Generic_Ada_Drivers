with STM32_SVD.I2C;

generic

   I2C : in out STM32_SVD.I2C.I2C_Peripheral;

package STM32GD.I2C is

   pragma Preelaborate;

   procedure Init;
   function Test (Address: I2C_Address) return Boolean;
   function Master_Transmit (Address : I2C_Address; Data : Byte;
      Restart : Boolean := False) return Boolean;
   function Master_Receive (Address : I2C_Address; Data : out Byte)
      return Boolean;
   function Master_Receive (Address : I2C_Address; Data : out Byte_Array)
      return Boolean;
   function Write_Register (Address : I2C_Address; Register : Byte;
      Data : Byte) return Boolean;
   function Read_Register (Address : I2C_Address; Register : Byte;
      Data : out Byte) return Boolean;

end STM32GD.I2C;
