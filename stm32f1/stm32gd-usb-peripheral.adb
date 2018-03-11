with STM32_SVD; use STM32_SVD;
with STM32_SVD.GPIO;
with STM32_SVD.USB; use STM32_SVD.USB;
with STM32_SVD.RCC;
with Ada.Interrupts.Names;
with Ada.Text_IO;

package body STM32GD.USB.Peripheral is
   
   procedure Init is
   begin
      STM32_SVD.RCC.RCC_Periph.APB1ENR.USBEN := 1;
      STM32_SVD.RCC.RCC_Periph.APB1RSTR.USBRST := 1;
      STM32_SVD.RCC.RCC_Periph.APB1RSTR.USBRST:= 0;
      USB_Periph.CNTR.FRES := 1;
      USB_Periph.CNTR := (
         CTRM => 1, WKUPM => 1, RESETM => 1, SUSPM => 1,
         Reserved_5_7 => 0, Reserved_16_31 => 0, others => 0
         );
   end Init;

   procedure Handle_Reset is
      BTable_Offset : Integer := 0;
   begin
      Ada.Text_IO.Put_Line ("Reset");
      USB_Periph.DADDR.ADD := 0;
      USB_Periph.DADDR.EF := 1;
      BTable_Offset := EP0_Reset_Callback (BTable_Offset);
      BTable_Offset := EP1_Reset_Callback (BTable_Offset);
      BTable_Offset := EP2_Reset_Callback (BTable_Offset);
      BTable_Offset := EP3_Reset_Callback (BTable_Offset);
      BTable_Offset := EP4_Reset_Callback (BTable_Offset);
      BTable_Offset := EP5_Reset_Callback (BTable_Offset);
      BTable_Offset := EP6_Reset_Callback (BTable_Offset);
      BTable_Offset := EP7_Reset_Callback (BTable_Offset);
   end Handle_Reset;

   protected body Handler is

   procedure IRQ_Handler is
   begin
      if USB_Periph.ISTR.CTR = 1 then
         USB_Periph.ISTR.CTR := 0;
         Ada.Text_IO.Put_Line ("Control");
         case USB_Periph.ISTR.EP_ID is
            when 0 => EP0_Handler_Callback (USB_Periph.ISTR.DIR = 1);
            when others => EP0_Handler_Callback (USB_Periph.ISTR.DIR = 1);
         end case;
      elsif USB_Periph.ISTR.RESET = 1 then
         USB_Periph.ISTR.RESET := 0;
         Handle_Reset;
      elsif USB_Periph.ISTR.WKUP = 1 then
         USB_Periph.ISTR.WKUP := 0;
         USB_Periph.CNTR := (
            CTRM => 1, WKUPM => 1, RESETM => 1, SUSPM => 1,
            Reserved_5_7 => 0, Reserved_16_31 => 0, others => 0
            );
         Ada.Text_IO.Put_Line ("Wakeup");
      elsif USB_Periph.ISTR.SUSP = 1 then
         USB_Periph.ISTR.SUSP := 0;
         USB_Periph.CNTR.LPMODE := 1;
         USB_Periph.CNTR.FSUSP := 1;
         Ada.Text_IO.Put_Line ("Suspend");
      end if;
   end IRQ_Handler;

end Handler;

end STM32GD.USB.Peripheral;

