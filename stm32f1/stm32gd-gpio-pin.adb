with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.AFIO; use STM32_SVD.AFIO;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32GD.GPIO.Port;

package body STM32GD.GPIO.Pin is

   type Port_Periph_Access is access all GPIO_Peripheral;

   function Index return Natural is begin return GPIO_Pin'Pos (Pin); end Index;
   function Pin_Mask return UInt16 is begin return GPIO_Pin'Enum_Rep (Pin); end Pin_Mask;
   function Port_Periph return Port_Periph_Access is begin
      return (if Port = Port_A then STM32_SVD.GPIO.GPIOA_Periph'Access
      elsif Port = Port_B then STM32_SVD.GPIO.GPIOB_Periph'Access
      elsif Port = Port_C then STM32_SVD.GPIO.GPIOC_Periph'Access
      elsif Port = Port_D then STM32_SVD.GPIO.GPIOD_Periph'Access
      else STM32_SVD.GPIO.GPIOF_Periph'Access); end Port_Periph;

   procedure Enable is
   begin
      case Port is
         when Port_A => RCC_Periph.APB2ENR.IOPAEN := 1;
         when Port_B => RCC_Periph.APB2ENR.IOPBEN := 1;
         when Port_C => RCC_Periph.APB2ENR.IOPCEN := 1;
         when Port_D => RCC_Periph.APB2ENR.IOPDEN := 1;
         when Port_F => RCC_Periph.APB2ENR.IOPFEN := 1;
      end case;
   end Enable;

   procedure Disable is
   begin
      case Port is
         when Port_A => RCC_Periph.APB2ENR.IOPAEN := 0;
         when Port_B => RCC_Periph.APB2ENR.IOPBEN := 0;
         when Port_C => RCC_Periph.APB2ENR.IOPCEN := 0;
         when Port_D => RCC_Periph.APB2ENR.IOPDEN := 0;
         when Port_F => RCC_Periph.APB2ENR.IOPFEN := 0;
      end case;
   end Disable;

   procedure Init is
   begin
      if Mode /= Input then
         Set_Mode (Mode);
         Set_Out_Conf (Out_Conf);
      else
         if In_Conf /= In_Analog then
            Set_In_Conf (In_Conf);
         end if;
      end if;
   end Init;

   procedure Set_Mode (Mode : Pin_IO_Modes) is
   begin
      case Index is
         when  0 => Port_Periph.CRL.MODE0  := Pin_IO_Modes'Enum_Rep (Mode);
         when  1 => Port_Periph.CRL.MODE1  := Pin_IO_Modes'Enum_Rep (Mode);
         when  2 => Port_Periph.CRL.MODE2  := Pin_IO_Modes'Enum_Rep (Mode);
         when  3 => Port_Periph.CRL.MODE3  := Pin_IO_Modes'Enum_Rep (Mode);
         when  4 => Port_Periph.CRL.MODE4  := Pin_IO_Modes'Enum_Rep (Mode);
         when  5 => Port_Periph.CRL.MODE5  := Pin_IO_Modes'Enum_Rep (Mode);
         when  6 => Port_Periph.CRL.MODE6  := Pin_IO_Modes'Enum_Rep (Mode);
         when  7 => Port_Periph.CRL.MODE7  := Pin_IO_Modes'Enum_Rep (Mode);
         when  8 => Port_Periph.CRH.MODE8  := Pin_IO_Modes'Enum_Rep (Mode);
         when  9 => Port_Periph.CRH.MODE9  := Pin_IO_Modes'Enum_Rep (Mode);
         when 10 => Port_Periph.CRH.MODE10 := Pin_IO_Modes'Enum_Rep (Mode);
         when 11 => Port_Periph.CRH.MODE11 := Pin_IO_Modes'Enum_Rep (Mode);
         when 12 => Port_Periph.CRH.MODE12 := Pin_IO_Modes'Enum_Rep (Mode);
         when 13 => Port_Periph.CRH.MODE13 := Pin_IO_Modes'Enum_Rep (Mode);
         when 14 => Port_Periph.CRH.MODE14 := Pin_IO_Modes'Enum_Rep (Mode);
         when 15 => Port_Periph.CRH.MODE15 := Pin_IO_Modes'Enum_Rep (Mode);
         when others => null;
      end case;
   end Set_Mode;

   procedure Set_In_Conf (Conf : Pin_In_Conf) is
   begin
      case Index is
         when  0 => Port_Periph.CRL.CNF0  := Pin_In_Conf'Enum_Rep (Conf);
         when  1 => Port_Periph.CRL.CNF1  := Pin_In_Conf'Enum_Rep (Conf);
         when  2 => Port_Periph.CRL.CNF2  := Pin_In_Conf'Enum_Rep (Conf);
         when  3 => Port_Periph.CRL.CNF3  := Pin_In_Conf'Enum_Rep (Conf);
         when  4 => Port_Periph.CRL.CNF4  := Pin_In_Conf'Enum_Rep (Conf);
         when  5 => Port_Periph.CRL.CNF5  := Pin_In_Conf'Enum_Rep (Conf);
         when  6 => Port_Periph.CRL.CNF6  := Pin_In_Conf'Enum_Rep (Conf);
         when  7 => Port_Periph.CRL.CNF7  := Pin_In_Conf'Enum_Rep (Conf);
         when  8 => Port_Periph.CRH.CNF8  := Pin_In_Conf'Enum_Rep (Conf);
         when  9 => Port_Periph.CRH.CNF9  := Pin_In_Conf'Enum_Rep (Conf);
         when 10 => Port_Periph.CRH.CNF10 := Pin_In_Conf'Enum_Rep (Conf);
         when 11 => Port_Periph.CRH.CNF11 := Pin_In_Conf'Enum_Rep (Conf);
         when 12 => Port_Periph.CRH.CNF12 := Pin_In_Conf'Enum_Rep (Conf);
         when 13 => Port_Periph.CRH.CNF13 := Pin_In_Conf'Enum_Rep (Conf);
         when 14 => Port_Periph.CRH.CNF14 := Pin_In_Conf'Enum_Rep (Conf);
         when 15 => Port_Periph.CRH.CNF15 := Pin_In_Conf'Enum_Rep (Conf);
         when others => null;
      end case;
   end Set_In_Conf;

   procedure Set_Out_Conf (Conf : Pin_Out_Conf) is
   begin
      case Index is
         when  0 => Port_Periph.CRL.CNF0  := Pin_Out_Conf'Enum_Rep (Conf);
         when  1 => Port_Periph.CRL.CNF1  := Pin_Out_Conf'Enum_Rep (Conf);
         when  2 => Port_Periph.CRL.CNF2  := Pin_Out_Conf'Enum_Rep (Conf);
         when  3 => Port_Periph.CRL.CNF3  := Pin_Out_Conf'Enum_Rep (Conf);
         when  4 => Port_Periph.CRL.CNF4  := Pin_Out_Conf'Enum_Rep (Conf);
         when  5 => Port_Periph.CRL.CNF5  := Pin_Out_Conf'Enum_Rep (Conf);
         when  6 => Port_Periph.CRL.CNF6  := Pin_Out_Conf'Enum_Rep (Conf);
         when  7 => Port_Periph.CRL.CNF7  := Pin_Out_Conf'Enum_Rep (Conf);
         when  8 => Port_Periph.CRH.CNF8  := Pin_Out_Conf'Enum_Rep (Conf);
         when  9 => Port_Periph.CRH.CNF9  := Pin_Out_Conf'Enum_Rep (Conf);
         when 10 => Port_Periph.CRH.CNF10 := Pin_Out_Conf'Enum_Rep (Conf);
         when 11 => Port_Periph.CRH.CNF11 := Pin_Out_Conf'Enum_Rep (Conf);
         when 12 => Port_Periph.CRH.CNF12 := Pin_Out_Conf'Enum_Rep (Conf);
         when 13 => Port_Periph.CRH.CNF13 := Pin_Out_Conf'Enum_Rep (Conf);
         when 14 => Port_Periph.CRH.CNF14 := Pin_Out_Conf'Enum_Rep (Conf);
         when 15 => Port_Periph.CRH.CNF15 := Pin_Out_Conf'Enum_Rep (Conf);
         when others => null;
      end case;
   end Set_Out_Conf;

   function Is_Set return Boolean is
   begin
      return Port_Periph.IDR.IDR.Arr (Index) = 1;
   end Is_Set;

   procedure Set is
   begin
      Port_Periph.BSRR.BS.Val := GPIO_Pin'Enum_Rep (Pin);
   end Set;

   procedure Clear is
   begin
      Port_Periph.BRR.BR.Val := GPIO_Pin'Enum_Rep (Pin);
   end Clear;

   procedure Toggle is
   begin
      Port_Periph.ODR.ODR.Val := Port_Periph.ODR.ODR.Val xor GPIO_Pin'Enum_Rep (Pin);
   end Toggle;

end STM32GD.GPIO.Pin;
