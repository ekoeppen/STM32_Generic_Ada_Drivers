with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.SCB; use STM32_SVD.SCB;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;
with STM32_SVD.NVIC; use STM32_SVD.NVIC;
with STM32GD.EXTI;

package body STM32GD.GPIO is

   function Port_Index return UInt4 is
      (if Port = GPIOA_Periph then 0
      elsif Port = GPIOB_Periph then 1
      elsif Port = GPIOC_Periph then 2
      elsif Port = GPIOD_Periph then 3
      else 5);

   procedure Set_Output is null;
   procedure Set_Input is null;
   procedure Set_Alternate_Output is null;
   procedure Set_Analog_Input is null;
   procedure Set_Open_Drain is null;
   procedure Set_Push_Pull is null;
   procedure Set_Pull_Up is null;
   procedure Set_Pull_Down is null;
   procedure Set_No_Pull is null;

   function Get_Mode return UInt2 is
   begin
      if Input or Analog_Input then
         return 0;
      end if;
      if High_Speed then
         return 2#11#;
      end if;
      if Medium_Speed then
         return 2#01#;
      end if;
      return 2#10#;
   end Get_Mode;

   function Get_Cnf return UInt2 is
   begin
      if Get_Mode = 0 then
         if Analog_Input then
            return 0;
         end if;
         if Pull_Up or Pull_Down then
            return 2#10#;
         end if;
         return 2#01#;
      end if;
      if Alternate_Output then
         if Open_Drain then
            return 2#11#;
         end if;
         return 2#10#;
      end if;
      if Open_Drain then
         return 2#01#;
      end if;
      return 2#00#;
   end Get_Cnf;

   procedure Init is
      Mode : UInt2 := Get_Mode;
      Cnf : UInt2 := Get_Cnf;
   begin
      case Pin is
         when  0 => Port.CRL.MODE0  := Mode; Port.CRL.CNF0  := Cnf;
         when  1 => Port.CRL.MODE1  := Mode; Port.CRL.CNF1  := Cnf;
         when  2 => Port.CRL.MODE2  := Mode; Port.CRL.CNF2  := Cnf;
         when  3 => Port.CRL.MODE3  := Mode; Port.CRL.CNF3  := Cnf;
         when  4 => Port.CRL.MODE4  := Mode; Port.CRL.CNF4  := Cnf;
         when  5 => Port.CRL.MODE5  := Mode; Port.CRL.CNF5  := Cnf;
         when  6 => Port.CRL.MODE6  := Mode; Port.CRL.CNF6  := Cnf;
         when  7 => Port.CRL.MODE7  := Mode; Port.CRL.CNF7  := Cnf;
         when  8 => Port.CRH.MODE8  := Mode; Port.CRH.CNF8  := Cnf;
         when  9 => Port.CRH.MODE9  := Mode; Port.CRH.CNF9  := Cnf;
         when 10 => Port.CRH.MODE10 := Mode; Port.CRH.CNF10 := Cnf;
         when 11 => Port.CRH.MODE11 := Mode; Port.CRH.CNF11 := Cnf;
         when 12 => Port.CRH.MODE12 := Mode; Port.CRH.CNF12 := Cnf;
         when 13 => Port.CRH.MODE13 := Mode; Port.CRH.CNF13 := Cnf;
         when 14 => Port.CRH.MODE14 := Mode; Port.CRH.CNF14 := Cnf;
         when 15 => Port.CRH.MODE15 := Mode; Port.CRH.CNF15 := Cnf;
         when others => null;
      end case;
   end Init;

   function Is_Set return Boolean is
   begin
      return (Port.IDR.IDR.Val and Pin_Mask) = Pin_Mask;
   end Is_Set;

   procedure Set is
   begin
      Port.BSRR.BS.Val := Pin_Mask;
   end Set;

   procedure Clear is
   begin
      Port.BRR.BR.Val := Pin_Mask;
   end Clear;

   procedure Toggle is
   begin
      Port.ODR.ODR.Val := Port.ODR.ODR.Val xor Pin_Mask;
   end Toggle;

   procedure Connect_External_Interrupt is
   begin
      EXTI.Connect_External_Interrupt (Pin, Port_Index);
   end Connect_External_Interrupt;

   procedure Wait_For_Trigger is
   begin
      loop
         STM32GD.Wait_For_Event;
         exit when Triggered;
      end loop;
      Clear_Trigger;
   end Wait_For_Trigger;

   procedure Clear_Trigger is
   begin
      EXTI.Clear_External_Interrupt (EXTI.External_Line_Number'Val (Pin));
      NVIC_Periph.ICPR0 := 2 ** 5;
   end Clear_Trigger;

   function Triggered return Boolean is
   begin
      return EXTI.External_Interrupt_Pending (EXTI.External_Line_Number'Val (Pin));
   end Triggered;

   procedure Configure_Trigger (Rising : Boolean := False; Falling : Boolean := False) is
   begin
      Connect_External_Interrupt;
      if Rising then
         EXTI.Enable_External_Event (EXTI.External_Line_Number'Val (Pin), EXTI.Interrupt_Rising_Edge);
      end if;
      if Falling then
         EXTI.Enable_External_Event (EXTI.External_Line_Number'Val (Pin), EXTI.Interrupt_Rising_Edge);
      end if;
   end Configure_Trigger;

end STM32GD.GPIO;
