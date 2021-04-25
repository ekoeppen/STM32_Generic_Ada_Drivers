with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.SCB; use STM32_SVD.SCB;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;
with STM32_SVD.NVIC; use STM32_SVD.NVIC;
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

   procedure Enable is
   begin
      case Port is
         when Port_A => RCC_Periph.AHB1ENR.GPIOAEN := 1;
         when Port_B => RCC_Periph.AHB1ENR.GPIOBEN := 1;
         when Port_C => RCC_Periph.AHB1ENR.GPIOCEN := 1;
         when Port_D => RCC_Periph.AHB1ENR.GPIODEN := 1;
         when Port_E => RCC_Periph.AHB1ENR.GPIOEEN := 1;
         when Port_H => RCC_Periph.AHB1ENR.GPIOHEN := 1;
      end case;
   end Enable;

   procedure Disable is
   begin
      case Port is
         when Port_A => RCC_Periph.AHB1ENR.GPIOAEN := 0;
         when Port_B => RCC_Periph.AHB1ENR.GPIOBEN := 0;
         when Port_C => RCC_Periph.AHB1ENR.GPIOCEN := 0;
         when Port_D => RCC_Periph.AHB1ENR.GPIODEN := 0;
         when Port_E => RCC_Periph.AHB1ENR.GPIOEEN := 0;
         when Port_H => RCC_Periph.AHB1ENR.GPIOHEN := 0;
      end case;
   end Disable;

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
      return (Port_Periph.IDR.IDR.Val and Pin_Mask) = Pin_Mask;
   end Is_Set;

   procedure Set is
   begin
      Port_Periph.BSRR.BS.Val := GPIO_Pin'Enum_Rep (Pin);
   end Set;

   procedure Clear is
   begin
      Port_Periph.BSRR.BR.Val := GPIO_Pin'Enum_Rep (Pin);
   end Clear;

   procedure Toggle is
   begin
      Port_Periph.ODR.ODR.Val := Port_Periph.ODR.ODR.Val xor GPIO_Pin'Enum_Rep (Pin);
   end Toggle;

   procedure Configure_Alternate_Function (AF : GPIO_Alternate_Function) is
   begin
      if Index < 8 then
         Port_Periph.AFRL.Arr (Index) := UInt4 (AF);
      else
         Port_Periph.AFRH.Arr (Index) := UInt4 (AF);
      end if;
   end Configure_Alternate_Function;

   procedure Connect_External_Interrupt
   is
      Port_Id : constant UInt4 := GPIO_Port'Enum_Rep (Port);
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
      EXTI_Periph.PR.PR.Arr (Index) := 1;
      case Index is
         when 0 => NVIC_Periph.ICPR0:= 2 ** 6;
         when 1 => NVIC_Periph.ICPR0:= 2 ** 7;
         when 2 => NVIC_Periph.ICPR0:= 2 ** 8;
         when 3 => NVIC_Periph.ICPR0:= 2 ** 9;
         when 4 => NVIC_Periph.ICPR0:= 2 ** 10;
         when 5 .. 9 => NVIC_Periph.ICPR0:= 2 ** 23;
         when 10 .. 15 => NVIC_Periph.ICPR1:= 2 ** (40 - 32);
         when others =>
            raise Program_Error;
      end case;
   end Clear_Trigger;

   function Triggered return Boolean is
   begin
      return EXTI_Periph.PR.PR.Arr (Index) = 1;
   end Triggered;

   procedure Configure_Trigger (Rising : Boolean := False; Falling : Boolean := False) is
   begin
      Connect_External_Interrupt;
      if Rising then
         EXTI_Periph.RTSR.TR.Arr (Index) := 1;
      end if;
      if Falling then
         EXTI_Periph.FTSR.TR.Arr (Index) := 1;
      end if;
      EXTI_Periph.EMR.MR.Arr (Index) := 1;
   end Configure_Trigger;

end STM32GD.GPIO.Pin;
