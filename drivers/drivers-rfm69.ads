with Ada.Real_Time; use Ada.Real_Time;
with STM32_SVD; use STM32_SVD;
with HAL;

generic

   with package Chip_Select is new HAL.Pin (<>);
   with package IRQ is new HAL.Pin (<>);
   with package SPI is new HAL.SPI (<>);
   AES_Enabled : Boolean := False;
   Packet_Size : Positive := 64;
   Frequency : Positive;

package Drivers.RFM69 is

   subtype Packet_Size_Type is Positive range 1 .. Packet_Size;
   subtype Address_Type is Byte;
   type Sync_Word_Type is array (Positive range <>) of Byte
      with Dynamic_Predicate => Sync_Word_Type'Length <= 8;
   type Packet_Type is array (Packet_Size_Type) of Byte;
   type AES_Key_Type is array (Positive range 1 .. 16) of Byte;
   type Raw_Register_Array is array (0 .. 16#4D#) of Byte;

   pragma Compile_Time_Error ((AES_Enabled and Packet_Size > 64) or
      (not AES_Enabled and Packet_Size > 256), "Invalid packet size");

   procedure Init;
   procedure Set_Sync_Word (Sync_Word : Sync_Word_Type);
   procedure Set_Frequency (Frequency : Natural);
   procedure Set_Bitrate (Bitrate : Natural);
   procedure Set_Broadcast_Address (Address : Address_Type);
   procedure Set_RX_Address (Address : Address_Type);
   procedure Set_TX_Address (Address : Address_Type);
   procedure TX_Mode;
   procedure RX_Mode;
   procedure TX (Packet: Packet_Type);
   function RX_Available return Boolean;
   function TX_Complete return Boolean;
   function Wait_For_RX return Boolean;
   procedure RX (Packet : out Packet_Type);
   procedure Power_Down;
   procedure Cancel;
   procedure Read_Registers (Registers : out Raw_Register_Array);
   procedure Print_Registers;

end Drivers.RFM69;
