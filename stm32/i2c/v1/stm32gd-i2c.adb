package body STM32GD.I2C is

   Default_Timeout : constant Natural := 10000;
   Count_Down : Natural;

   procedure Start (Duration : Natural := Default_Timeout) is
   begin
      Count_Down := Duration;
   end Start;

   function Timed_Out return Boolean is
   begin
      return (Count_Down = 0);
   end Timed_Out;

   procedure Pause is
   begin
      if not Timed_Out then Count_Down := Count_Down - 1; end if;
   end Pause;

   procedure Init is
   begin
      null;
   end Init;

   function Received_Ack return Boolean is
   begin
      return False;
   end Received_Ack;

   function Wait_For_TXDR_Empty return Boolean is
   begin
      return False;
   end Wait_For_TXDR_Empty;

   function Wait_For_TX_Complete return Boolean is
   begin
      return False;
   end Wait_For_TX_Complete;

   function Wait_For_RX_Not_Empty return Boolean is
   begin
      return False;
   end Wait_For_RX_Not_Empty;

   function Wait_For_Idle return Boolean is
   begin
      return False;
   end Wait_For_Idle;

   function Test (Address : I2C_Address) return Boolean is
   begin
      return False;
   end Test;

   function Master_Transmit (Address : I2C_Address; Data : Byte;
      Restart : Boolean := False) return Boolean is
   begin
      return False;
   end Master_Transmit;

   function Master_Receive (Address : I2C_Address; Data : out Byte)
      return Boolean is
   begin
      return False;
   end Master_Receive;

   function Master_Receive (Address : I2C_Address; Data : out Byte_Array)
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

end STM32GD.I2C;
