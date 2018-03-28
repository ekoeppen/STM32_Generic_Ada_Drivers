with Ada.Real_Time; use Ada.Real_Time;
with STM32_SVD; use STM32_SVD;
with HAL;

generic

   with package Chip_Select is new HAL.Pin (<>);
   with package Chip_Enable is new HAL.Pin (<>);
   with package IRQ is new HAL.Pin (<>);
   with package SPI is new HAL.SPI (<>);

package Drivers.NRF24 is

   type Raw_Register_Array is array (0 .. 16#1D#) of Byte;
   subtype Channel_Type is Byte range 0 .. 127;
   type Address_Type is array (1 .. 5) of Byte;
   type Packet_Type is array (Positive range <>) of Byte;

   procedure Init;
   procedure Set_Channel (Channel : Channel_Type);
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

end Drivers.NRF24;
