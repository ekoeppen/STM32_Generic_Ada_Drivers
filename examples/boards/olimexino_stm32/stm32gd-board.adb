with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC;
with STM32_SVD.NVIC;
with Ada.Text_IO;

package body STM32GD.Board is

   procedure Init is
   begin
      STM32_SVD.RCC.RCC_Periph.APB2ENR.AFIOEN := 1;
      STM32_SVD.RCC.RCC_Periph.APB2ENR.IOPAEN := 1;
      STM32_SVD.RCC.RCC_Periph.APB2ENR.IOPBEN := 1;
      STM32_SVD.RCC.RCC_Periph.APB2ENR.IOPCEN := 1;
      STM32_SVD.NVIC.NVIC_Periph.ISER0 := 2#00000000_10000000_00000000_00000000#;
      BUTTON.Init;
      USB_DISC.Init;
      SWO.Init;
      LED_RED.Init;
      LED_GREEN.Init;
   end Init;

   procedure USB_Re_Enumerate is
   begin
      Ada.Text_IO.Put_Line ("Re-enumerate");
      USB_DISC.Set;
      declare
         I : UInt32 with volatile;
      begin
         I := 10000;
         while I > 0 loop
            I := I - 1;
         end loop;
      end;
      USB_DISC.Clear;
   end USB_Re_Enumerate;

end STM32GD.Board;


