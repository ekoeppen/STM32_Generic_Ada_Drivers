with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.SCB; use STM32_SVD.SCB;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;
with STM32_SVD.NVIC; use STM32_SVD.NVIC;
with STM32_SVD.SYSCFG; use STM32_SVD.SYSCFG;
with STM32GD.EXTI;

package body STM32GD.GPIO is

   function Port_Index return UInt4 is
      (if Port = GPIOA_Periph then 0
      elsif Port = GPIOB_Periph then 1
      elsif Port = GPIOC_Periph then 2
      elsif Port = GPIOD_Periph then 3
      else 5);

   procedure Set_Output is
   begin
      Port.MODER.Arr (Integer (Pin)) := 2#01#;
   end Set_Output;

   procedure Set_Input is
   begin
      Port.MODER.Arr (Integer (Pin)) := 2#00#;
   end Set_Input;

   procedure Set_Alternate is
   begin
      Port.MODER.Arr (Integer (Pin)) := 2#10#;
   end Set_Alternate;

   procedure Set_Analog_Input is
   begin
      Port.MODER.Arr (Integer (Pin)) := 2#11#;
   end Set_Analog_Input;

   procedure Set_Pull_Up is
   begin
      Port.PUPDR.Arr (Integer (Pin)) := 2#01#;
   end Set_Pull_Up;

   procedure Set_Pull_Down is
   begin
         Port.PUPDR.Arr (Integer (Pin)) := 2#10#;
   end Set_Pull_Down;

   procedure Set_No_Pull is
   begin
         Port.PUPDR.Arr (Integer (Pin)) := 2#00#;
   end Set_No_Pull;

   procedure Init is
   begin
      if Output then
         Port.MODER.Arr (Integer (Pin)) := 2#01#;
         if Open_Drain_Output then
            Port.OTYPER.OT.Arr (Integer (Pin)) := 2#1#;
         end if;
         if Medium_Speed then
            Port.OSPEEDR.Arr (Integer (Pin)) := 2#01#;
         elsif High_Speed then
            Port.OSPEEDR.Arr (Integer (Pin)) := 2#10#;
         end if;
      elsif Alternate then
         Port.MODER.Arr (Integer (Pin)) := 2#10#;
         if  Alternate_Function /= 0 then
            Configure_Alternate_Function (Alternate_Function);
         end if;
      elsif Analog_Input then
         Port.MODER.Arr (Integer (Pin)) := 2#11#;
      end if;
      if Pull_Up then
         Port.PUPDR.Arr (Integer (Pin)) := 2#01#;
      elsif Pull_Down then
         Port.PUPDR.Arr (Integer (Pin)) := 2#10#;
      end if;
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

   procedure Configure_Alternate_Function (AF : UInt4) is
   begin
      if Pin < 8 then
         Port.AFRL.Arr (Integer (Pin)) := AF;
      else
         Port.AFRH.Arr (Integer (Pin)) := AF;
      end if;
   end Configure_Alternate_Function;

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
      EXTI_Periph.PR.PR.Arr (Integer (Pin)) := 1;
      NVIC_Periph.ICPR := 2 ** 5;
   end Clear_Trigger;

   function Triggered return Boolean is
   begin
      return EXTI_Periph.PR.PR.Arr (Integer (Pin)) = 1;
   end Triggered;

   procedure Configure_Trigger (Rising : Boolean := False; Falling : Boolean := False) is
   begin
      Connect_External_Interrupt;
      if Rising then
         EXTI_Periph.RTSR.TR.Arr (Integer (Pin)) := 1;
      end if;
      if Falling then
         EXTI_Periph.FTSR.TR.Arr (Integer (Pin)) := 1;
      end if;
      EXTI_Periph.EMR.MR.Arr (Integer(Integer (Pin))) := 1;
   end Configure_Trigger;

end STM32GD.GPIO;
