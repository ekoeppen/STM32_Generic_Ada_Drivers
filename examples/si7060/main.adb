with Interfaces; use Interfaces;
with STM32_SVD; use STM32_SVD;
with Drivers.Text_IO;
with STM32GD.Board;
with Drivers.Si7060;

procedure Main is

   package Temp_Sensor is new Drivers.Si7060 (Address => 16#32#, I2C => STM32GD.Board.I2C);
   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);
   Line : String (1 .. 8);
   Len : Natural;
   Temperature : Integer;

begin
   STM32GD.Board.Init;
   STM32GD.Board.LED.Set;
   if not Temp_Sensor.Init then
      Text_IO.Put_Line ("Sensor not found");
      loop STM32GD.Wait_For_Interrupt; end loop;
   end if;

   loop
      Text_IO.Put_Line ("Press <enter> to measure");
      Text_IO.Get_Line (Line, Len);
      STM32GD.Board.LED.Toggle;
      if Temp_Sensor.Temperature_x100 (Temperature) then
         Text_IO.Put_Integer (Temperature);
         Text_IO.New_Line;
      end if;
   end loop;
end Main;
