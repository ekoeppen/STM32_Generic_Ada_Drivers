with STM32_SVD.GPIO;

generic

   Pin : in GPIO_Pin;
   Port : in out STM32_SVD.GPIO.GPIO_Peripheral;
   Mode : in Pin_IO_Modes := Mode_In;
   Pull_Resistor : in Internal_Pin_Resistors := Floating;
   Alternate_Function : in GPIO_Alternate_Function := 0;

package STM32GD.GPIO.Pin is

   procedure Init;
   procedure Set_Mode (Mode : Pin_IO_Modes);
   procedure Set_Type (Pin_Type : Pin_Output_Types);
   function Get_Pull_Resistor return Internal_Pin_Resistors;
   procedure Set_Pull_Resistor (Pull : Internal_Pin_Resistors);
   procedure Configure_Alternate_Function (AF : GPIO_Alternate_Function);

   function Is_Set return Boolean;
   procedure Set;
   procedure Clear;
   procedure Toggle;

end STM32GD.GPIO.Pin;
