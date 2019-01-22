with System; use System;
with Ada.Unchecked_Conversion;
with STM32_SVD.DMA; use STM32_SVD.DMA;

package body STM32GD.USART.Peripheral is

   DMA_Index : Integer := 1;

   function W is new Ada.Unchecked_Conversion (Address, UInt32);

   protected body IRQ_Handler is
      entry Wait when Data_Available is
      begin
         Data_Available := False;
      end Wait;

      procedure Handler is
      begin
         USART.ICR.TCCF := 1;
         USART.ICR.IDLECF := 1;
         USART.ICR.EOBCF := 1;
         Data_Available := True;
      end Handler;
   end IRQ_Handler;

   procedure Init is
      Int_Scale    : constant UInt32 := 4;
      Int_Divider  : constant UInt32 := (25 * UInt32 (Clock)) / (Int_Scale * Speed);
      Frac_Divider : constant UInt32 := Int_Divider rem 100;
   begin
      USART.BRR.DIV_Fraction :=
        STM32_SVD.USART.BRR_DIV_Fraction_Field (((Frac_Divider * 16) + 50) / 100 mod 16);
      USART.BRR.DIV_Mantissa :=
        STM32_SVD.USART.BRR_DIV_Mantissa_Field (Int_Divider / 100);
      USART.CR1.UE := 1;
      USART.CR1.TE := 1;
      USART.CR1.RE := 1;
      USART.ICR.ORECF := 1;
      USART.ICR.FECF := 1;
   end Init;

   procedure Transmit (Data : in Byte) is
   begin
      USART.ICR.FECF := 1;
      while USART.ISR.TXE = 0 loop
         null;
      end loop;
      USART.TDR.TDR := UInt9 (Data);
   end Transmit;

   function Receive return Byte is
   begin
      USART.ICR.ORECF := 1;
      USART.ICR.FECF := 1;
      while USART.ISR.RXNE = 0 loop
         null;
      end loop;
      return Byte (USART.RDR.RDR);
   end Receive;

end STM32GD.USART.Peripheral;
