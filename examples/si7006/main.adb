with Drivers.Text_IO;
with STM32GD.Board;
with Drivers.Si7006;

procedure Main is

   package Temp_Sensor is new Drivers.Si7006 (I2C => STM32GD.Board.I2C);
   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);
   Line : String (1 .. 8);
   Len : Natural;
   Temperature : Integer;

begin
   STM32GD.Board.Init;
   STM32GD.Board.LED.Set;
   loop
      Temperature := Temp_Sensor.Temperature_x100;
      Text_IO.Put_Integer (Temperature);
      Text_IO.New_Line;
      Text_IO.Put_Line ("Press <enter> to measure");
      Text_IO.Get_Line (Line, Len);
      STM32GD.Board.LED.Toggle;
   end loop;
end Main;
