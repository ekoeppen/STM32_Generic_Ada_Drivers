with STM32GD.Board; use STM32GD.Board;
with Drivers.Si7006;

procedure Main is

   package Si7006 is new Drivers.Si7006 (I2C => I2C);

   Temperature : Si7006.Temperature_Type;
   Humidity    : Si7006.Humidity_Type;
   Now         : RTC.Date_Time_Type;
   Wait_Time   : RTC.Second_Delta_Type := 5;

begin
   Init;
   Text_IO.Put_Line ("Temperature/Humidity sensor starting");
   loop
      RTC.Read (Now);
      LED.Set;
      Text_IO.Put_Line ("Reading sensor data");
      Temperature := Si7006.Temperature_x100;
      Humidity :=  Si7006.Humidity;
      Text_IO.Put ("Temperature: "); Text_IO.Put_Integer (Temperature);
      Text_IO.Put (" Humidity: "); Text_IO.Put_Integer (Humidity);
      Text_IO.New_Line;
      LED.Clear;
      RTC.Add_Seconds (Now, Wait_Time);
      RTC.Set_Alarm (Now);
      RTC.Wait_For_Alarm;
   end loop;
end Main;
