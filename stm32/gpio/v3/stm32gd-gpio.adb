with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.SCB; use STM32_SVD.SCB;
with STM32_SVD.RCC; use STM32_SVD.RCC;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;
with STM32_SVD.NVIC; use STM32_SVD.NVIC;
with STM32_SVD.SYSCFG; use STM32_SVD.SYSCFG;
with STM32GD.EXTI;
with System; use System;

package body STM32GD.GPIO is

   function Port_Index return UInt4 is
      (if Port'Address = GPIOA_Periph'Address then 0
      elsif Port'Address = GPIOB_Periph'Address then 1
      elsif Port'Address = GPIOC_Periph'Address then 2
      elsif Port'Address = GPIOD_Periph'Address then 3
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

   procedure Set_Open_Drain is
   begin
      Port.OTYPER.OT.Arr (Integer (Pin)) := 1;
   end Set_Open_Drain;

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
      return (Port.IDR.ID.Val and Pin_Mask) = Pin_Mask;
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
      Port.ODR.OD.Val := Port.ODR.OD.Val xor Pin_Mask;
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
      EXTI.Clear_External_Interrupt (EXTI.External_Line_Number'Val (Pin));
      NVIC_Periph.ICPR := 2 ** 5;
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
