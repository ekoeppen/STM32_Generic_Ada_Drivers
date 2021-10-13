package body STM32GD.GPIO_Polled is

   T : Boolean;

   procedure Wait_For_Trigger is
   begin
      while Pin.Is_Set loop
         null;
      end loop;
      T := True;
   end Wait_For_Trigger;

   procedure Clear_Trigger is
   begin
      T := False;
   end Clear_Trigger;

   function Triggered return Boolean is
   begin
      return T;
   end Triggered;

   procedure Cancel_Wait is
   begin
      null;
   end Cancel_Wait;

   procedure Configure_Trigger (Event : Boolean := False; Rising : Boolean := False; Falling : Boolean := False) is
   begin
      null;
   end Configure_Trigger;

end STM32GD.GPIO_Polled;
