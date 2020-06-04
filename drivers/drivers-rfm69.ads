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

   subtype Address_Type is Byte;
   type Sync_Word_Type is array (Byte range <>) of Byte
      with Dynamic_Predicate => Sync_Word_Type'Length <= 8;
   type Packet_Type is array (Byte range <>) of Byte;
   type AES_Key_Type is array (Byte range 1 .. 16) of Byte;
   type Raw_Register_Array is array (0 .. 16#4D#) of Byte;

   procedure Init;
   procedure Set_Sync_Word (Sync_Word : Sync_Word_Type);
   procedure Get_Sync_Word (Sync_Word : out Sync_Word_Type);
   procedure Set_Frequency (Frequency : Positive);
   procedure Set_Bitrate (Bitrate : Positive);
   procedure Set_Broadcast_Address (Address : Address_Type);
   procedure Set_RX_Address (Address : Address_Type);
   procedure Set_TX_Address (Address : Address_Type);
   procedure TX_Mode;
   procedure RX_Mode;
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
