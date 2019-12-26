with STM32_SVD.GPIO; use STM32_SVD.GPIO;
with STM32_SVD.SYSCFG; use STM32_SVD.SYSCFG;
with STM32GD.EXTI;
with STM32GD.GPIO.Port;

package body STM32GD.GPIO.IRQ is

   Index : constant Natural := GPIO_Pin'Pos (Pin.Pin);
   Pin_Mask : constant UInt16 := GPIO_Pin'Enum_Rep (Pin.Pin);

   procedure Connect_External_Interrupt
   is
      Port_Id  : constant UInt4 := GPIO_Port'Enum_Rep (Pin.Port);
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

   procedure Wait_For_Trigger is
   begin
      STM32GD.EXTI.IRQ_Handler.Wait;
   end Wait_For_Trigger;

   procedure Clear_Trigger is
   begin
      STM32GD.EXTI.IRQ_Handler.Reset_Status (Interrupt_Line_Number);
   end Clear_Trigger;

   function Triggered return Boolean is
   begin
      return STM32GD.EXTI.IRQ_Handler.Status (Interrupt_Line_Number);
   end Triggered;

   procedure Cancel_Wait is
   begin
      STM32GD.EXTI.IRQ_Handler.Cancel;
   end Cancel_Wait;

   procedure Configure_Trigger (Event : Boolean := False; Rising : Boolean := False; Falling : Boolean := False)
   is
      use STM32GD.EXTI;
      Line : constant External_Line_Number := External_Line_Number'Val (Index);
      T : External_Triggers;
   begin
      Connect_External_Interrupt;
      if Event then
         if Rising and Falling then T := Event_Rising_Falling_Edge;
         elsif Rising then T := Event_Rising_Edge;
         else T := Event_Falling_Edge;
         Enable_External_Event (Line, T);
         end if;
      else
         if Rising and Falling then T := Interrupt_Rising_Falling_Edge;
         elsif Rising then T := Interrupt_Rising_Edge;
         else T := Interrupt_Falling_Edge;
         end if;
         Enable_External_Interrupt (Line, T);
      end if;
   end Configure_Trigger;

end STM32GD.GPIO.IRQ;
