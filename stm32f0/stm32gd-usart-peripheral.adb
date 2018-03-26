with System; use System;
with Ada.Unchecked_Conversion;
with STM32_SVD.DMA; use STM32_SVD.DMA;

package body STM32GD.USART.Peripheral is

   DMA_Index : Integer := 1;

   function W is new Ada.Unchecked_Conversion (Address, UInt32);
   procedure DMA_Setup_Receive;

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
      Clock        : constant UInt32 := 8_000_000;
      Int_Scale    : constant UInt32 := 4;
      Int_Divider  : constant UInt32 := (25 * Clock) / (Int_Scale * Speed);
      Frac_Divider : constant UInt32 := Int_Divider rem 100;
   begin
      USART.BRR.DIV_Fraction :=
        STM32_SVD.USART.BRR_DIV_Fraction_Field (((Frac_Divider * 16) + 50) / 100 mod 16);
      USART.BRR.DIV_Mantissa :=
        STM32_SVD.USART.BRR_DIV_Mantissa_Field (Int_Divider / 100);
      USART.CR1.UE := 1;
      USART.CR1.TE := 1;
      USART.CR1.RE := 1;
      if RX_DMA_Buffer_Size > 0 then
         DMA_Setup_Receive;
      end if;
   end Init;

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

   procedure DMA_Transmit (Data : in USART_Data; Count : in Natural) is
   begin
      if Count > 0 then
         USART.CR3.DMAT := 1;
         if USART'Address = STM32_SVD.USART.USART1_Periph'Address then
            DMA_Periph.CPAR2 := W (STM32_SVD.USART.USART1_Periph.TDR'Address);
            DMA_Periph.CMAR2 := W (Data'Address);
            DMA_Periph.CNDTR2.NDT := UInt16 (Count);
            STM32_SVD.USART.USART1_Periph.ICR.TCCF := 1;
            DMA_Periph.CCR2.MINC := 1;
            DMA_Periph.CCR2.DIR := 1;
            DMA_Periph.CCR2.EN := 1;
            while STM32_SVD.USART.USART1_Periph.ISR.TC = 0 loop
               null;
            end loop;
            DMA_Periph.CCR2.EN := 0;
         elsif USART'Address = STM32_SVD.USART.USART1_Periph'Address then
            DMA_Periph.CPAR4 := W (STM32_SVD.USART.USART1_Periph.TDR'Address);
            DMA_Periph.CMAR4 := W (Data'Address);
            DMA_Periph.CNDTR4.NDT := UInt16 (Count);
            STM32_SVD.USART.USART1_Periph.ICR.TCCF := 1;
            DMA_Periph.CCR4.MINC := 1;
            DMA_Periph.CCR4.DIR := 1;
            DMA_Periph.CCR4.EN := 1;
            while STM32_SVD.USART.USART1_Periph.ISR.TC = 0 loop
               null;
            end loop;
            DMA_Periph.CCR4.EN := 0;
         end if;
      end if;
   end DMA_Transmit;

   procedure DMA_Transmit (Data : in USART_Data) is
   begin
      DMA_Transmit (Data, Data'Length);
   end DMA_Transmit;

   procedure DMA_Setup_Receive is
   begin
      USART.CR3.DMAR := 1;
      if USART'Address = STM32_SVD.USART.USART1_Periph'Address then
         DMA_Periph.CPAR3 := W (STM32_SVD.USART.USART1_Periph.RDR'Address);
         DMA_Periph.CMAR3 := W (RX_DMA_Buffer'Address);
         DMA_Periph.CNDTR3.NDT := RX_DMA_Buffer'Length;
         DMA_Periph.CCR3.MINC := 1;
         DMA_Periph.CCR3.CIRC := 1;
         DMA_Periph.CCR3.DIR := 0;
         DMA_Periph.CCR3.EN := 1;
      elsif USART'Address = STM32_SVD.USART.USART2_Periph'Address then
         DMA_Periph.CPAR5 := W (STM32_SVD.USART.USART2_Periph.RDR'Address);
         DMA_Periph.CMAR5 := W (RX_DMA_Buffer'Address);
         DMA_Periph.CNDTR5.NDT := RX_DMA_Buffer'Length;
         DMA_Periph.CCR5.MINC := 1;
         DMA_Periph.CCR5.CIRC := 1;
         DMA_Periph.CCR5.DIR := 0;
         DMA_Periph.CCR5.EN := 1;
      end if;
   end DMA_Setup_Receive;

   procedure DMA_Receive (Data : out USART_Data; Count : out Natural) is
      Data_Index : Integer := Data'First;
      DMA_Pos : Integer;
   begin
      Count := 0;
      DMA_Pos := RX_DMA_Buffer'Length - Integer (DMA_Periph.CNDTR3.NDT) + RX_DMA_Buffer'First;
      while DMA_Index /= DMA_Pos loop
         if Data_Index < Data'Last then
            Data (Data_Index) := RX_DMA_Buffer (DMA_Index);
            Data_Index := Data_Index + 1;
            Count := Count + 1;
         end if;
         DMA_Index := DMA_Index + 1;
         if DMA_Index > RX_DMA_Buffer'Last then
            DMA_Index := RX_DMA_Buffer'First;
         end if;
      end loop;
   end DMA_Receive;

   function DMA_Receive (Delimiter : in Byte; Data : out USART_Data; Data_Index : in out Natural) return Boolean is
      DMA_Pos : Natural;
      Delimiter_Found : Boolean := False;
   begin
      DMA_Pos := RX_DMA_Buffer'Length - Integer (DMA_Periph.CNDTR3.NDT) + RX_DMA_Buffer'First;
      while DMA_Index /= DMA_Pos and not Delimiter_Found loop
         if RX_DMA_Buffer (DMA_Index) = Delimiter then
            Delimiter_Found := True;
         end if;
         if Data_Index < Data'Last then
            Data (Data_Index) := RX_DMA_Buffer (DMA_Index);
            Data_Index := Data_Index + 1;
         end if;
         DMA_Index := DMA_Index + 1;
         if DMA_Index > RX_DMA_Buffer'Last then
            DMA_Index := RX_DMA_Buffer'First;
         end if;
      end loop;
      return Delimiter_Found or Data_Index = Data'Last;
   end DMA_Receive;

   procedure DMA_Receive (Delimiter : in Byte; Data : out USART_Data; Count : out Natural) is
      Data_Index : Integer := Data'First;
      DMA_Pos : Integer;
      Delimiter_Found : Boolean := False;
   begin
      Count := 0;
      while not Delimiter_Found and Data_Index < Data'Last loop
         DMA_Pos := RX_DMA_Buffer'Length - Integer (DMA_Periph.CNDTR3.NDT) + RX_DMA_Buffer'First;
         while DMA_Index /= DMA_Pos and not Delimiter_Found and Data_Index < Data'Last loop
            if RX_DMA_Buffer (DMA_Index) = Delimiter then
               Delimiter_Found := True;
            end if;
            Data (Data_Index) := RX_DMA_Buffer (DMA_Index);
            Data_Index := Data_Index + 1;
            Count := Count + 1;
            DMA_Index := DMA_Index + 1;
            if DMA_Index > RX_DMA_Buffer'Last then
               DMA_Index := RX_DMA_Buffer'First;
            end if;
         end loop;
      end loop;
   end DMA_Receive;

end STM32GD.USART.Peripheral;
