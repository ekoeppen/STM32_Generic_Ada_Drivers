with STM32GD.GPIO.Pin;

generic

   with package Pin is new STM32GD.GPIO.Pin (<>);

package STM32GD.GPIO.Polled is

   procedure Configure_Trigger (Event : Boolean := False; Rising : Boolean := False; Falling : Boolean := False);
   procedure Wait_For_Trigger;
   procedure Clear_Trigger;
   function Triggered return Boolean;
   procedure Cancel_Wait;

end STM32GD.GPIO.Polled;
