with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Real_Time; use Ada.Real_Time;
with STM32GD.Board;
with Drivers.Si7006;

procedure Main is

   package Board renames STM32GD.Board;
   package Text_IO renames Board.Text_IO;
   package Si7006 is new Drivers.Si7006 (I2C => Board.I2C);

   Temperature  : Si7006.Temperature_Type;
   Humidity     : Si7006.Humidity_Type;

   procedure Read_Sensor_Data is
   begin
      Temperature := Si7006.Temperature_x100;
      Humidity :=  Si7006.Humidity;
   end Read_Sensor_Data;

   Wait_Time : Time_Span := Seconds (3);

begin
   Board.Init;
   Text_IO.Put_Line ("Temperature/Humidity sensor starting");
   loop
      Board.LED_GREEN.Set;
      Text_IO.Put_Line ("Reading sensor data");
      Read_Sensor_Data;
      Text_IO.Put_Line ("Temperature: " & Integer'Image (Temperature));
      Text_IO.Put_Line ("Humidity:    " & Integer'Image (Humidity));
      Board.LED_GREEN.Clear;
      delay until Clock + Wait_Time;
   end loop;
end Main;
