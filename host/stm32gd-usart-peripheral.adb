with System; use System;
with Ada.Text_IO;

package body STM32GD.USART.Peripheral is

   procedure Init is
   begin
      null;
   end Init;

   procedure Transmit (Data : in Byte) is
   begin
      Ada.Text_IO.Put (Character'Val (Data));
   end Transmit;

   function Receive return Byte is
   begin
      return 0;
   end Receive;

end STM32GD.USART.Peripheral;
