package body STM32GD.I2C.Peripheral is

   procedure Init is
   begin
      null;
   end Init;

   function Master_Transmit (Address : I2C_Address; Data : Byte;
      Restart : Boolean := False) return Boolean is
   begin
      return False;
   end Master_Transmit;

   function Master_Receive (Address : I2C_Address; Data : out Byte)
      return Boolean is
   begin
      return True;
   end Master_Receive;

   function Master_Receive (Address : I2C_Address; Data : out I2C_Data)
      return Boolean
   is
   begin
      return True;
   end Master_Receive;

   function Write_Register (Address : I2C_Address; Register : Byte;
      Data : Byte) return Boolean is
   begin
      return True;
   end Write_Register;

   function Read_Register (Address : I2C_Address; Register : Byte;
      Data : out Byte) return Boolean is
   begin
      return True;
   end Read_Register;

end STM32GD.I2C.Peripheral;
