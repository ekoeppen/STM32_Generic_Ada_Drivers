with STM32_SVD; use STM32_SVD;
with STM32GD.USB; use STM32GD.USB;
with Ada.Text_IO;

package body STM32GD.Drivers.CDC is

   --  TODO: Add functions to read/write data from/to the buffer table
   --  TODO: Add record types for control transfers

   procedure EP0_Setup;
   procedure EP0_Out;
   procedure EP0_In;

   procedure EP0_Setup is
   begin
      Ada.Text_IO.Put_Line ("EP0_Setup");
   end EP0_Setup;

   procedure EP0_Out is
   begin
      Ada.Text_IO.Put_Line ("EP0_Out");
   end EP0_Out;

   procedure EP0_In is
   begin
      Ada.Text_IO.Put_Line ("EP0_In");
   end EP0_In;

   function EP0_Reset (BTable_Offset : Integer) return Integer is
      --  TODO: Set address offsets correctly
      --  TODO: Return proper offset
   begin
     USB_Endpoints (0).EP_Type := Control'Enum_Rep;
     USB_BTABLE_Descriptors (0) := (
        Addr_TX => 0, Count_TX => 0,
        Addr_RX => 16#80#, Count_RX => (BL_SIZE => 1, NUM_BLOCKS => 2, COUNTx_RX => 0));
     Set_TX_RX_Status (0, TX_Status => Stall, RX_Status => Valid);
     return BTable_Offset + 16#40# * 2;
   end EP0_Reset;

   procedure EP0_Handler (Out_Transaction : Boolean) is
   begin
      if USB_Endpoints (0).Setup = 1 then
         EP0_Setup;
      elsif Out_Transaction then
         EP0_Out;
      else
         EP0_In;
      end if;
   end EP0_Handler;

end STM32GD.Drivers.CDC;
