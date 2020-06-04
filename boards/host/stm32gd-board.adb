with STM32_SVD; use STM32_SVD;

package body STM32GD.Board is

   procedure Init is
   begin
      USART.Init;
   end Init;

end STM32GD.Board;
