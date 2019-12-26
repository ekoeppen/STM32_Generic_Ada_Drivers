with STM32GD.RTC;

package body STM32GD.Timeout is

   Microseconds_Timeout : Microseconds;
   Milliseconds_Timeout : Milliseconds;
   Seconds_Timeout : Seconds;

   procedure Set (T : Microseconds) is
   begin
      null;
   end Set;

   procedure Set (T : Milliseconds) is
   begin
      null;
   end Set;

   procedure Set (T : Seconds) is
      package RTC is new STM32GD.RTC (Clock => Clock_Tree.RTC_Source, Clock_Tree => Clock_Tree);
      Alarm : RTC.Date_Time_Type;
   begin
      RTC.Read (Alarm);
      RTC.Add_Seconds (Alarm, RTC.Second_Delta_Type (T));
      RTC.Set_Alarm (Alarm);
   end Set;

   procedure Await is
   begin
      while not Expired loop null; end loop;
   end Await;

   function Expired return Boolean is
   begin
      return False;
   end Expired;


end STM32GD.Timeout;
