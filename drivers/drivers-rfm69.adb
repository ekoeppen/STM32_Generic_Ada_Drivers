with System;
with Ada.Text_IO;
with Ada.Real_Time;  use Ada.Real_Time;
with Utils;          use Utils;

package body Drivers.RFM69 is

   F_Osc : constant Natural := 32_000_000;

   type Register_Type is (
      FIFO,
      OPMODE,
      DATAMODUL,
      BITRATEMSB,
      BITRATELSB,
      FDEVMSB,
      FDEVLSB,
      FRFMSB,
      FRFMID,
      FRFLSB,
      OSC1,
      AFCCTRL,
      LOWBAT,
      LISTEN1,
      LISTEN2,
      LISTEN3,
      VERSION,
      PALEVEL,
      PARAMP,
      OCP,
      AGCREF,
      AGCTHRESH1,
      AGCTHRESH2,
      AGCTHRESH3,
      LNA,
      RXBW,
      AFCBW,
      OOKPEAK,
      OOKAVG,
      OOKFIX,
      AFCFEI,
      AFCMSB,
      AFCLSB,
      FEIMSB,
      FEILSB,
      RSSICONFIG,
      RSSIVALUE,
      DIOMAPPING1,
      DIOMAPPING2,
      IRQFLAGS1,
      IRQFLAGS2,
      RSSITHRESH,
      RXTIMEOUT1,
      RXTIMEOUT2,
      PREAMBLEMSB,
      PREAMBLELSB,
      SYNCCONFIG,
      SYNCVALUE1,
      SYNCVALUE2,
      SYNCVALUE3,
      SYNCVALUE4,
      SYNCVALUE5,
      SYNCVALUE6,
      SYNCVALUE7,
      SYNCVALUE8,
      PACKETCONFIG1,
      PAYLOADLENGTH,
      NODEADRS,
      BROADCASTADRS,
      AUTOMODES,
      FIFOTHRESH,
      PACKETCONFIG2,
      AESKEY1,
      AESKEY2,
      AESKEY3,
      AESKEY4,
      AESKEY5,
      AESKEY6,
      AESKEY7,
      AESKEY8,
      AESKEY9,
      AESKEY10,
      AESKEY11,
      AESKEY12,
      AESKEY13,
      AESKEY14,
      AESKEY15,
      AESKEY16,
      TEMP1,
      TEMP2);

   for Register_Type use (
      FIFO          => 16#00#,
      OPMODE        => 16#01#,
      DATAMODUL     => 16#02#,
      BITRATEMSB    => 16#03#,
      BITRATELSB    => 16#04#,
      FDEVMSB       => 16#05#,
      FDEVLSB       => 16#06#,
      FRFMSB        => 16#07#,
      FRFMID        => 16#08#,
      FRFLSB        => 16#09#,
      OSC1          => 16#0A#,
      AFCCTRL       => 16#0B#,
      LOWBAT        => 16#0C#,
      LISTEN1       => 16#0D#,
      LISTEN2       => 16#0E#,
      LISTEN3       => 16#0F#,
      VERSION       => 16#10#,
      PALEVEL       => 16#11#,
      PARAMP        => 16#12#,
      OCP           => 16#13#,
      AGCREF        => 16#14#,
      AGCTHRESH1    => 16#15#,
      AGCTHRESH2    => 16#16#,
      AGCTHRESH3    => 16#17#,
      LNA           => 16#18#,
      RXBW          => 16#19#,
      AFCBW         => 16#1A#,
      OOKPEAK       => 16#1B#,
      OOKAVG        => 16#1C#,
      OOKFIX        => 16#1D#,
      AFCFEI        => 16#1E#,
      AFCMSB        => 16#1F#,
      AFCLSB        => 16#20#,
      FEIMSB        => 16#21#,
      FEILSB        => 16#22#,
      RSSICONFIG    => 16#23#,
      RSSIVALUE     => 16#24#,
      DIOMAPPING1   => 16#25#,
      DIOMAPPING2   => 16#26#,
      IRQFLAGS1     => 16#27#,
      IRQFLAGS2     => 16#28#,
      RSSITHRESH    => 16#29#,
      RXTIMEOUT1    => 16#2A#,
      RXTIMEOUT2    => 16#2B#,
      PREAMBLEMSB   => 16#2C#,
      PREAMBLELSB   => 16#2D#,
      SYNCCONFIG    => 16#2E#,
      SYNCVALUE1    => 16#2F#,
      SYNCVALUE2    => 16#30#,
      SYNCVALUE3    => 16#31#,
      SYNCVALUE4    => 16#32#,
      SYNCVALUE5    => 16#33#,
      SYNCVALUE6    => 16#34#,
      SYNCVALUE7    => 16#35#,
      SYNCVALUE8    => 16#36#,
      PACKETCONFIG1 => 16#37#,
      PAYLOADLENGTH => 16#38#,
      NODEADRS      => 16#39#,
      BROADCASTADRS => 16#3A#,
      AUTOMODES     => 16#3B#,
      FIFOTHRESH    => 16#3C#,
      PACKETCONFIG2 => 16#3D#,
      AESKEY1       => 16#3E#,
      AESKEY2       => 16#3F#,
      AESKEY3       => 16#40#,
      AESKEY4       => 16#41#,
      AESKEY5       => 16#42#,
      AESKEY6       => 16#43#,
      AESKEY7       => 16#44#,
      AESKEY8       => 16#45#,
      AESKEY9       => 16#46#,
      AESKEY10      => 16#47#,
      AESKEY11      => 16#48#,
      AESKEY12      => 16#49#,
      AESKEY13      => 16#4A#,
      AESKEY14      => 16#4B#,
      AESKEY15      => 16#4C#,
      AESKEY16      => 16#4D#,
      TEMP1         => 16#4E#,
      TEMP2         => 16#4F#);

   type OPMODE_Mode_Type is (
      SLEEP,
      STDBY,
      FS,
      TX,
      RX)
   with Size => 3;

   for OPMODE_Mode_Type use (
      SLEEP => 2#000#,
      STDBY => 2#001#,
      FS    => 2#010#,
      TX    => 2#011#,
      RX    => 2#100#);

   type Command_Type is (
      R_REGISTER,
      W_REGISTER);

   for Command_Type use (
      R_REGISTER           => 2#0000_0000#,
      W_REGISTER           => 2#1000_0000#);

   type OPMODE_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               Sequencer_Off  : Boolean;
               Listen_On      : Boolean;
               Listen_Abort   : Boolean;
               Mode           : OPMODE_Mode_Type;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for OPMODE_Register_Type use
      record
         Val            at 0 range 0 .. 7;
         Sequencer_Off  at 0 range 7 .. 7;
         Listen_On      at 0 range 6 .. 6;
         Listen_Abort   at 0 range 5 .. 5;
         Mode           at 0 range 2 .. 4;
      end record;

   subtype DIO_Mapping_Type is UInt2;

   type DIOMAPPING1_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               DIO0_Mapping : DIO_Mapping_Type;
               DIO1_Mapping : DIO_Mapping_Type;
               DIO2_Mapping : DIO_Mapping_Type;
               DIO3_Mapping : DIO_Mapping_Type;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for DIOMAPPING1_Register_Type use
      record
         DIO0_Mapping    at 0 range 6 .. 7;
         DIO1_Mapping    at 0 range 4 .. 5;
         DIO2_Mapping    at 0 range 2 .. 3;
         DIO3_Mapping    at 0 range 0 .. 1;
      end record;

   type IRQFLAGS1_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               Mode_Ready           : Boolean;
               Rx_Ready             : Boolean;
               Tx_Ready             : Boolean;
               PLL_Lock             : Boolean;
               RSSI                 : Boolean;
               Timeout              : Boolean;
               Auto_Mode            : Boolean;
               Sync_Address_Match   : Boolean;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for IRQFLAGS1_Register_Type use
      record
         Mode_Ready           at 0 range 7 .. 7;
         Rx_Ready             at 0 range 6 .. 6;
         Tx_Ready             at 0 range 5 .. 5;
         PLL_Lock             at 0 range 4 .. 4;
         RSSI                 at 0 range 3 .. 3;
         Timeout              at 0 range 2 .. 2;
         Auto_Mode            at 0 range 1 .. 1;
         Sync_Address_Match   at 0 range 0 .. 0;
      end record;

   type IRQFLAGS2_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               FIFO_Full      : Boolean;
               FIFO_Not_Emtpy : Boolean;
               FIFO_Level     : Boolean;
               FIFO_Overrun   : Boolean;
               Packet_Sent    : Boolean;
               Payload_Ready  : Boolean;
               CRC_Ok         : Boolean;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for IRQFLAGS2_Register_Type use
      record
         FIFO_Full      at 0 range 7 .. 7;
         FIFO_Not_Emtpy at 0 range 6 .. 6;
         FIFO_Level     at 0 range 5 .. 5;
         FIFO_Overrun   at 0 range 4 .. 4;
         Packet_Sent    at 0 range 3 .. 3;
         Payload_Ready  at 0 range 2 .. 2;
         CRC_Ok         at 0 range 1 .. 1;
      end record;

   OPMODE_Init       : constant OPMODE_Register_Type     := (Mode => STDBY, others => False);

   procedure Write_Register (Register : Register_Type; Value : Byte);
   procedure Read_Register (Register : Register_Type; Value : out Byte);
   function Read_Register (Register : Register_Type) return Byte;
   procedure Set_Mode (Mode : OPMODE_Mode_Type);

   procedure Write_Register (Register : Register_Type; Value : Byte) is
   begin
      Chip_Select.Clear;
      SPI.Send (Register'Enum_Rep + W_REGISTER'Enum_Rep);
      SPI.Send (Value);
      Chip_Select.Set;
   end Write_Register;

   procedure Read_Register (Register : Register_Type; Value : out Byte) is
   begin
      Chip_Select.Clear;
      SPI.Send (Register'Enum_Rep + R_REGISTER'Enum_Rep);
      SPI.Receive (Value);
      Chip_Select.Set;
   end Read_Register;

   function Read_Register (Register : Register_Type) return Byte is
      Value : Byte;
   begin
      Chip_Select.Clear;
      SPI.Send (Register'Enum_Rep + R_REGISTER'Enum_Rep);
      SPI.Receive (Value);
      Chip_Select.Set;
      return Value;
   end Read_Register;

   procedure Read_Registers (Registers : out Raw_Register_Array) is
   begin
      for R in Register_Type loop
         Read_Register(R, Registers (R'Enum_Rep));
      end loop;
   end Read_Registers;

   procedure Print_Registers is
   begin
      Ada.Text_IO.Put_Line (
         "Version: " & To_Hex_String (Read_Register (VERSION)) &
         " OpMode: " & To_Hex_String (Read_Register (OPMODE)) &
         " IrqFlags: " & To_Hex_String (Read_Register (IRQFLAGS1)) & " " &
            To_Hex_String (Read_Register (IRQFLAGS2)) &
         " PacketConfig: " & To_Hex_String (Read_Register (PACKETCONFIG1)) & " " &
            To_Hex_String (Read_Register (PACKETCONFIG2)) &
         " Frequency: " & To_Hex_String (Read_Register (FRFMSB)) &
            To_Hex_String (Read_Register (FRFMID)) &
            To_Hex_String (Read_Register (FRFLSB)) &
         " Bitrate: " & To_Hex_String (Read_Register (BITRATEMSB)) & " " &
            To_Hex_String (Read_Register (BITRATELSB))
         );
   end Print_Registers;

   procedure Init is
   begin
      Power_Down;
      Write_Register (OPMODE, OPMODE_Init.Val);
   end Init;

   procedure Set_Sync_Word (Sync_Word : Sync_Word_Type) is
   begin
      null;
   end Set_Sync_Word;

   procedure Set_Frequency (Frequency : Natural) is
      F : Natural;
   begin
      F := (Frequency / 1_000_000) * (2 ** 19) / (F_Osc / 1_000_000);
      Write_Register (FRFMSB, Byte ((F / (2 ** 16)) mod 2 ** 8));
      Write_Register (FRFMID, Byte ((F / (2 ** 8)) mod 2 ** 8));
      Write_Register (FRFLSB, Byte (F mod 2 ** 8));
   end Set_Frequency;

   procedure Set_Bitrate (Bitrate : Natural) is
      B : Natural;
   begin
      B := F_Osc / Bitrate;
      Write_Register (BITRATEMSB, Byte ((B / (2 ** 8)) mod 2 ** 8));
      Write_Register (BITRATELSB, Byte (B mod 2 ** 8));
   end Set_Bitrate;

   procedure Set_Broadcast_Address (Address : Address_Type) is
   begin
      null;
   end Set_Broadcast_Address;

   procedure Set_RX_Address (Address : Address_Type) is
   begin
      null;
   end Set_RX_Address;

   procedure Set_TX_Address (Address : Address_Type) is
   begin
      null;
   end Set_TX_Address;

   procedure Set_Mode (Mode : OPMODE_Mode_Type) is
      M : OPMODE_Register_Type;
      R : Byte;
   begin
      Read_Register (OPMODE, R);
      M.Val := R;
      M.Mode := Mode;
      Write_Register (OPMODE, M.Val);
   end Set_Mode;

   procedure TX_Mode is
   begin
      Set_Mode (TX);
   end TX_Mode;

   procedure RX_Mode is
   begin
      Set_Mode (RX);
   end RX_Mode;

   procedure TX (Packet: Packet_Type) is
   begin
      Chip_Select.Clear;
      SPI.Send (FIFO'Enum_Rep + W_REGISTER'Enum_Rep);
      for B of Packet loop
         SPI.Send (B);
      end loop;
      Chip_Select.Set;
   end TX;

   function Wait_For_RX return Boolean is
      Flags : IRQFLAGS2_Register_Type;
      F : Byte;
   begin
      loop
         Read_Register (IRQFLAGS2, F);
         Flags.Val := F;
         exit when Flags.Payload_Ready;
      end loop;
      return True;
   end Wait_For_RX;

   procedure RX (Packet : out Packet_Type) is
   begin
      Chip_Select.Clear;
      SPI.Send (FIFO'Enum_Rep + R_REGISTER'Enum_Rep);
      for I in Packet'Range loop
         SPI.Receive (Packet (I));
      end loop;
      Chip_Select.Set;
   end RX;

   procedure Power_Down is
   begin
      Set_Mode (SLEEP);
   end Power_Down;

   procedure Cancel is
   begin
      IRQ.Cancel_Wait;
   end Cancel;

end Drivers.RFM69;
