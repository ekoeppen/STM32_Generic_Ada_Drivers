with Ada.Interrupts.Names;
with STM32GD.USB;

generic

   with function EP0_Reset_Callback (BTable_Offset : Integer) return Integer is STM32GD.USB.EP_Unused_Reset;
   with function EP1_Reset_Callback (BTable_Offset : Integer) return Integer is STM32GD.USB.EP_Unused_Reset;
   with function EP2_Reset_Callback (BTable_Offset : Integer) return Integer is STM32GD.USB.EP_Unused_Reset;
   with function EP3_Reset_Callback (BTable_Offset : Integer) return Integer is STM32GD.USB.EP_Unused_Reset;
   with function EP4_Reset_Callback (BTable_Offset : Integer) return Integer is STM32GD.USB.EP_Unused_Reset;
   with function EP5_Reset_Callback (BTable_Offset : Integer) return Integer is STM32GD.USB.EP_Unused_Reset;
   with function EP6_Reset_Callback (BTable_Offset : Integer) return Integer is STM32GD.USB.EP_Unused_Reset;
   with function EP7_Reset_Callback (BTable_Offset : Integer) return Integer is STM32GD.USB.EP_Unused_Reset;

   with procedure EP0_Handler_Callback (Out_Transaction : Boolean) is STM32GD.USB.EP_Unused_Handler;
   with procedure EP1_Handler_Callback (Out_Transaction : Boolean) is STM32GD.USB.EP_Unused_Handler;
   with procedure EP2_Handler_Callback (Out_Transaction : Boolean) is STM32GD.USB.EP_Unused_Handler;
   with procedure EP3_Handler_Callback (Out_Transaction : Boolean) is STM32GD.USB.EP_Unused_Handler;
   with procedure EP4_Handler_Callback (Out_Transaction : Boolean) is STM32GD.USB.EP_Unused_Handler;
   with procedure EP5_Handler_Callback (Out_Transaction : Boolean) is STM32GD.USB.EP_Unused_Handler;
   with procedure EP6_Handler_Callback (Out_Transaction : Boolean) is STM32GD.USB.EP_Unused_Handler;
   with procedure EP7_Handler_Callback (Out_Transaction : Boolean) is STM32GD.USB.EP_Unused_Handler;

package STM32GD.USB.Peripheral is

   procedure Init;
   procedure Handle_Reset;

   protected Handler is
      pragma Interrupt_Priority;
   private
      procedure IRQ_Handler;
      pragma Attach_Handler (IRQ_Handler, Ada.Interrupts.Names.USB_LP_CAN_RX0);
   end Handler;

end STM32GD.USB.Peripheral;
