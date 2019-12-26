with STM32_SVD; use STM32_SVD;
with System;
with STM32GD.Board; use STM32GD.Board;

procedure Main is

   Now : RTC.Date_Time_Type;
   Wait_Time : RTC.Second_Delta_Type := 5;

begin
   Init;
   Text_IO.Put_Line ("RTC Test Starting");
   loop
      RTC.Read (Now);
      LED_RED.Set;
      Text_IO.Put ("Seconds: ");
      Text_IO.Put_Integer (RTC.To_Seconds (Now));
      Text_IO.New_Line;
      RTC.Add_Seconds (Now, Wait_Time);
      RTC.Set_Alarm (Now);
      Text_IO.Put ("Waking up in: ");
      Text_IO.Put_Integer (RTC.To_Seconds (Now));
      Text_IO.New_Line;
      LED_RED.Clear;
      RTC.Wait_For_Alarm;
   end loop;
end Main;
