with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with HAL;

package body STM32GD.CLOCK.TREE is

   procedure Init is
	  RCC : RCC_Peripheral renames RCC_Periph;
   begin
	  if PLL_Source = HSE_Input then
		 RCC.CR.HSEON := 1;
		 while RCC.CR.HSERDY = 0 loop
			null;
		 end loop;
	  end if;
	  RCC.CFGR := (
		 PLLMUL => UInt4 (PLL_Mul),
		 PLLSRC => (
			case PLL_Source is
			   when HSI_Input => 1,
			   when HSE_Input => 1),
		 others => <>);
   end;

end STM32GD.CLOCK.TREE;
