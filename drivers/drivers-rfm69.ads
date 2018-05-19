with Ada.Real_Time; use Ada.Real_Time;
with STM32_SVD; use STM32_SVD;
with HAL;

generic

   with package Chip_Select is new HAL.Pin (<>);
   with package IRQ is new HAL.Pin (<>);
   with package SPI is new HAL.SPI (<>);

package Drivers.RFM69 is

   type Raw_Register_Array is array (0 .. 16#4D#) of Byte;
   subtype Address_Type is Byte;
   type Sync_Word_Type is array (Positive range <>) of Byte
      with Dynamic_Predicate => Sync_Word_Type'Length <= 8;
   type Packet_Type is array (Positive range <>) of Byte;

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
   function Wait_For_RX return Boolean;
   procedure RX (Packet : out Packet_Type);
   procedure Power_Down;
   procedure Cancel;
   procedure Read_Registers (Registers : out Raw_Register_Array);
   procedure Print_Registers;

end Drivers.RFM69;
