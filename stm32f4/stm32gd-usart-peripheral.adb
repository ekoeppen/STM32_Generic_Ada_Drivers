with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.USART; use STM32_SVD.USART;

package body STM32GD.USART.Peripheral is

   type USART_Periph_Access is access all USART_Peripheral;

   function USART_Periph return USART_Periph_Access is
   begin
      return (if USART = USART_1 then STM32_SVD.USART.USART1_Periph'Access
         elsif USART = USART_2 then STM32_SVD.USART.USART2_Periph'Access
         else STM32_SVD.USART.USART6_Periph'Access);
   end USART_Periph;

   procedure Enable is
   begin
      case USART is
         when USART_1 => RCC_Periph.APB2ENR.USART1EN := 1;
         when USART_2 => RCC_Periph.APB1ENR.USART2EN := 1;
         when USART_6 => RCC_Periph.APB2ENR.USART6EN := 1;
      end case;
   end Enable;

   procedure Disable is
   begin
      case USART is
         when USART_1 => RCC_Periph.APB2ENR.USART1EN := 0;
         when USART_2 => RCC_Periph.APB1ENR.USART2EN := 0;
         when USART_6 => RCC_Periph.APB2ENR.USART6EN := 0;
      end case;
   end Disable;

   procedure Init is
      Int_Scale    : constant UInt32 := 4;
      Int_Divider  : constant UInt32 := (25 * UInt32 (Clock)) / (Int_Scale * Speed);
      Frac_Divider : constant UInt32 := Int_Divider rem 100;
   begin
      USART_Periph.BRR.DIV_Fraction :=
        STM32_SVD.USART.BRR_DIV_Fraction_Field (((Frac_Divider * 16) + 50) / 100 mod 16);
      USART_Periph.BRR.DIV_Mantissa :=
        STM32_SVD.USART.BRR_DIV_Mantissa_Field (Int_Divider / 100);
      USART_Periph.CR1.UE := 1;
      USART_Periph.CR1.TE := 1;
      USART_Periph.CR1.RE := 1;
   end Init;

   procedure Transmit (Data : in Byte) is
   begin
      while USART_Periph.SR.TXE = 0 loop
         null;
      end loop;
      USART_Periph.DR.DR := UInt9 (Data);
   end Transmit;

   function Data_Available return Boolean is
   begin
      return USART_Periph.SR.RXNE = 1;
   end Data_Available;

   function Receive return Byte is
   begin
      while USART_Periph.SR.RXNE = 0 loop
         null;
      end loop;
      return Byte (USART_Periph.DR.DR and 16#FF#);
   end Receive;


end STM32GD.USART.Peripheral;
