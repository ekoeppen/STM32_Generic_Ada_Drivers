with STM32GD.Clock;
with STM32GD.Clock.Tree;

generic

   Clock : STM32GD.Clock.RTC_Source_Type;
   with package Clock_Tree is new STM32GD.Clock.Tree (<>);

package STM32GD.RTC is
   subtype Second_Delta_Type is Natural range 0 .. (60 * 60 * 24);
   subtype Minute_Delta_Type is Natural range 0 .. (60 * 24);

   type Date_Time_Type is new Natural;

   procedure Init;
   procedure Read (Date_Time : out Date_Time_Type);
   generic
      with procedure Put (S : String);
   procedure Print (Date_Time : Date_Time_Type);

   procedure Add_Seconds (Date_Time : in out Date_Time_Type;
      Second_Delta : Second_Delta_Type);
   procedure Add_Minutes (Date_Time : in out Date_Time_Type;
      Minute_Delta : Minute_Delta_Type);
   function To_Seconds (Date_Time : Date_Time_Type) return Natural;

   procedure Set_Alarm (Date_Time : Date_Time_Type);
   procedure Clear_Alarm;
   procedure Wait_For_Alarm;
   function Alarm_Triggered return Boolean;

end STM32GD.RTC;
