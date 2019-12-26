with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.SYSCFG; use STM32_SVD.SYSCFG;
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
      elsif Port = Port_E then STM32_SVD.GPIO.GPIOE_Periph'Access
      else STM32_SVD.GPIO.GPIOH_Periph'Access); end Port_Periph;

   procedure Init is
   begin
      if Mode /= Mode_In then
         Set_Mode (Mode);
      end if;
      if Pull_Resistor /= Floating then
         Set_Pull_Resistor (Pull_Resistor);
      end if;
      if Alternate_Function /= 0 then
         Configure_Alternate_Function (Alternate_Function);
      end if;
   end Init;

   procedure Enable is
   begin
      case Port is
         when Port_A => RCC_Periph.IOPENR.IOPAEN := 1;
         when Port_B => RCC_Periph.IOPENR.IOPBEN := 1;
         when Port_C => RCC_Periph.IOPENR.IOPCEN := 1;
         when Port_D => RCC_Periph.IOPENR.IOPDEN := 1;
         when Port_E => RCC_Periph.IOPENR.IOPEEN := 1;
         when Port_H => RCC_Periph.IOPENR.IOPHEN := 1;
      end case;
   end Enable;

   procedure Disable is
   begin
      case Port is
         when Port_A => RCC_Periph.IOPENR.IOPAEN := 0;
         when Port_B => RCC_Periph.IOPENR.IOPBEN := 0;
         when Port_C => RCC_Periph.IOPENR.IOPCEN := 0;
         when Port_D => RCC_Periph.IOPENR.IOPDEN := 0;
         when Port_E => RCC_Periph.IOPENR.IOPEEN := 0;
         when Port_H => RCC_Periph.IOPENR.IOPHEN := 0;
      end case;
   end Disable;

   procedure Set_Mode (Mode : Pin_IO_Modes) is
   begin
      Port_Periph.MODER.Arr (Index) := Pin_IO_Modes'Enum_Rep (Mode);
   end Set_Mode;

   procedure Set_Type (Pin_Type : Pin_Output_Types) is
   begin
      Port_Periph.OTYPER.OT.Arr (Index) := Pin_Output_Types'Enum_Rep (Pin_Type);
   end Set_Type;

   function Get_Pull_Resistor return Internal_Pin_Resistors is
   begin
      if Port_Periph.PUPDR.Arr (Index) = 0 then
         return Floating;
      elsif Port_Periph.PUPDR.Arr (Index) = 1 then
         return Pull_Up;
      else
         return Pull_Down;
      end if;
   end Get_Pull_Resistor;

   procedure Set_Pull_Resistor (Pull : Internal_Pin_Resistors) is
   begin
      Port_Periph.PUPDR.Arr (Index) := Internal_Pin_Resistors'Enum_Rep (Pull);
   end Set_Pull_Resistor;

   function Is_Set return Boolean is
   begin
      return (Port_Periph.IDR.ID.Val and Pin_Mask) = Pin_Mask;
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
      Port_Periph.ODR.OD.Val := Port_Periph.ODR.OD.Val xor GPIO_Pin'Enum_Rep (Pin);
   end Toggle;

   procedure Configure_Alternate_Function (AF : GPIO_Alternate_Function) is
   begin
      if Index < 8 then
         Port_Periph.AFRL.Arr (Index) := UInt4 (AF);
      else
         Port_Periph.AFRH.Arr (Index) := UInt4 (AF);
      end if;
   end Configure_Alternate_Function;

end STM32GD.GPIO.Pin;
