with STM32_SVD.RCC; use STM32_SVD.RCC;
with HAL;

package body STM32GD.CLOCKS.TREE is

   procedure Init is
	  RCC : RCC_Peripheral renames RCC_Periph;
   begin
	  if PLL_Source = HSE_Input then
		 RCC.CR.HSEON := True;
		 while not RCC.CR.HSERDY loop
			null;
		 end loop;
	  end if;
	  RCC.CFGR := (
		 PLLMUL => HAL.UInt4 (PLL_Mul),
		 PLLSRC => (
			case PLL_Source is
			   when HSI_Input => False,
			   when HSE_Input => True),
		 others => <>);
   end;

end STM32GD.CLOCKS.TREE;
