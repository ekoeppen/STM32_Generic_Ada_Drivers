package body STM32GD.USB is

	function EP_Unused_Reset (BTable_Offset : Integer) return Integer is
	begin
		return BTable_Offset;
	end EP_Unused_Reset;

	procedure EP_Unused_Handler (Out_Transaction : Boolean) is
	begin
		null;
	end EP_Unused_Handler;

   procedure Set_TX_Status (EP : Endpoint_Range; Status : EP_Status) is
	begin
		USB_Endpoints (EP).STAT_TX := USB_Endpoints (EP).STAT_TX xor Status'Enum_Rep;
	end Set_TX_Status;

   procedure Set_RX_Status (EP : Endpoint_Range; Status : EP_Status) is
	begin
		USB_Endpoints (EP).STAT_RX := USB_Endpoints (EP).STAT_RX xor Status'Enum_Rep;
	end Set_RX_Status;

   procedure Set_TX_RX_Status (EP : Endpoint_Range; TX_Status : EP_Status; RX_Status : EP_Status) is
	begin
		USB_Endpoints (EP).STAT_TX := USB_Endpoints (EP).STAT_TX xor TX_Status'Enum_Rep;
		USB_Endpoints (EP).STAT_RX := USB_Endpoints (EP).STAT_RX xor RX_Status'Enum_Rep;
	end Set_TX_RX_Status;


end STM32GD.USB;
