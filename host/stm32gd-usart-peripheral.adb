with System; use System;
--  with Ada.Text_IO;

package body STM32GD.USART.Peripheral is

   procedure putchar (Data : in Character) with Import => true, Convention => C;

   procedure Init is
   begin
      null;
   end Init;

   procedure Transmit (Data : in Byte) is
   begin
      putchar (Character'Val (Data));
   end Transmit;

   function Receive return Byte is
   begin
      return 0;
   end Receive;

end STM32GD.USART.Peripheral;
