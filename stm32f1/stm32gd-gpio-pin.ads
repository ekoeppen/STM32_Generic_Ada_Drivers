with STM32_SVD.GPIO;
with STM32GD.EXTI;

generic

   Pin : GPIO_Pin;
   Port : GPIO_Port;
   Mode : Pin_IO_Modes := Input;
   In_Conf : Pin_In_Conf := In_Analog;
   Out_Conf : Pin_Out_Conf := Out_PushPull;

package STM32GD.GPIO.Pin is

   pragma Preelaborate;

   procedure Enable;
   procedure Disable;
   procedure Init;

   procedure Set_Mode (Mode : Pin_IO_Modes);
   procedure Set_In_Conf (Conf : Pin_In_Conf);
   procedure Set_Out_Conf (Conf : Pin_Out_Conf);
   function Is_Set return Boolean;
   procedure Set;
   procedure Clear;
   procedure Toggle;

end STM32GD.GPIO.Pin;
