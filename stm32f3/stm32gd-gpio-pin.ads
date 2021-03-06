with STM32_SVD.GPIO;
with STM32GD.EXTI;

generic

   Pin : in GPIO_Pin;
   Port : in out STM32_SVD.GPIO.GPIO_Peripheral;
   Mode : in Pin_IO_Modes := Mode_In;
   Pull_Resistor : in Internal_Pin_Resistors := Floating;
   Alternate_Function : in GPIO_Alternate_Function := 0;

package STM32GD.GPIO.Pin is

   procedure Init;

   procedure Set_Mode (Mode : Pin_IO_Modes);
   function Get_Pull_Resistor return Internal_Pin_Resistors;
   procedure Set_Pull_Resistor (Pull : Internal_Pin_Resistors);
   function Is_Set return Boolean;
   procedure Set;
   procedure Clear;
   procedure Toggle;

end STM32GD.GPIO.Pin;
