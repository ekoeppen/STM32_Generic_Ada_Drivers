with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.AFIO; use STM32_SVD.AFIO;
with STM32GD.GPIO.Port;

package body STM32GD.GPIO.Pin is

   Index : constant Natural := GPIO_Pin'Pos (Pin);
   Pin_Mask : constant UInt16 := GPIO_Pin'Enum_Rep (Pin);

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
         when  0 => Port.CRL.MODE0  := Pin_IO_Modes'Enum_Rep (Mode);
         when  1 => Port.CRL.MODE1  := Pin_IO_Modes'Enum_Rep (Mode);
         when  2 => Port.CRL.MODE2  := Pin_IO_Modes'Enum_Rep (Mode);
         when  3 => Port.CRL.MODE3  := Pin_IO_Modes'Enum_Rep (Mode);
         when  4 => Port.CRL.MODE4  := Pin_IO_Modes'Enum_Rep (Mode);
         when  5 => Port.CRL.MODE5  := Pin_IO_Modes'Enum_Rep (Mode);
         when  6 => Port.CRL.MODE6  := Pin_IO_Modes'Enum_Rep (Mode);
         when  7 => Port.CRL.MODE7  := Pin_IO_Modes'Enum_Rep (Mode);
         when  8 => Port.CRH.MODE8  := Pin_IO_Modes'Enum_Rep (Mode);
         when  9 => Port.CRH.MODE9  := Pin_IO_Modes'Enum_Rep (Mode);
         when 10 => Port.CRH.MODE10 := Pin_IO_Modes'Enum_Rep (Mode);
         when 11 => Port.CRH.MODE11 := Pin_IO_Modes'Enum_Rep (Mode);
         when 12 => Port.CRH.MODE12 := Pin_IO_Modes'Enum_Rep (Mode);
         when 13 => Port.CRH.MODE13 := Pin_IO_Modes'Enum_Rep (Mode);
         when 14 => Port.CRH.MODE14 := Pin_IO_Modes'Enum_Rep (Mode);
         when 15 => Port.CRH.MODE15 := Pin_IO_Modes'Enum_Rep (Mode);
         when others => null;
      end case;
   end Set_Mode;

   procedure Set_In_Conf (Conf : Pin_In_Conf) is
   begin
      case Index is
         when  0 => Port.CRL.CNF0  := Pin_In_Conf'Enum_Rep (Conf);
         when  1 => Port.CRL.CNF1  := Pin_In_Conf'Enum_Rep (Conf);
         when  2 => Port.CRL.CNF2  := Pin_In_Conf'Enum_Rep (Conf);
         when  3 => Port.CRL.CNF3  := Pin_In_Conf'Enum_Rep (Conf);
         when  4 => Port.CRL.CNF4  := Pin_In_Conf'Enum_Rep (Conf);
         when  5 => Port.CRL.CNF5  := Pin_In_Conf'Enum_Rep (Conf);
         when  6 => Port.CRL.CNF6  := Pin_In_Conf'Enum_Rep (Conf);
         when  7 => Port.CRL.CNF7  := Pin_In_Conf'Enum_Rep (Conf);
         when  8 => Port.CRH.CNF8  := Pin_In_Conf'Enum_Rep (Conf);
         when  9 => Port.CRH.CNF9  := Pin_In_Conf'Enum_Rep (Conf);
         when 10 => Port.CRH.CNF10 := Pin_In_Conf'Enum_Rep (Conf);
         when 11 => Port.CRH.CNF11 := Pin_In_Conf'Enum_Rep (Conf);
         when 12 => Port.CRH.CNF12 := Pin_In_Conf'Enum_Rep (Conf);
         when 13 => Port.CRH.CNF13 := Pin_In_Conf'Enum_Rep (Conf);
         when 14 => Port.CRH.CNF14 := Pin_In_Conf'Enum_Rep (Conf);
         when 15 => Port.CRH.CNF15 := Pin_In_Conf'Enum_Rep (Conf);
         when others => null;
      end case;
   end Set_In_Conf;

   procedure Set_Out_Conf (Conf : Pin_Out_Conf) is
   begin
      case Index is
         when  0 => Port.CRL.CNF0  := Pin_Out_Conf'Enum_Rep (Conf);
         when  1 => Port.CRL.CNF1  := Pin_Out_Conf'Enum_Rep (Conf);
         when  2 => Port.CRL.CNF2  := Pin_Out_Conf'Enum_Rep (Conf);
         when  3 => Port.CRL.CNF3  := Pin_Out_Conf'Enum_Rep (Conf);
         when  4 => Port.CRL.CNF4  := Pin_Out_Conf'Enum_Rep (Conf);
         when  5 => Port.CRL.CNF5  := Pin_Out_Conf'Enum_Rep (Conf);
         when  6 => Port.CRL.CNF6  := Pin_Out_Conf'Enum_Rep (Conf);
         when  7 => Port.CRL.CNF7  := Pin_Out_Conf'Enum_Rep (Conf);
         when  8 => Port.CRH.CNF8  := Pin_Out_Conf'Enum_Rep (Conf);
         when  9 => Port.CRH.CNF9  := Pin_Out_Conf'Enum_Rep (Conf);
         when 10 => Port.CRH.CNF10 := Pin_Out_Conf'Enum_Rep (Conf);
         when 11 => Port.CRH.CNF11 := Pin_Out_Conf'Enum_Rep (Conf);
         when 12 => Port.CRH.CNF12 := Pin_Out_Conf'Enum_Rep (Conf);
         when 13 => Port.CRH.CNF13 := Pin_Out_Conf'Enum_Rep (Conf);
         when 14 => Port.CRH.CNF14 := Pin_Out_Conf'Enum_Rep (Conf);
         when 15 => Port.CRH.CNF15 := Pin_Out_Conf'Enum_Rep (Conf);
         when others => null;
      end case;
   end Set_Out_Conf;

   function Is_Set return Boolean is
   begin
      return Port.IDR.IDR.Arr (Index) = 1;
   end Is_Set;

   procedure Set is
   begin
      Port.BSRR.BS.Val := GPIO_Pin'Enum_Rep (Pin);
   end Set;

   procedure Clear is
   begin
      Port.BRR.BR.Val := GPIO_Pin'Enum_Rep (Pin);
   end Clear;

   procedure Toggle is
   begin
      Port.ODR.ODR.Val := Port.ODR.ODR.Val xor GPIO_Pin'Enum_Rep (Pin);
   end Toggle;

   procedure Connect_External_Interrupt
   is
      Port_Id  : constant UInt4 := STM32GD.GPIO.Port.GPIO_Port_Representation (Port);
   begin
      case Index is
         when 0 .. 3 =>
            AFIO_Periph.EXTICR1.EXTI.Arr (Index) := Port_Id;
         when 4 .. 7 =>
            AFIO_Periph.EXTICR2.EXTI.Arr (Index) := Port_Id;
         when 8 .. 11 =>
            AFIO_Periph.EXTICR3.EXTI.Arr (Index) := Port_Id;
         when 12 .. 15 =>
            AFIO_Periph.EXTICR4.EXTI.Arr (Index) := Port_Id;
         when others =>
            raise Program_Error;
      end case;
   end Connect_External_Interrupt;

   function Interrupt_Line_Number return STM32GD.EXTI.External_Line_Number
   is
   begin
      return STM32GD.EXTI.External_Line_Number'Val (Index);
   end Interrupt_Line_Number;

   procedure Configure_Trigger (Trigger : EXTI.External_Triggers)
   is
      use STM32GD.EXTI;
      Line : constant External_Line_Number := External_Line_Number'Val (Index);
   begin
      Connect_External_Interrupt;
      if Trigger in Interrupt_Triggers then
         Enable_External_Interrupt (Line, Trigger);
      else
         Enable_External_Event (Line, Trigger);
      end if;
   end Configure_Trigger;

end STM32GD.GPIO.Pin;

