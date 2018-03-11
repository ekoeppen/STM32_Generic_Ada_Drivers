with STM32_SVD.GPIO;
with STM32GD.EXTI;

generic

   Pin : in GPIO_Pin;
   Port : in out STM32_SVD.GPIO.GPIO_Peripheral;
   Mode : in Pin_IO_Modes := Input;
   In_Conf : in Pin_In_Conf := In_Analog;
   Out_Conf : in Pin_Out_Conf := Out_PushPull;

package STM32GD.GPIO.Pin is

   procedure Init;

   procedure Set_Mode (Mode : Pin_IO_Modes);

   procedure Set_In_Conf (Conf : Pin_In_Conf);

   procedure Set_Out_Conf (Conf : Pin_Out_Conf);

   function Is_Set return Boolean;

   procedure Set;

   procedure Clear;

   procedure Toggle;

   procedure Connect_External_Interrupt;

   function Interrupt_Line_Number return STM32GD.EXTI.External_Line_Number;

   procedure Configure_Trigger (Trigger : STM32GD.EXTI.External_Triggers);

end STM32GD.GPIO.Pin;

