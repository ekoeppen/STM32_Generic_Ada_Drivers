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
      I2C.CR1.PE := 0;
      I2C.TIMINGR.SCLH := 15;
      I2C.TIMINGR.SCLL := 19;
      I2C.TIMINGR.SDADEL := 2;
      I2C.TIMINGR.SCLDEL := 4;
      I2C.TIMINGR.PRESC := 1;
      I2C.CR1.PE := 1;
   end Init;

   function Received_Ack return Boolean is
   begin
      Start;
      while I2C.ISR.TXIS = 0 and I2C.ISR.NACKF = 0 and not Timed_Out
      loop
         Pause;
      end loop;
      return (I2C.ISR.TXIS = 1 and I2C.ISR.NACKF = 0);
   end Received_Ack;

   function Wait_For_TXDR_Empty return Boolean is
   begin
      Start;
      while I2C.ISR.TXIS = 0 and not Timed_Out loop
         Pause;
      end loop;
      return (I2C.ISR.TXIS = 1);
   end Wait_For_TXDR_Empty;

   function Wait_For_TX_Complete return Boolean is
   begin
      Start;
      while I2C.ISR.TC = 0 and not Timed_Out loop
         Pause;
      end loop;
      return not Timed_Out;
   end Wait_For_TX_Complete;

   function Wait_For_RX_Not_Empty return Boolean is
   begin
      Start;
      while I2C.ISR.RXNE = 0 and not Timed_Out loop
         Pause;
      end loop;
      return not Timed_Out;
   end Wait_For_RX_Not_Empty;

   function Wait_For_Idle return Boolean is
   begin
      Start;
      while I2C.ISR.BUSY = 1 and not Timed_Out loop
         Pause;
      end loop;
      return not Timed_Out;
   end Wait_For_Idle;

   function Test (Address : I2C_Address) return Boolean is
      Present : Boolean;
   begin
      I2C.ICR.NACKCF := 1;
      if not Wait_For_Idle then return False; end if;
      I2C.CR2.NBYTES := 0;
      I2C.CR2.SADD := UInt10 (Address);
      I2C.CR2.RD_WRN := 0;
      I2C.CR2.AUTOEND := 0;
      I2C.CR2.START := 1;
      Present := I2C.ISR.NACKF = 0;
      I2C.CR2.STOP := 1;
      I2C.ICR.NACKCF := 1;
      return Present;
   end Test;

   function Master_Transmit (Address : I2C_Address; Data : Byte;
      Restart : Boolean := False) return Boolean is
   begin
      if not Wait_For_Idle then return False; end if;
      I2C.CR2.NBYTES := 1;
      I2C.CR2.SADD := UInt10 (Address);
      I2C.CR2.RD_WRN := 0;
      I2C.CR2.START := 1;
      I2C.CR2.AUTOEND := (if not Restart then 1 else 0);
      if not Wait_For_TXDR_Empty then return False; end if;
      I2C.TXDR.TXDATA := Data;
      return Wait_For_TX_Complete;
   end Master_Transmit;

   function Master_Receive (Address : I2C_Address; Data : out Byte)
      return Boolean is
   begin
      I2C.CR2.NBYTES := 1;
      I2C.CR2.SADD := UInt10 (Address);
      I2C.CR2.START := 1;
      I2C.CR2.RD_WRN := 1;
      if not Wait_For_TXDR_Empty then return False; end if;
      if not Wait_For_RX_Not_Empty then return False; end if;
      Data := I2C.RXDR.RXDATA;
      I2C.CR2.STOP := 1;
      return True;
   end Master_Receive;

   function Master_Receive (Address : I2C_Address; Data : out Byte_Array)
      return Boolean
   is
   begin
      I2C.CR2.NBYTES := Data'Length;
      I2C.CR2.SADD := UInt10 (Address);
      I2C.CR2.RD_WRN := 1;
      I2C.CR2.START := 1;
      I2C.CR2.AUTOEND := 1;
      for D of Data loop
         if Wait_For_RX_Not_Empty then
            D := I2C.RXDR.RXDATA;
         end if;
      end loop;
      return True;
   end Master_Receive;

   function Write_Register (Address : I2C_Address; Register : Byte;
      Data : Byte) return Boolean is
   begin
      I2C.CR2.NBYTES := 1;
      I2C.CR2.SADD := UInt10 (Address);
      I2C.CR2.START := 1;
      if not Wait_For_TXDR_Empty then return False; end if;
      I2C.TXDR.TXDATA := Register;
      if not Wait_For_TXDR_Empty then return False; end if;
      I2C.TXDR.TXDATA := Data;
      if not Wait_For_TX_Complete then return False; end if;
      I2C.CR2.STOP := 1;
      return True;
   end Write_Register;

   function Read_Register (Address : I2C_Address; Register : Byte;
      Data : out Byte) return Boolean is
   begin
      I2C.CR2.NBYTES := 1;
      I2C.CR2.SADD := UInt10 (Address);
      I2C.CR2.START := 1;
      if not Wait_For_TXDR_Empty then return False; end if;
      I2C.TXDR.TXDATA := Register;
      if not Wait_For_TX_Complete then return False; end if;
      I2C.CR2.AUTOEND := 1;
      I2C.CR2.RD_WRN := 1;
      I2C.CR2.START := 1;
      if not Wait_For_RX_Not_Empty then return False; end if;
      Data := I2C.RXDR.RXDATA;
      I2C.CR2.STOP := 1;
      return True;
   end Read_Register;

end STM32GD.I2C;
