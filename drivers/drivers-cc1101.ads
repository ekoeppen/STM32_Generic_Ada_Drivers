with STM32_SVD; use STM32_SVD;
with HAL;

generic

   with package Chip_Select is new HAL.Pin (<>);
   with package IRQ is new HAL.Pin (<>);
   with package SPI is new HAL.SPI (<>);

package Drivers.CC1101 is

   type Raw_Register_Array is array (0 .. 16#3D#) of Byte;
   type Packet_Type is array (Positive range <>) of Byte;

   procedure Init;
   procedure TX_Mode;
   procedure RX_Mode;
   procedure Set_Sync_Word (Word : Unsigned_16);
   function Get_Sync_Word return Unsigned_16;
   procedure TX (Packet: Packet_Type);
   function Wait_For_RX return Boolean;
   procedure RX (Packet : out Packet_Type; Length : out Natural);
   function RX_Available return Boolean;
   procedure Clear_IRQ;
   procedure Power_Down;
   procedure Cancel;
   procedure Read_Registers (Registers : out Raw_Register_Array);
   generic
      with procedure Put_Line (Line: in string);
   procedure Print_Registers;

end Drivers.CC1101;
