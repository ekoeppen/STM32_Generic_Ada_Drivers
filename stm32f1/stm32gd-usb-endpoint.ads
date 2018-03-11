with STM32_SVD; use STM32_SVD;
with STM32_SVD.GPIO;
with STM32_SVD.USB;
with Ada.Interrupts.Names;
with System;

generic

   Number : Integer;

package STM32GD.USB.Endpoint is

   procedure Handle_Ctr;

end STM32GD.USB.Endpoint;
