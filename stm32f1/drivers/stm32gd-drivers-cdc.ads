package STM32GD.Drivers.CDC is

   function EP0_Reset (BTable_Offset : Integer) return Integer;
   procedure EP0_Handler (Out_Transaction : Boolean);

end STM32GD.Drivers.CDC;
