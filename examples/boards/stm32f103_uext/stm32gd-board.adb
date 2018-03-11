with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC;
with STM32_SVD.NVIC;
with STM32_SVD.GPIO;
with STM32_SVD.USB; use STM32_SVD.USB;
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
      --  SWO.Init;
      LED_RED.Init;
      LED_GREEN.Init;
   end Init;

	procedure USB_Re_Enumerate is
	begin
		Ada.Text_IO.Put_Line ("Re-enumerate");
		STM32_SVD.GPIO.GPIOA_Periph.CRH.CNF12 := 0;
		STM32_SVD.GPIO.GPIOA_Periph.CRH.MODE12 := 1;
		STM32_SVD.GPIO.GPIOA_Periph.BSRR.BR.Arr (12) := 1;
		declare
			I : UInt32 with volatile;
		begin
			I := 100000;
			while I > 0 loop
				I := I - 1;
			end loop;
		end;
		STM32_SVD.GPIO.GPIOA_Periph.CRH.CNF12 := 1;
		STM32_SVD.GPIO.GPIOA_Periph.CRH.MODE12 := 0;
	end USB_Re_Enumerate;

end STM32GD.Board;


