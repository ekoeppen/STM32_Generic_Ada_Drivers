with STM32_SVD; use STM32_SVD;
with STM32_SVD.GPIO;
with STM32_SVD.USB;
with System;

package STM32GD.USB is

   -----------------------------------------------------------------------------
   --  Endpoint register and associated types and operations
   -----------------------------------------------------------------------------

   subtype EPxR_EA_Field is STM32_SVD.UInt4;
   subtype EPxR_STAT_TX_Field is STM32_SVD.UInt2;
   subtype EPxR_DTOG_TX_Field is STM32_SVD.Bit;
   subtype EPxR_CTR_TX_Field is STM32_SVD.Bit;
   subtype EPxR_EP_KIND_Field is STM32_SVD.Bit;
   subtype EPxR_EP_TYPE_Field is STM32_SVD.UInt2;
   subtype EPxR_SETUP_Field is STM32_SVD.Bit;
   subtype EPxR_STAT_RX_Field is STM32_SVD.UInt2;
   subtype EPxR_DTOG_RX_Field is STM32_SVD.Bit;
   subtype EPxR_CTR_RX_Field is STM32_SVD.Bit;

   type EPxR_Register is record
      --  Endpoint address
      EA             : EPxR_EA_Field := 16#0#;
      --  Status bits, for transmission transfers
      STAT_TX        : EPxR_STAT_TX_Field := 16#0#;
      --  Data Toggle, for transmission transfers
      DTOG_TX        : EPxR_DTOG_TX_Field := 16#0#;
      --  Correct Transfer for transmission
      CTR_TX         : EPxR_CTR_TX_Field := 16#0#;
      --  Endpoint kind
      EP_KIND        : EPxR_EP_KIND_Field := 16#0#;
      --  Endpoint type
      EP_TYPE        : EPxR_EP_TYPE_Field := 16#0#;
      --  Setup transaction completed
      SETUP          : EPxR_SETUP_Field := 16#0#;
      --  Status bits, for reception transfers
      STAT_RX        : EPxR_STAT_RX_Field := 16#0#;
      --  Data Toggle, for reception transfers
      DTOG_RX        : EPxR_DTOG_RX_Field := 16#0#;
      --  Correct transfer for reception
      CTR_RX         : EPxR_CTR_RX_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EPxR_Register use record
      EA             at 0 range 0 .. 3;
      STAT_TX        at 0 range 4 .. 5;
      DTOG_TX        at 0 range 6 .. 6;
      CTR_TX         at 0 range 7 .. 7;
      EP_KIND        at 0 range 8 .. 8;
      EP_TYPE        at 0 range 9 .. 10;
      SETUP          at 0 range 11 .. 11;
      STAT_RX        at 0 range 12 .. 13;
      DTOG_RX        at 0 range 14 .. 14;
      CTR_RX         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   type EP_Status is (Disabled, Stall, NAK, Valid);
   for EP_Status use (Disabled => 0, Stall => 1, NAK => 2, Valid => 3);

   type EP_Type is (Bulk, Control, Iso, Interrupt);
   for EP_Type use (Bulk => 0, Control => 1, Iso => 2, Interrupt => 3);

   type Endpoint_Range is range 0 .. 7;
   type Endpoint_Array_Type is array (Endpoint_Range) of EPxR_Register;

   USB_Endpoints : aliased Endpoint_Array_Type
     with Import, Address => System'To_Address (16#40005C00#);

   function EP_Unused_Reset (BTable_Offset : Integer) return Integer;
   procedure EP_Unused_Handler (Out_Transaction : Boolean);

   procedure Set_TX_Status (EP : Endpoint_Range; Status : EP_Status);
   procedure Set_RX_Status (EP : Endpoint_Range; Status : EP_Status);
   procedure Set_TX_RX_Status (EP : Endpoint_Range; TX_Status : EP_Status; RX_Status : EP_Status);

   -----------------------------------------------------------------------------
   --  Buffer table types and operations
   -----------------------------------------------------------------------------

   subtype USB_ADDRx_TX is STM32_SVD.UInt16
      with Dynamic_Predicate => USB_ADDRx_TX mod 2 = 0;
   subtype USB_ADDRx_RX is STM32_SVD.UInt16
      with Dynamic_Predicate => USB_ADDRx_RX mod 2 = 0;
   subtype USB_COUNTx_TX is STM32_SVD.UInt10;

   type USB_COUNTx_RX is record
      BL_SIZE     : STM32_SVD.Bit := 16#0#;
      NUM_BLOCKS  : STM32_SVD.UInt5 := 16#0#;
      COUNTx_RX   : STM32_SVD.UInt10 := 16#0#;
   end record;

   for USB_COUNTx_RX use record
      BL_SIZE     at 0 range 15 .. 15;
      NUM_BLOCKS  at 0 range 10 .. 14;
      COUNTx_RX   at 0 range 0 .. 9;
   end record;

   type USB_BTABLE_Descriptor is record
      Addr_TX  : USB_ADDRx_TX := 16#0#;
      Count_TX : USB_COUNTx_TX := 16#0#;
      Addr_RX  : USB_ADDRx_RX := 16#0#;
      Count_RX : USB_COUNTx_RX;
   end record;

   for USB_BTABLE_Descriptor use record
      Addr_TX  at 0 range 0 .. 15;
      Count_TX at 2 range 0 .. 15;
      Addr_RX  at 4 range 0 .. 15;
      Count_RX at 6 range 0 .. 15;
   end record;

   pragma Warnings (Off, "bits of*unused");
   for USB_BTABLE_Descriptor'Size use (4 * 2 + 4 * 2) * 8;
   pragma Warnings (On, "bits of*unused");

   type USB_BTABLE_Descriptor_Array is array (Endpoint_Range) of USB_BTABLE_Descriptor;
   USB_BTABLE_Descriptors : aliased USB_BTABLE_Descriptor_Array
     with Import, Address => System'To_Address (16#40006000#);


   type USB_BTABLE_Type is array (0 .. 1023) of UInt16;
   USB_BTABLE : aliased USB_BTABLE_Type
     with Import, Address => System'To_Address (16#40006000#);

end STM32GD.USB;
