with STM32_SVD; use STM32_SVD;
with System; use System;

package body STM32GD.GPIO.Port is

   function GPIO_Port_Representation (Port : STM32_SVD.GPIO.GPIO_Peripheral) return UInt4 is
   begin
      if Port'Address = GPIOA_Base then
         return 0;
      elsif Port'Address = GPIOB_Base then
         return 1;
      elsif Port'Address = GPIOC_Base then
         return 2;
      elsif Port'Address = GPIOD_Base then
         return 3;
      elsif Port'Address = GPIOE_Base then
         return 4;
      elsif Port'Address = GPIOH_Base then
         return 7;
      else
         raise Program_Error;
      end if;
   end GPIO_Port_Representation;

end STM32GD.GPIO.Port;
