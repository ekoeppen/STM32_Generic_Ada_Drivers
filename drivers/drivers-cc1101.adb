with System;
with Utils; use Utils;

package body Drivers.CC1101 is

   type Register_Type is (
      IOCFG2,
      IOCFG1,
      IOCFG0,
      FIFOTHR,
      SYNC1,
      SYNC0,
      PKTLEN,
      PKTCTRL1,
      PKTCTRL0,
      ADDR,
      CHANNR,
      FSCTRL1,
      FSCTRL0,
      FREQ2,
      FREQ1,
      FREQ0,
      MDMCFG4,
      MDMCFG3,
      MDMCFG2,
      MDMCFG1,
      MDMCFG0,
      DEVIATN,
      MCSM2,
      MCSM1,
      MCSM0,
      FOCCFG,
      BSCFG,
      AGCCTRL2,
      AGCCTRL1,
      AGCCTRL0,
      WOREVT1,
      WOREVT0,
      WORCTRL,
      FREND1,
      FREND0,
      FSCAL3,
      FSCAL2,
      FSCAL1,
      FSCAL0,
      RCCTRL1,
      RCCTRL0,
      FSTEST,
      PTEST,
      AGCTEST,
      TEST2,
      TEST1,
      TEST0,
      PARTNUM,
      VERSION,
      FREQEST,
      LQI,
      RSSI,
      MARCSTATE,
      WORTIME1,
      WORTIME0,
      PKTSTATUS,
      VCO_VC_DAC,
      TXBYTES,
      RXBYTES,
      RCCTRL1_STATUS,
      RCCTRL0_STATUS);

   for Register_Type use (
      IOCFG2            => 16#00#,
      IOCFG1            => 16#01#,
      IOCFG0            => 16#02#,
      FIFOTHR           => 16#03#,
      SYNC1             => 16#04#,
      SYNC0             => 16#05#,
      PKTLEN            => 16#06#,
      PKTCTRL1          => 16#07#,
      PKTCTRL0          => 16#08#,
      ADDR              => 16#09#,
      CHANNR            => 16#0A#,
      FSCTRL1           => 16#0B#,
      FSCTRL0           => 16#0C#,
      FREQ2             => 16#0D#,
      FREQ1             => 16#0E#,
      FREQ0             => 16#0F#,
      MDMCFG4           => 16#10#,
      MDMCFG3           => 16#11#,
      MDMCFG2           => 16#12#,
      MDMCFG1           => 16#13#,
      MDMCFG0           => 16#14#,
      DEVIATN           => 16#15#,
      MCSM2             => 16#16#,
      MCSM1             => 16#17#,
      MCSM0             => 16#18#,
      FOCCFG            => 16#19#,
      BSCFG             => 16#1A#,
      AGCCTRL2          => 16#1B#,
      AGCCTRL1          => 16#1C#,
      AGCCTRL0          => 16#1D#,
      WOREVT1           => 16#1E#,
      WOREVT0           => 16#1F#,
      WORCTRL           => 16#20#,
      FREND1            => 16#21#,
      FREND0            => 16#22#,
      FSCAL3            => 16#23#,
      FSCAL2            => 16#24#,
      FSCAL1            => 16#25#,
      FSCAL0            => 16#26#,
      RCCTRL1           => 16#27#,
      RCCTRL0           => 16#28#,
      FSTEST            => 16#29#,
      PTEST             => 16#2A#,
      AGCTEST           => 16#2B#,
      TEST2             => 16#2C#,
      TEST1             => 16#2D#,
      TEST0             => 16#2E#,
      PARTNUM           => 16#30#,
      VERSION           => 16#31#,
      FREQEST           => 16#32#,
      LQI               => 16#33#,
      RSSI              => 16#34#,
      MARCSTATE         => 16#35#,
      WORTIME1          => 16#36#,
      WORTIME0          => 16#37#,
      PKTSTATUS         => 16#38#,
      VCO_VC_DAC        => 16#39#,
      TXBYTES           => 16#3A#,
      RXBYTES           => 16#3B#,
      RCCTRL1_STATUS    => 16#3C#,
      RCCTRL0_STATUS    => 16#3D#);

   type Commands is (
      SRES,
      SFSTXON,
      SXOFF,
      SCAL,
      SRX,
      STX,
      SIDLE,
      SWOR,
      SPWD,
      SFRX,
      SFTX,
      SWORRST,
      SNOP);

   for Commands use (
      SRES              => 16#30#,
      SFSTXON           => 16#31#,
      SXOFF             => 16#32#,
      SCAL              => 16#33#,
      SRX               => 16#34#,
      STX               => 16#35#,
      SIDLE             => 16#36#,
      SWOR              => 16#38#,
      SPWD              => 16#39#,
      SFRX              => 16#3A#,
      SFTX              => 16#3B#,
      SWORRST           => 16#3C#,
      SNOP              => 16#3D#);

   type Init_Value is
      record
         Register : Register_Type;
         Value : Byte;
      end record;

   Init_Values : constant array (1 .. 29) of Init_Value := (
      (IOCFG0,      16#41#), --  CHIP_RDYn
      (IOCFG2,      16#07#), --  RX with CRC ok
      (FIFOTHR,     16#47#), --  RX attenuation 6dB, 33/32 byte threshold
      (PKTLEN,      16#3D#), --  62 bytes max packet length
      (PKTCTRL1,    16#0C#), --  CRC autoflush, status append
      (PKTCTRL0,    16#05#), --  TX/RX CRC enabled, variable packet length
      (FSCTRL1,     16#06#), --  152kHz IF frequency
      (FREQ2,       16#10#), --  434 MHz carrier frequency
      (FREQ1,       16#B1#),
      (FREQ0,       16#3B#),
      (MDMCFG4,     16#FA#), --  135kHz channel bandwidth
      (MDMCFG3,     16#83#), --  38.4kbps symbol rate
      (MDMCFG2,     16#31#), --  OOK, 16/16 sync word detection
      --  (MDMCFG2,     16#06#), --  2-FSK, 16/16 sync word detection, carrier sense
      (MDMCFG1,     16#42#), --  8 bytes preamble
      (DEVIATN,     16#27#), --  11.9kHz FSK deviation
      (MCSM1,       16#3c#),
      (MCSM0,       16#18#),
      (FOCCFG,      16#16#),
      (WORCTRL,     16#FB#),
      (FSCAL3,      16#E9#),
      (FSCAL2,      16#2A#),
      (FSCAL1,      16#00#),
      (FSCAL0,      16#1F#),
      (AGCCTRL2,    16#04#),
      (AGCCTRL1,    16#00#),
      (AGCCTRL0,    16#91#),
      (TEST2,       16#81#),
      (TEST1,       16#35#),
      (TEST0,       16#09#));

   procedure Write_Register (Register : Register_Type; Value : Byte);
   procedure Read_Register (Register : Register_Type; Value : out Byte);
   function Read_Register (Register : Register_Type) return Byte;

   procedure Write_Register (Register : Register_Type; Value : Byte) is
   begin
      Chip_Select.Clear;
      SPI.Send (Register'Enum_Rep);
      SPI.Send (Value);
      Chip_Select.Set;
   end Write_Register;

   procedure Read_Register (Register : Register_Type; Value : out Byte) is
   begin
      Chip_Select.Clear;
      SPI.Send (16#80# + Register'Enum_Rep);
      SPI.Receive (Value);
      Chip_Select.Set;
   end Read_Register;

   function Read_Register (Register : Register_Type) return Byte is
      Value : Byte;
   begin
      Chip_Select.Clear;
      SPI.Send (16#80# + Register'Enum_Rep);
      SPI.Receive (Value);
      Chip_Select.Set;
      return Value;
   end Read_Register;

   procedure Read_Status (Register : Register_Type; Value : out Byte) is
   begin
      Chip_Select.Clear;
      SPI.Send (16#C0# + Register'Enum_Rep);
      SPI.Receive (Value);
      Chip_Select.Set;
   end Read_Status;

   function Read_Status (Register : Register_Type) return Byte is
      Value : Byte;
   begin
      Chip_Select.Clear;
      SPI.Send (16#C0# + Register'Enum_Rep);
      SPI.Receive (Value);
      Chip_Select.Set;
      return Value;
   end Read_Status;

   procedure Read_Registers (Registers : out Raw_Register_Array) is
   begin
      for R in Register_Type loop
         if R'Enum_Rep < PARTNUM'Enum_Rep then
            Read_Register (R, Registers (R'Enum_Rep));
         else
            Read_Status (R, Registers (R'Enum_Rep));
         end if;
      end loop;
   end Read_Registers;

   procedure Init is
   begin
      for I of Init_Values loop
         Write_Register (I.Register, I.Value);
      end loop;
   end Init;

   procedure Print_Registers is
   begin
      Put_Line (
         "PARTNUM:" & To_Hex_String (Unsigned_8 (Read_Status (PARTNUM))) &
         " VERSION:" & To_Hex_String (Unsigned_8 (Read_Status (VERSION))) &
         " SYNC0:" & To_Hex_String (Unsigned_8 (Read_Register (SYNC0))) &
         " SYNC1:" & To_Hex_String (Unsigned_8 (Read_Register (SYNC1))) &
         " FREQ:" & To_Hex_String (Unsigned_8 (Read_Register (FREQ0))) &
            To_Hex_String (Unsigned_8 (Read_Register (FREQ1))) &
            To_Hex_String (Unsigned_8 (Read_Register (FREQ2))));
   end Print_Registers;

   procedure Set_Sync_Word (Word : Unsigned_16) is
   begin
      null;
   end Set_Sync_Word;

   function Get_Sync_Word return Unsigned_16 is
   begin
      return Unsigned_16 (Read_Register (SYNC1)) * 2 ** 8 +
         Unsigned_16 (Read_Register (SYNC0));
   end Get_Sync_Word;

   procedure TX_Mode is
   begin
      null;
   end TX_Mode;

   procedure RX_Mode is
   begin
      Chip_Select.Clear;
      SPI.Send (SIDLE'Enum_Rep);
      SPI.Send (SFRX'Enum_Rep);
      SPI.Send (SRX'Enum_Rep);
      Chip_Select.Set;
   end RX_Mode;

   procedure TX (Packet: Packet_Type) is
   begin
      Chip_Select.Clear;
      SPI.Send (SFTX'Enum_Rep);
      Chip_Select.Clear;
      SPI.Send (16#3F# + 16#40#);
      for D of Packet loop
         SPI.Send (D);
      end loop;
      Chip_Select.Set;
      Chip_Select.Clear;
      SPI.Send (STX'Enum_Rep);
      Chip_Select.Set;
   end TX;

   function Wait_For_RX return Boolean is
   begin
      loop
         exit when RX_Available;
      end loop;
      return True;
      --  IRQ.Clear_Trigger;
      --  IRQ.Wait_For_Trigger;
      --  return IRQ.Triggered;
   end Wait_For_RX;

   function RX_Available return Boolean is
   begin
      return Read_Status (RXBYTES) > 0;
   end RX_Available;

   procedure Clear_IRQ is
   begin
      IRQ.Clear_Trigger;
   end Clear_IRQ;

   procedure RX (Packet : out Packet_Type; Length : out Natural) is
      N : Natural;
   begin
      N := Natural (Read_Status (RXBYTES));
      Chip_Select.Clear;
      SPI.Send (16#3F# + 16#C0#);
      for I in 1 .. N loop
         SPI.Receive (Packet (I));
      end loop;
      Chip_Select.Set;
      Length := N;
   end RX;

   procedure Power_Down is
   begin
      null;
   end Power_Down;

   procedure Cancel is
   begin
      null;
   end Cancel;

end Drivers.CC1101;
