package body STM32GD.GPIO.Pin is

   procedure Init is
   begin
      null;
   end Init;

   procedure Set_Mode (Mode : Pin_IO_Modes) is
   begin
      null;
   end Set_Mode;

   procedure Set_Type (Pin_Type : Pin_Output_Types) is
   begin
      null;
   end Set_Type;

   function Get_Pull_Resistor return Internal_Pin_Resistors is
   begin
      return Pull_Down;
   end Get_Pull_Resistor;

   procedure Set_Pull_Resistor (Pull : Internal_Pin_Resistors) is
   begin
      null;
   end Set_Pull_Resistor;

   function Is_Set return Boolean is
   begin
      return False;
   end Is_Set;

   procedure Set is
   begin
      null;
   end Set;

   procedure Clear is
   begin
      null;
   end Clear;

   procedure Toggle is
   begin
      null;
   end Toggle;

   procedure Configure_Alternate_Function (AF : GPIO_Alternate_Function) is
   begin
      null;
   end Configure_Alternate_Function;

   procedure Connect_External_Interrupt is
   begin
      null;
   end Connect_External_Interrupt;

end STM32GD.GPIO.Pin;
