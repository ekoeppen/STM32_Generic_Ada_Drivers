with STM32GD.Clock;
with STM32GD.Clock.Tree;

generic

   Clock : STM32GD.Clock.Clock_Type;
   with package Clock_Tree is new STM32GD.Clock.Tree (<>);

package STM32GD.RTC is
   subtype Year_Type         is Natural range 2000 .. 2099;
   subtype Month_Type        is Natural range 1 .. 12;
   subtype Day_Type          is Natural range 1 .. 31;
   subtype Hour_Type         is Natural range 0 .. 23;
   subtype Minute_Type       is Natural range 0 .. 59;
   subtype Second_Type       is Natural range 0 .. 59;
   subtype Second_Delta_Type is Natural range 0 .. (60 * 60 * 24);
   subtype Minute_Delta_Type is Natural range 0 .. (60 * 24);

   type Date_Time_Type is record
      Year   : Year_Type;
      Month  : Month_Type;
      Day    : Day_Type;
      Hour   : Hour_Type;
      Minute : Minute_Type;
      Second : Second_Type;
   end record;

   procedure Init;
   procedure Unlock;
   procedure Lock;
   procedure Read (Date_Time : out Date_Time_Type);
   generic
      with procedure Put (S : String);
   procedure Print (Date_Time : Date_Time_Type);

   procedure Add_Seconds (Date_Time : in out Date_Time_Type;
      Second_Delta : Second_Delta_Type);
   procedure Add_Minutes (Date_Time : in out Date_Time_Type;
      Minute_Delta : Minute_Delta_Type);
   procedure Set_Alarm (Date_Time : Date_Time_Type);
   procedure Wait_For_Alarm;
   function Alarm_Triggered return Boolean;
   procedure Clear_Alarm;
   function To_Seconds (Date_Time : Date_Time_Type) return Natural;

end STM32GD.RTC;
