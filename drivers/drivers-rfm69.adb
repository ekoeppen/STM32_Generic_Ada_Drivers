with System;
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

   type OPMODE_Mode_Type is (SLEEP, STDBY, FS, TX, RX)
   with Size => 3;

   for OPMODE_Mode_Type use (
      SLEEP => 2#000#,
      STDBY => 2#001#,
      FS    => 2#010#,
      TX    => 2#011#,
      RX    => 2#100#);

   type Command_Type is (R_REGISTER, W_REGISTER);

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

   type SYNCCONFIG_FIFO_Fill_Condition_Type is (Sync_Address, Always)
      with Size => 1;
   for SYNCCONFIG_FIFO_Fill_Condition_Type use
      (Sync_Address => 2#0#, Always => 2#1#);
   type SYNCCONFIG_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               Sync_On              : Boolean;
               FIFO_Fill_Condition  : SYNCCONFIG_FIFO_Fill_Condition_Type;
               Sync_Size            : UInt3;
               Sync_Tol             : UInt3;
         end case;
      end record
      with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for SYNCCONFIG_Register_Type use
      record
         Sync_On              at 0 range 7 .. 7;
         FIFO_Fill_Condition  at 0 range 6 .. 6;
         Sync_Size            at 0 range 3 .. 5;
         Sync_Tol             at 0 range 0 .. 2;
      end record;

   type DATAMODUL_Data_Mode_Type is (Packet_Mode, Continuous_Synchronizer,
      Continuous_No_Synchronizer)
      with Size => 2;
   for DATAMODUL_Data_Mode_Type use (
      Packet_Mode                => 2#00#,
      Continuous_Synchronizer    => 2#10#,
      Continuous_No_Synchronizer => 2#11#);

   type DATAMODUL_Modulation_Type is (FSK, OOK)
      with Size => 2;
   for DATAMODUL_Modulation_Type use (
      FSK   => 2#00#,
      OOK   => 2#01#);

   type DATAMODUL_Modulation_Shaping is (No_Shaping, Shaping_1, Shaping_2,
      Shaping_3);
   for DATAMODUL_Modulation_Shaping use (
      No_Shaping  => 0,
      Shaping_1   => 1,
      Shaping_2   => 2,
      Shaping_3   => 3);

   type DATAMODUL_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               Data_Mode            : DATAMODUL_Data_Mode_Type;
               Modulation_Type      : DATAMODUL_Modulation_Type;
               Modulation_Shaping   : DATAMODUL_Modulation_Shaping;
         end case;
      end record
      with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for DATAMODUL_Register_Type use
      record
         Data_Mode            at 0 range 5 .. 6;
         Modulation_Type      at 0 range 3 .. 4;
         Modulation_Shaping   at 0 range 0 .. 2;
      end record;

   type FIFOTHRESH_Start_Condition_Type is (FIFO_Level, FIFO_Not_Empty);
   for FIFOTHRESH_Start_Condition_Type use (
      FIFO_Level     => 2#0#,
      FIFO_Not_Empty => 2#1#);

   type FIFOTHRESH_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               Start_Condition   : FIFOTHRESH_Start_Condition_Type;
               FIFO_Threshold    : UInt7;
         end case;
      end record
      with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for FIFOTHRESH_Register_Type use
      record
         Start_Condition   at 0 range 7 .. 7;
         FIFO_Threshold    at 0 range 0 .. 6;
      end record;

   type RXBW_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               DCC_Freq    : UInt3;
               RX_BW_Mant  : UInt2;
               RX_BW_Exp   : UInt3;
         end case;
      end record
      with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for RXBW_Register_Type use
      record
         DCC_Freq    at 0 range 5 .. 7;
         RX_BW_Mant  at 0 range 3 .. 4;
         RX_BW_Exp   at 0 range 0 .. 2;
      end record;

   type PALEVEL_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               PA0_On : Boolean;
               PA1_On : Boolean;
               PA2_On : Boolean;
               Output_Power : UInt5;
         end case;
      end record
      with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for PALEVEL_Register_Type use
      record
         PA0_On       at 0 range 7 .. 7;
         PA1_On       at 0 range 6 .. 6;
         PA2_On       at 0 range 5 .. 5;
         Output_Power at 0 range 0 .. 4;
      end record;

   type AFCBW_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               DCC_Freq_AFC   : UInt3;
               RX_BW_Mant_AFC : UInt2;
               RX_BW_Exp_AFC  : UInt3;
         end case;
      end record
      with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for AFCBW_Register_Type use
      record
         DCC_Freq_AFC   at 0 range 5 .. 7;
         RX_BW_Mant_AFC at 0 range 3 .. 4;
         RX_BW_Exp_AFC  at 0 range 0 .. 2;
      end record;

   type PACKETCONFIG1_Packet_Format_Type is (Fixed_Length, Variable_Length)
      with Size => 1;
   for PACKETCONFIG1_Packet_Format_Type use (
      Fixed_Length      => 2#0#,
      Variable_Length   => 2#1#);

   type PACKETCONFIG1_DC_Free_Type is (None, Manchester, Whitening)
      with Size => 2;
   for PACKETCONFIG1_DC_Free_Type use (
      None        => 2#00#,
      Manchester  => 2#01#,
      Whitening   => 2#10#);

   type PACKETCONFIG1_Address_Filtering_Type is (None, Node_Address,
      Node_or_Broadcast_Address)
      with Size => 2;
   for PACKETCONFIG1_Address_Filtering_Type use (
      None                       => 2#00#,
      Node_Address               => 2#01#,
      Node_or_Broadcast_Address  => 2#10#);

   type PACKETCONFIG1_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               Packet_Format        : PACKETCONFIG1_Packet_Format_Type;
               DC_Free              : PACKETCONFIG1_DC_Free_Type;
               CRC_On               : Boolean;
               CRC_Auto_Clear_Off   : Boolean;
               Address_Filtering    : PACKETCONFIG1_Address_Filtering_Type;
         end case;
      end record
      with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for PACKETCONFIG1_Register_Type use
      record
         Packet_Format        at 0 range 7 .. 7;
         DC_Free              at 0 range 5 .. 6;
         CRC_On               at 0 range 4 .. 4;
         CRC_Auto_Clear_Off   at 0 range 3 .. 3;
         Address_Filtering    at 0 range 1 .. 2;
      end record;

   OPMODE_Init          : constant OPMODE_Register_Type := (
      Mode                    => STDBY,
      others                  => False);
   SYNCCONFIG_Init      : constant SYNCCONFIG_Register_Type := (
      As_Value                => False,
      Sync_On                 => True,
      FIFO_Fill_Condition     => Sync_Address,
      Sync_Size               => 3,
      Sync_Tol                => 0);
   PACKETCONFIG1_Init   : constant PACKETCONFIG1_Register_Type := (
      As_Value                => False,
      Packet_Format           => Variable_Length,
      DC_Free                 => None,
      CRC_On                  => True,
      CRC_Auto_Clear_Off      => False,
      Address_Filtering       => None);
   DATAMODUL_Init       : constant DATAMODUL_Register_Type := (
      As_Value                => False,
      Data_Mode               => Packet_Mode,
      Modulation_Type         => FSK,
      Modulation_Shaping      => No_Shaping);
   FIFOTHRESH_Init      : constant FIFOTHRESH_Register_Type := (
      As_Value                => False,
      Start_Condition         => FIFO_Not_Empty,
      FIFO_Threshold          => UInt7 (16));
   RXBW_Init            : constant RXBW_Register_Type := (
      As_Value                => False,
      DCC_Freq                => 2,
      RX_BW_Mant              => 0,
      RX_BW_Exp               => 2);
   AFCBW_Init           : constant AFCBW_Register_Type := (
      As_Value                => False,
      DCC_Freq_AFC            => 2,
      RX_BW_Mant_AFC          => 0,
      RX_BW_Exp_AFC           => 2);
   PALEVEL_13dB_Init    : constant PALEVEL_Register_Type := (
      As_Value                => False,
      PA0_On                  => True,
      PA1_On                  => False,
      PA2_On                  => False,
      Output_Power            => 31);
   PALEVEL_H_13dB_Init  : constant PALEVEL_Register_Type := (
      As_Value                => False,
      PA0_On                  => False,
      PA1_On                  => True,
      PA2_On                  => False,
      Output_Power            => 31);
   RSSITHRESH_Init      : constant Byte := 100 * 2;
   SYNCVALUE1_Init      : constant Byte := 16#F0#;
   SYNCVALUE2_Init      : constant Byte := 16#12#;
   SYNCVALUE3_Init      : constant Byte := 16#78#;
   PREAMBLELSB_Init     : constant Byte := 6;
   FDEVMSB_Init         : constant Byte := 195;
   FDEVLSB_Init         : constant Byte := 5;

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
      Put_Line (
         "Version: " & To_Hex_String (Unsigned_8 (Read_Register (VERSION))) &
         " OpMode: " & To_Hex_String (Unsigned_8 (Read_Register (OPMODE))) &
         " IrqFlags: " & To_Hex_String (Unsigned_8 (Read_Register (IRQFLAGS1))) & " " &
            To_Hex_String (Unsigned_8 (Read_Register (IRQFLAGS2))) &
         " PacketConfig: " & To_Hex_String (Unsigned_8 (Read_Register (PACKETCONFIG1))) &
            " " & To_Hex_String (Unsigned_8 (Read_Register (PACKETCONFIG2))) &
         " PayloadLength: " & To_Hex_String (Unsigned_8 (Read_Register (PAYLOADLENGTH))) &
         " PaLevel: " & To_Hex_String (Unsigned_8 (Read_Register (PALEVEL))) &
         " TestPa: " & To_Hex_String (Unsigned_8 (Read_Register (TESTPA1))) &
            To_Hex_String (Unsigned_8 (Read_Register (TESTPA2))));
      Put_Line (
         "FifoThresh: " & To_Hex_String (Unsigned_8 (Read_Register (FIFOTHRESH))) &
         " RSSIConfig: " & To_Hex_String (Unsigned_8 (Read_Register (RSSICONFIG))) &
         " RSSIValue: " & To_Hex_String (Unsigned_8 (Read_Register (RSSIVALUE))) &
         " SyncConfig: " & To_Hex_String (Unsigned_8 (Read_Register (SYNCCONFIG))) &
         " DataModul: " & To_Hex_String (Unsigned_8 (Read_Register (DATAMODUL))) &
         " Frequency: " & To_Hex_String (Unsigned_8 (Read_Register (FRFMSB))) &
            To_Hex_String (Unsigned_8 (Read_Register (FRFMID))) &
            To_Hex_String (Unsigned_8 (Read_Register (FRFLSB))) &
         " Bitrate: " & To_Hex_String (Unsigned_8 (Read_Register (BITRATEMSB))) & " " &
            To_Hex_String (Unsigned_8 (Read_Register (BITRATELSB)))
         );
   end Print_Registers;

   procedure Init is
   begin
      Write_Register (OPMODE, OPMODE_Init.Val);
      Write_Register (FIFOTHRESH, FIFOTHRESH_Init.Val);
      Write_Register (PACKETCONFIG1, PACKETCONFIG1_Init.Val);
      Write_Register (RSSITHRESH, RSSITHRESH_Init);
      Write_Register (SYNCCONFIG, SYNCCONFIG_Init.Val);
      Write_Register (SYNCVALUE1, SYNCVALUE1_Init);
      Write_Register (SYNCVALUE2, SYNCVALUE2_Init);
      Write_Register (SYNCVALUE3, SYNCVALUE3_Init);
      Write_Register (PREAMBLELSB, PREAMBLELSB_Init);
      Write_Register (DATAMODUL, DATAMODUL_Init.Val);
      Write_Register (FDEVMSB, FDEVMSB_Init);
      Write_Register (FDEVLSB, FDEVLSB_Init);
      Write_Register (RXBW, RXBW_Init.Val);
      Write_Register (AFCBW, AFCBW_Init.Val);
      if TX_PA_Boost then
         Write_Register (PALEVEL, PALEVEL_H_13db_Init.Val);
      else
         Write_Register (PALEVEL, PALEVEL_13db_Init.Val);
      end if;
      Set_Frequency (Frequency);
      IRQ.Configure_Trigger (Falling => True);
   end Init;

   procedure Set_Sync_Word (Sync_Word : Sync_Word_Type) is
   begin
      null;
   end Set_Sync_Word;

   procedure Get_Sync_Word (Sync_Word : out Sync_Word_Type) is
   begin
      Chip_Select.Clear;
      SPI.Send (SYNCVALUE1'Enum_Rep + R_REGISTER'Enum_Rep);
      for I in Sync_Word'Range loop
         SPI.Receive (Sync_Word (I));
      end loop;
      Chip_Select.Set;
   end Get_Sync_Word;

   procedure Set_Frequency (Frequency : Positive) is
      F : Unsigned_32;
   begin
      F := (Unsigned_32 (Frequency) / 1_000_000) * (2 ** 19) / (Unsigned_32 (F_Osc) / 1_000_000);
      --  F := 868 * (2 ** 19) / Unsigned_32 (F_Osc / 1_000_000);
      Chip_Select.Clear;
      SPI.Send (FRFMSB'Enum_Rep + W_REGISTER'Enum_Rep);
      SPI.Send (Byte ((F / (2 ** 16)) mod 2 ** 8));
      SPI.Send (Byte ((F / (2 ** 8)) mod 2 ** 8));
      SPI.Send (Byte (F mod 2 ** 8));
      Chip_Select.Set;
   end Set_Frequency;

   procedure Set_Bitrate (Bitrate : Positive) is
      B : Natural;
   begin
      B := F_Osc / Bitrate;
      Chip_Select.Clear;
      SPI.Send (BITRATEMSB'Enum_Rep + W_REGISTER'Enum_Rep);
      SPI.Send (Byte ((B / (2 ** 8)) mod 2 ** 8));
      SPI.Send (Byte (B mod 2 ** 8));
      Chip_Select.Set;
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
      F : IRQFLAGS1_Register_Type;
      R : Byte;
   begin
      Read_Register (OPMODE, R);
      M.Val := R;
      M.Mode := Mode;
      Write_Register (OPMODE, M.Val);
      loop
         Read_Register (IRQFLAGS1, R);
         F.Val := R;
         exit when F.Mode_Ready;
      end loop;
   end Set_Mode;

   procedure TX_Mode is
   begin
      null;
   end TX_Mode;

   procedure RX_Mode is
   begin
      Set_Mode (RX);
      Write_Register (IRQFLAGS1, 2#0000_1001#);
   end RX_Mode;

   procedure TX (Packet: Packet_Type) is
   begin
      TX (Packet, Packet'Length);
   end TX;

   procedure TX (Packet: Packet_Type; Length: Byte) is
      Wait : Natural;
   begin
      Set_Mode (TX);
      Chip_Select.Clear;
      SPI.Send (FIFO'Enum_Rep + W_REGISTER'Enum_Rep);
      SPI.Send (Length);
      for I in 0 .. Length - 1 loop
         SPI.Send (Packet (I + Packet'First));
      end loop;
      Chip_Select.Set;
      Wait := 100000;
      while not TX_Complete and Wait > 0 loop
         Wait := Wait - 1;
      end loop;
      Set_Mode (STDBY);
   end TX;

   function TX_Complete return Boolean is
      Flags : IRQFLAGS2_Register_Type;
      F : Byte;
   begin
      Read_Register (IRQFLAGS2, F);
      Flags.Val := F;
      return Flags.Packet_Sent;
   end TX_Complete;

   function RX_Available_Reg return Boolean is
      Flags : IRQFLAGS2_Register_Type;
      F : Byte;
   begin
      Read_Register (IRQFLAGS2, F);
      Flags.Val := F;
      return Flags.Payload_Ready;
   end RX_Available_Reg;

   function RX_Available return Boolean is
   begin
      return IRQ.Is_Set;
   end RX_Available;

   procedure Clear_IRQ is
   begin
      IRQ.Clear_Trigger;
   end Clear_IRQ;

   function Wait_For_RX return Boolean is
   begin
      loop
         exit when RX_Available;
      end loop;
      Clear_IRQ;
      return True;
   end Wait_For_RX;

   procedure RX (Packet : out Packet_Type; Length : out Byte) is
      L : Byte;
   begin
      Chip_Select.Clear;
      SPI.Send (FIFO'Enum_Rep + R_REGISTER'Enum_Rep);
      SPI.Receive (L);
      for I in 0 .. L - 1 loop
         exit when I = Packet'Length;
         SPI.Receive (Packet (I + Packet'First));
      end loop;
      Chip_Select.Set;
      Length := L;
   end RX;

   procedure Power_Down is
   begin
      Set_Mode (SLEEP);
   end Power_Down;

   procedure Cancel is
   begin
      null;
   end Cancel;

end Drivers.RFM69;
