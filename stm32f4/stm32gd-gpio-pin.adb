with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.SYSCFG; use STM32_SVD.SYSCFG;
with STM32GD.GPIO.Port;

package body STM32GD.GPIO.Pin is

   Index : constant Natural := GPIO_Pin'Pos (Pin);
   Pin_Mask : constant UInt16 := GPIO_Pin'Enum_Rep (Pin);

   procedure Init is
   begin
      if Mode /= Mode_In then
         Set_Mode (Mode);
      end if;
      if Pull_Resistor /= Floating then
         Set_Pull_Resistor (Pull_Resistor);
      end if;
   end Init;

   procedure Set_Mode (Mode : Pin_IO_Modes) is
   begin
      Port.MODER.Arr (Index) := Pin_IO_Modes'Enum_Rep (Mode);
   end Set_Mode;

   function Get_Pull_Resistor return Internal_Pin_Resistors is
   begin
      if Port.PUPDR.Arr (Index) = 0 then
         return Floating;
      elsif Port.PUPDR.Arr (Index) = 1 then
         return Pull_Up;
      else
         return Pull_Down;
      end if;
   end Get_Pull_Resistor;

   procedure Set_Pull_Resistor (Pull : Internal_Pin_Resistors) is
   begin
      Port.PUPDR.Arr (Index) := Internal_Pin_Resistors'Enum_Rep (Pull);
   end Set_Pull_Resistor;

   function Is_Set return Boolean is
   begin
      return (Port.IDR.IDR.Val and Pin_Mask) = Pin_Mask;
   end Is_Set;

   procedure Set is
   begin
      Port.BSRR.BS.Val := GPIO_Pin'Enum_Rep (Pin);
   end Set;

   procedure Clear is
   begin
      Port.BSRR.BR.Val := GPIO_Pin'Enum_Rep (Pin);
   end Clear;

   procedure Toggle is
   begin
      Port.ODR.ODR.Val := Port.ODR.ODR.Val xor GPIO_Pin'Enum_Rep (Pin);
   end Toggle;

   procedure Configure_Alternate_Function (AF : GPIO_Alternate_Function) is
   begin
      if Index < 8 then
         Port.AFRL.Arr (Index) := UInt4 (AF);
      else
         Port.AFRH.Arr (Index) := UInt4 (AF);
      end if;
   end Configure_Alternate_Function;

   procedure Connect_External_Interrupt
   is
      Port_Id  : constant UInt4 := STM32GD.GPIO.Port.GPIO_Port_Representation (Port);
   begin
      case Index is
         when 0 .. 3 =>
            SYSCFG_Periph.EXTICR1.EXTI.Arr (Index) := Port_Id;
         when 4 .. 7 =>
            SYSCFG_Periph.EXTICR2.EXTI.Arr (Index) := Port_Id;
         when 8 .. 11 =>
            SYSCFG_Periph.EXTICR3.EXTI.Arr (Index) := Port_Id;
         when 12 .. 15 =>
            SYSCFG_Periph.EXTICR4.EXTI.Arr (Index) := Port_Id;
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

