with STM32_SVD; use STM32_SVD;
with Drivers.Text_IO;
with HAL;

generic

   with package Chip_Select is new HAL.Pin (<>);
   with package IRQ is new HAL.Pin (<>);
   with package SPI is new HAL.SPI (<>);
   AES_Enabled : Boolean := False;
   Frequency : Positive;
   TX_PA_Boost : Boolean := False;
   Channel : Byte := 0;

package Drivers.RFM69 is

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
      TEMP2,
      TESTPA1,
      TESTPA2,
      TESTPIIBW);

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
      TEMP2         => 16#4F#,
      TESTPA1       => 16#5A#,
      TESTPA2       => 16#5C#,
      TESTPIIBW     => 16#5F#);

   type OPMODE_Mode_Type is (SLEEP, STDBY, FS, TX, RX) with Size => 3;

   for OPMODE_Mode_Type use (
      SLEEP => 2#000#,
      STDBY => 2#001#,
      FS    => 2#010#,
      TX    => 2#011#,
      RX    => 2#100#);

   subtype Address_Type is Byte;
   type Sync_Word_Type is array (Byte range <>) of Byte
      with Dynamic_Predicate => Sync_Word_Type'Length <= 8;
   type Packet_Type is array (Byte range <>) of Byte;
   type AES_Key_Type is array (Byte range 1 .. 16) of Byte;
   type Raw_Register_Array is array (0 .. 16#4D#) of Byte;
   subtype Output_Power_Range is Integer range -18 .. 17;

   procedure Init;
   procedure Set_Sync_Word (Sync_Word : Sync_Word_Type);
   procedure Get_Sync_Word (Sync_Word : out Sync_Word_Type);
   procedure Set_Frequency (Frequency : Positive);
   procedure Set_Bitrate (Bitrate : Positive);
   procedure Set_Broadcast_Address (Address : Address_Type);
   procedure Set_RX_Address (Address : Address_Type);
   procedure Set_TX_Address (Address : Address_Type);
   procedure Set_Output_Power (Power : Output_Power_Range);
   procedure TX_Mode;
   procedure RX_Mode;
   function Get_Mode return OPMODE_Mode_Type;
   procedure TX (Packet: Packet_Type);
   procedure TX (Packet: Packet_Type; Length: Byte);
   function RX_Available return Boolean;
   function RX_Available_Reg return Boolean;
   function TX_Complete return Boolean;
   function Wait_For_RX return Boolean;
   procedure RX (Packet : out Packet_Type; Length : out Byte);
   procedure Clear_IRQ;
   procedure Power_Down;
   procedure Cancel;
   procedure Read_Registers (Registers : out Raw_Register_Array);
   generic
      with procedure Put_Line (Line: in string);
   procedure Print_Registers;

end Drivers.RFM69;
