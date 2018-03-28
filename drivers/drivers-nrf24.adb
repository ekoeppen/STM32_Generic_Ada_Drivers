with System;
with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

package body Drivers.NRF24 is

   type Register_Type is (
      CONFIG,
      EN_AA,
      EN_RXADDR,
      SETUP_AW,
      SETUP_RETR,
      RF_CH,
      RF_SETUP,
      STATUS,
      OBSERVE_TX,
      RPD,
      RX_ADDR_P0,
      RX_ADDR_P1,
      RX_ADDR_P2,
      RX_ADDR_P3,
      RX_ADDR_P4,
      RX_ADDR_P5,
      TX_ADDR,
      RX_PW_P0,
      RX_PW_P1,
      RX_PW_P2,
      RX_PW_P3,
      RX_PW_P4,
      RX_PW_P5,
      FIFO_STATUS,
      DYNPD,
      FEATURE);

   for Register_Type use (
      CONFIG      => 16#00#,
      EN_AA       => 16#01#,
      EN_RXADDR   => 16#02#,
      SETUP_AW    => 16#03#,
      SETUP_RETR  => 16#04#,
      RF_CH       => 16#05#,
      RF_SETUP    => 16#06#,
      STATUS      => 16#07#,
      OBSERVE_TX  => 16#08#,
      RPD         => 16#09#,
      RX_ADDR_P0  => 16#0A#,
      RX_ADDR_P1  => 16#0B#,
      RX_ADDR_P2  => 16#0C#,
      RX_ADDR_P3  => 16#0D#,
      RX_ADDR_P4  => 16#0E#,
      RX_ADDR_P5  => 16#0F#,
      TX_ADDR     => 16#10#,
      RX_PW_P0    => 16#11#,
      RX_PW_P1    => 16#12#,
      RX_PW_P2    => 16#13#,
      RX_PW_P3    => 16#14#,
      RX_PW_P4    => 16#15#,
      RX_PW_P5    => 16#16#,
      FIFO_STATUS => 16#17#,
      DYNPD       => 16#1C#,
      FEATURE     => 16#1D#);

   type Command_Type is (
      R_REGISTER,
      W_REGISTER,
      R_RX_PL_WID,
      R_RX_PAYLOAD,
      W_TX_PAYLOAD,
      W_ACK_PAYLOAD,
      W_TX_PAYLOAD_NOACK,
      FLUSH_TX,
      FLUSH_RX,
      REUSE_TX_PL,
      NOP);

   for Command_Type use (
      R_REGISTER           => 2#0000_0000#,
      W_REGISTER           => 2#0010_0000#,
      R_RX_PL_WID          => 2#0110_0000#,
      R_RX_PAYLOAD         => 2#0110_0001#,
      W_TX_PAYLOAD         => 2#1010_0000#,
      W_ACK_PAYLOAD        => 2#1010_1000#,
      W_TX_PAYLOAD_NOACK   => 2#1011_0000#,
      FLUSH_TX             => 2#1110_0001#,
      FLUSH_RX             => 2#1110_0010#,
      REUSE_TX_PL          => 2#1110_0011#,
      NOP                  => 2#1111_1111#);

   type Config_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               Mask_RX_DR  : Boolean;
               Mask_TX_DS  : Boolean;
               Mask_Max_RT : Boolean;
               EN_CRC      : Boolean;
               CRCO        : Boolean;
               Pwr_Up      : Boolean;
               Prim_RX     : Boolean;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for Config_Register_Type use
      record
         Val         at 0 range 0 .. 7;
         Mask_RX_DR  at 0 range 6 .. 6;
         Mask_TX_DS  at 0 range 5 .. 5;
         Mask_Max_RT at 0 range 4 .. 4;
         EN_CRC      at 0 range 3 .. 3;
         CRCO        at 0 range 2 .. 2;
         Pwr_Up      at 0 range 1 .. 1;
         Prim_RX     at 0 range 0 .. 0;
      end record;

   type EN_AA_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               ENAA_P5 : Boolean;
               ENAA_P4 : Boolean;
               ENAA_P3 : Boolean;
               ENAA_P2 : Boolean;
               ENAA_P1 : Boolean;
               ENAA_P0 : Boolean;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for EN_AA_Register_Type use
      record
         ENAA_P5 at 0 range 5 .. 5;
         ENAA_P4 at 0 range 4 .. 4;
         ENAA_P3 at 0 range 3 .. 3;
         ENAA_P2 at 0 range 2 .. 2;
         ENAA_P1 at 0 range 1 .. 1;
         ENAA_P0 at 0 range 0 .. 0;
      end record;

   type EN_RXADDR_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               ERX_P5 : Boolean;
               ERX_P4 : Boolean;
               ERX_P3 : Boolean;
               ERX_P2 : Boolean;
               ERX_P1 : Boolean;
               ERX_P0 : Boolean;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for EN_RXADDR_Register_Type use
      record
         ERX_P5 at 0 range 5 .. 5;
         ERX_P4 at 0 range 4 .. 4;
         ERX_P3 at 0 range 3 .. 3;
         ERX_P2 at 0 range 2 .. 2;
         ERX_P1 at 0 range 1 .. 1;
         ERX_P0 at 0 range 0 .. 0;
      end record;

   type Address_Width_Type is (AW_3_Bytes, AW_4_Bytes, AW_5_Bytes);
   for Address_Width_Type use (AW_3_Bytes => 1, AW_4_Bytes => 2, AW_5_Bytes => 3);

   type Setup_AW_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               AW : Address_Width_Type;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for Setup_AW_Register_Type use
      record
         AW at 0 range 0 .. 2;
      end record;

   type RF_SETUP_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               CONST_WAVE  : Boolean;
               RF_DR_LOW   : Boolean;
               PLL_LOCK    : Boolean;
               RF_DR_HIGH  : Boolean;
               RF_PWR      : UInt2;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for RF_SETUP_Register_Type use
      record
         CONST_WAVE  at 0 range 7 .. 7;
         RF_DR_LOW   at 0 range 5 .. 5;
         PLL_LOCK    at 0 range 4 .. 4;
         RF_DR_HIGH  at 0 range 3 .. 3;
         RF_PWR      at 0 range 1 .. 2;
      end record;

   type STATUS_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               RX_DR    : Boolean;
               TX_DS    : Boolean;
               MAX_RT   : Boolean;
               RX_P_NO  : UInt3;
               TX_FULL  : Boolean;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for STATUS_Register_Type use
      record
         RX_DR    at 0 range 6 .. 6;
         TX_DS    at 0 range 5 .. 5;
         MAX_RT   at 0 range 4 .. 4;
         RX_P_NO  at 0 range 1 .. 3;
         TX_FULL  at 0 range 0 .. 0;
      end record;

   type FIFO_STATUS_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               TX_REUSE : Boolean;
               TX_FULL  : Boolean;
               TX_EMPTY : Boolean;
               RX_FULL  : Boolean;
               RX_EMPTY : Boolean;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for FIFO_STATUS_Register_Type use
      record
         TX_REUSE at 0 range 6 .. 6;
         TX_FULL  at 0 range 5 .. 5;
         TX_EMPTY at 0 range 4 .. 4;
         RX_FULL  at 0 range 1 .. 1;
         RX_EMPTY at 0 range 0 .. 0;
      end record;

   type DYNPD_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               DPL_P5 : Boolean;
               DPL_P4 : Boolean;
               DPL_P3 : Boolean;
               DPL_P2 : Boolean;
               DPL_P1 : Boolean;
               DPL_P0 : Boolean;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for DYNPD_Register_Type use
      record
         DPL_P5 at 0 range 5 .. 5;
         DPL_P4 at 0 range 4 .. 4;
         DPL_P3 at 0 range 3 .. 3;
         DPL_P2 at 0 range 2 .. 2;
         DPL_P1 at 0 range 1 .. 1;
         DPL_P0 at 0 range 0 .. 0;
      end record;

   type FEATURE_Register_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               EN_DPL      : Boolean;
               EN_ACK_PAY  : Boolean;
               EN_DYN_ACK  : Boolean;
         end case;
      end record
   with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for FEATURE_Register_Type use
      record
         EN_DPL      at 0 range 2 .. 2;
         EN_ACK_PAY  at 0 range 1 .. 1;
         EN_DYN_ACK  at 0 range 0 .. 0;
      end record;

   Config_Init       : constant Config_Register_Type     := (EN_CRC => True, others => False);
   EN_AA_Init        : constant EN_AA_Register_Type      := (others => False);
   Status_Init       : constant Status_Register_Type     := (RX_DR => True, TX_DS => True, MAX_RT => True, RX_P_NO => 0, others => False);
   AW_Init           : constant Setup_AW_Register_Type   := (AW => AW_5_Bytes, others => False);
   EN_RXADDR_Init    : constant EN_RXADDR_Register_Type  := (ERX_P0 => True, ERX_P1 => True, others => False);
   RF_SETUP_Init     : constant RF_SETUP_Register_Type   := (RF_DR_LOW => True, RF_DR_HIGH => False, RF_PWR => 3, others => False);
   FEATURE_Init      : constant FEATURE_Register_Type    := (EN_DPL => True, others => False);
   DYNPD_Init        : constant DYNPD_Register_Type      := (DPL_P0 => True, DPL_P1 => True, others => False);
   RX_Mode_Setting   : constant Config_Register_Type     := (EN_CRC => True, PRIM_RX => True, PWR_UP => True, others => False);
   TX_Mode_Setting   : constant Config_Register_Type     := (EN_CRC => True, PWR_UP => True, others => False);

   procedure Write_Register (Register : Register_Type; Value : Byte);
   procedure Read_Register (Register : Register_Type; Value : out Byte);
   function Read_Register (Register : Register_Type) return Byte;
   procedure Send_Address (Address : Address_Type);

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
         "Status:" & Integer'Image (Integer (Read_Register (STATUS))) &
         " RX P0:" & Integer'Image (Integer (Read_Register (RX_PW_P0))) &
         " RX P1:" & Integer'Image (Integer (Read_Register (RX_PW_P1))) &
         " FIFO Status:" & Integer'Image (Integer (Read_Register (FIFO_STATUS)))
         );
   end Print_Registers;

   procedure Init is
   begin
      Power_Down;
      Write_Register (SETUP_AW, AW_Init.Val);
      Write_Register (EN_AA, EN_AA_Init.Val);
      Write_Register (STATUS, STATUS_Init.Val);
      Write_Register (RF_SETUP, RF_SETUP_Init.Val);
      Write_Register (EN_RXADDR, EN_RXADDR_Init.Val);
      Write_Register (DYNPD, DYNPD_Init.Val);
      Write_Register (FEATURE, FEATURE_Init.Val);
      Chip_Select.Clear;
      SPI.Send (FLUSH_TX'Enum_Rep);
      Chip_Select.Set;
      Chip_Select.Clear;
      SPI.Send (FLUSH_RX'Enum_Rep);
      Chip_Select.Set;
   end Init;

   procedure Set_Channel (Channel : Channel_Type) is
   begin
      Write_Register (RF_CH, Channel);
   end Set_Channel;

   procedure Send_Address (Address : Address_Type) is
   begin
      for I in Address'Range loop
         SPI.Send (Address (I));
      end loop;
   end Send_Address;

   procedure Set_RX_Address (Address : Address_Type) is
   begin
      Chip_Select.Clear;
      SPI.Send (RX_ADDR_P1'Enum_Rep + W_REGISTER'Enum_Rep);
      Send_Address (Address);
      Chip_Select.Set;
   end Set_RX_Address;

   procedure Set_TX_Address (Address : Address_Type) is
   begin
      Chip_Select.Clear;
      SPI.Send (TX_ADDR'Enum_Rep + W_REGISTER'Enum_Rep);
      Send_Address (Address);
      Chip_Select.Set;
      Chip_Select.Clear;
      SPI.Send (RX_ADDR_P0'Enum_Rep + W_REGISTER'Enum_Rep);
      Send_Address (Address);
      Chip_Select.Set;
   end Set_TX_Address;

   procedure TX_Mode is
   begin
      Write_Register (CONFIG, TX_Mode_Setting.Val);
   end TX_Mode;

   procedure RX_Mode is
   begin
      Write_Register (CONFIG, RX_Mode_Setting.Val);
      Chip_Enable.Set;
   end RX_Mode;

   procedure TX (Packet: Packet_Type) is
      CE_Delay : constant Time_Span := Microseconds (20);
   begin
      IRQ.Clear_Trigger;
      Chip_Select.Clear;
      SPI.Send (FLUSH_TX'Enum_Rep);
      Chip_Select.Set;
      Chip_Select.Clear;
      SPI.Send (W_TX_PAYLOAD_NOACK'Enum_Rep);
      for I in Packet'Range loop
         SPI.Send (Packet (I));
      end loop;
      Chip_Select.Set;
      Chip_Enable.Set;
      delay until Clock + CE_Delay;
      Chip_Enable.Clear;
      IRQ.Wait_For_Trigger;
      Write_Register (STATUS, STATUS_Init.Val);
   end TX;

   function Wait_For_RX return Boolean is
   begin
      IRQ.Clear_Trigger;
      IRQ.Wait_For_Trigger;
      Write_Register (STATUS, STATUS_Init.Val);
      return IRQ.Triggered;
   end Wait_For_RX;

   procedure RX (Packet : out Packet_Type) is
   begin
      Chip_Select.Clear;
      SPI.Send (FLUSH_RX'Enum_Rep);
      Chip_Select.Set;
   end RX;

   procedure Power_Down is
   begin
      Chip_Enable.Clear;
      Write_Register (CONFIG, Config_Init.Val);
   end Power_Down;

   procedure Cancel is
   begin
      IRQ.Cancel_Wait;
   end Cancel;

end Drivers.NRF24;
