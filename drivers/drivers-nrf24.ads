with STM32_SVD; use STM32_SVD;
with HAL;

generic

   with package Chip_Select is new HAL.Pin (<>);
   with package Chip_Enable is new HAL.Pin (<>);
   with package IRQ is new HAL.Pin (<>);
   with package SPI is new HAL.SPI (<>);
   Channel : Byte := 70;

package Drivers.NRF24 is

   type Raw_Register_Array is array (0 .. 16#1D#) of Byte;
   type Address_Type is array (1 .. 5) of Byte;
   type Packet_Type is array (Byte range <>) of Byte;

   procedure Init;
   procedure Set_Channel (Ch : Byte);
   function Get_Channel return Byte;
   procedure Set_RX_Address (Address : Address_Type);
   procedure Set_TX_Address (Address : Address_Type);
   procedure TX_Mode;
   procedure RX_Mode;
   procedure TX (Packet: Packet_Type);
   function Wait_For_RX return Boolean;
   procedure RX (Packet : out Packet_Type; Length : out Positive);
   function RX_Available return Boolean;
   procedure Clear_IRQ;
   procedure Power_Down;
   procedure Cancel;
   procedure Read_Registers (Registers : out Raw_Register_Array);
   generic
      with procedure Put_Line (Line: in string);
   procedure Print_Registers;

end Drivers.NRF24;
