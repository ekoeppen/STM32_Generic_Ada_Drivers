with STM32_SVD; use STM32_SVD;
with STM32_SVD.RCC; use STM32_SVD.RCC;

package body STM32GD.Clock.Tree is

   function Frequency (Clock : Clock_Type) return Integer is
   begin
      case Clock is
         when STM32GD.Clock.RTCCLK => return RTCCLK;
         when STM32GD.Clock.SYSCLK => return SYSCLK;
         when STM32GD.Clock.PCLK => return PCLK;
         when STM32GD.Clock.HSI => return HSI_Value;
         when STM32GD.Clock.LSI => return LSI_Value;
         when STM32GD.Clock.LSE => return LSE_Value;
         when STM32GD.Clock.PLLCLK => return PLL_Output_Value;
         when STM32GD.Clock.HCLK => return HCLK;
      end case;
   end Frequency;

   procedure Init is
   begin
      if LSI_Enabled then
         RCC_Periph.CSR.LSION := 1;
         while RCC_Periph.CSR.LSIRDY = 0 loop
            null;
         end loop;
      end if;
   end Init;

end STM32GD.Clock.Tree;
