with STM32_SVD.TIM;
with STM32_SVD; use STM32_SVD;

package STM32GD.Timer is

   type Timer_Callback_Type is access procedure;
   type Timer_Type is (
      Timer_1, Timer2, Timer_3, Timer_6, Timer_7, Timer_8,
      Timer_15, Timer_16, Timer_17, Timer_20);

end STM32GD.Timer;

