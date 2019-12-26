with STM32_SVD; use STM32_SVD;

package Monotonic_Counter is

   Counter : UInt32;
   Overflow : Boolean;

   procedure Reset;

end Monotonic_Counter;
