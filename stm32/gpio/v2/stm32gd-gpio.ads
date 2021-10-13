with STM32_SVD.GPIO;

generic

   Pin : UInt4;
   Port : in out STM32_SVD.GPIO.GPIO_Peripheral;

   Input : Boolean := True;
   Output : Boolean := False;
   Alternate : Boolean := False;
   Analog_Input : Boolean := False;
   Alternate_Function : UInt4 := 0;
   Pull_Up : Boolean := False;
   Pull_Down : Boolean := False;
   Open_Drain_Output : Boolean := False;
   Push_Pull_Output : Boolean := True;
   Medium_Speed : Boolean := False;
   High_Speed : Boolean := False;

package STM32GD.GPIO is

   pragma Preelaborate;

   function Port_Index return UInt4;
   function Pin_Mask return UInt16 is (2 ** Natural(Pin));

   procedure Set_Output;
   procedure Set_Input;
   procedure Set_Alternate;
   procedure Set_Analog_Input;
   procedure Set_Pull_Up;
   procedure Set_Pull_Down;
   procedure Set_No_Pull;
   procedure Configure_Alternate_Function (AF : UInt4);

   procedure Init;
   procedure Configure_Trigger (Rising : Boolean := False; Falling : Boolean := False);
   procedure Wait_For_Trigger;
   procedure Clear_Trigger;
   function Triggered return Boolean;

   function Is_Set return Boolean;
   procedure Set;
   procedure Clear;
   procedure Toggle;

end STM32GD.GPIO;
