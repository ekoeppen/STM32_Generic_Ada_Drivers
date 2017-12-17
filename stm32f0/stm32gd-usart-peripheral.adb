package body STM32GD.USART.Peripheral is

   procedure Init is
      Clock        : constant UInt32 := 8_000_000;
      Int_Scale    : constant UInt32 := 4;
      Int_Divider  : constant UInt32 := (25 * Clock) / (Int_Scale * Speed);
      Frac_Divider : constant UInt32 := Int_Divider rem 100;
   begin
      USART.BRR.DIV_Fraction :=
        STM32_SVD.USART.BRR_DIV_Fraction_Field (((Frac_Divider * 16) + 50) / 100 mod 16);
      USART.BRR.DIV_Mantissa :=
        STM32_SVD.USART.BRR_DIV_Mantissa_Field (Int_Divider / 100);
      USART.CR1.UE := True;
      USART.CR1.TE := True;
      USART.CR1.RE := True;
   end Init;

   procedure Transmit (Data : in UInt8) is
   begin
      while not USART.ISR.TXE loop
         null;
      end loop;
      USART.TDR.TDR := UInt9 (Data);
   end Transmit;

end STM32GD.USART.Peripheral;
