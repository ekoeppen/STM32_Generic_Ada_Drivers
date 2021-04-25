with STM32_SVD.GPIO;

generic

   Pin : GPIO_Pin;
   Port : GPIO_Port;
   Mode : Pin_IO_Modes := Mode_In;
   Pull_Resistor : in Internal_Pin_Resistors := Floating;
   Alternate_Function : in GPIO_Alternate_Function := 0;

package STM32GD.GPIO.Pin is

   pragma Preelaborate;

   procedure Enable;
   procedure Disable;

   procedure Init;
   procedure Set_Mode (Mode : Pin_IO_Modes);
   procedure Set_Type (Pin_Type : Pin_Output_Types);
   function Get_Pull_Resistor return Internal_Pin_Resistors;
   procedure Set_Pull_Resistor (Pull : Internal_Pin_Resistors);
   procedure Configure_Alternate_Function (AF : GPIO_Alternate_Function);
   procedure Configure_Trigger (Rising : Boolean := False; Falling : Boolean := False);
   procedure Wait_For_Trigger;
   procedure Clear_Trigger;
   function Triggered return Boolean;

   function Is_Set return Boolean;
   procedure Set;
   procedure Clear;
   procedure Toggle;

end STM32GD.GPIO.Pin;
