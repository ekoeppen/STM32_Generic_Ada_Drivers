with System; use System;
with Ada.Unchecked_Conversion;
with STM32_SVD.DMA; use STM32_SVD.DMA;
with STM32_SVD.USART; use STM32_SVD.USART;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32GD.Clock;

package body STM32GD.USART is

   procedure Init is
      Clock_Speed  : constant UInt32 := UInt32 (Clock_Tree.Frequency (Clock));
      Int_Scale    : constant UInt32 := 4;
      Int_Divider  : constant UInt32 := (25 * Clock_Speed) / (Int_Scale * Speed);
      Frac_Divider : constant UInt32 := Int_Divider rem 100;
   begin
      USART.BRR.DIV_Fraction := BRR_DIV_Fraction_Field (((Frac_Divider * 16) + 50) / 100 mod 16);
      USART.BRR.DIV_Mantissa := BRR_DIV_Mantissa_Field (Int_Divider / 100);
      USART.CR1.UE := 1;
      USART.CR1.TE := 1;
      USART.CR1.RE := 1;
      if Rx_DMA then
            USART.CR3.DMAR := 1;
      end if;
      if Tx_DMA then
         USART.CR3.DMAT := 1;
      end if;
      USART.ICR.FECF := 1;
      USART.ICR.ORECF := 1;
   end Init;

   function Data_Available return Boolean is
   begin
      return USART.ISR.RXNE = 1;
   end Data_Available;

   procedure Transmit (Data : in Byte) is
   begin
      while USART.ISR.TXE = 0 loop
         null;
      end loop;
      USART.TDR.TDR := UInt9 (Data);
   end Transmit;

   function Receive return Byte is
   begin
      while USART.ISR.RXNE = 0 loop
         null;
      end loop;
      return Byte (USART.RDR.RDR);
   end Receive;

end STM32GD.USART;
