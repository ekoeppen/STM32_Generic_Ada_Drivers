with STM32GD.Board; use STM32GD.Board;
with STM32GD.Power; use STM32GD.Power;

procedure Main is

   Now         : RTC.Date_Time_Type;
   Wait_Time   : RTC.Second_Delta_Type := 5;
   Voltage     : Millivolts;

begin
   Init;
   Text_IO.Put_Line ("Power suppy test starting");
   loop
      RTC.Read (Now);
      LED.Set;
      Voltage := Supply_Voltage;
      Text_IO.Put ("Supply voltage: "); Text_IO.Put_Integer (Voltage);
      Text_IO.New_Line;
      LED.Clear;
      RTC.Add_Seconds (Now, Wait_Time);
      RTC.Set_Alarm (Now);
      RTC.Wait_For_Alarm;
   end loop;
end Main;

