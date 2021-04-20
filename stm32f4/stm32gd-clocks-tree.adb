with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with HAL;

package body STM32GD.CLOCKS.TREE is

   procedure Init is
	  RCC : RCC_Peripheral renames RCC_Periph;
   begin
	  if PLL_Source = HSE_Input then
		 RCC.CR.HSEON := 1;
		 while RCC.CR.HSERDY = 0 loop
			null;
		 end loop;
	  end if;
   end;

end STM32GD.CLOCKS.TREE;
