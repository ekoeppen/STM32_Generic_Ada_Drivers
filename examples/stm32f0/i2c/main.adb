with Ada.Real_Time; use Ada.Real_Time;
with STM32GD.Board; use STM32GD.Board;
with STM32GD.SysTick; use STM32GD.SysTick;
with Drivers.Text_IO;
with Peripherals;

procedure Main is

   Temperature  : Peripherals.Si7006.Temperature_Type;
   Humidity     : Peripherals.Si7006.Humidity_Type;
   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (500);

   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);
   use Text_IO;

begin
   Init;
   Peripherals.Init;
   SysTick_Periph.RVR.RELOAD := 16#10000#;
   SysTick_Periph.CSR.ENABLE := 1;
   Put_Line ("Starting");
   Put ("Reload: "); Put (Integer'Image (Integer (SysTick_Periph.RVR.RELOAD))); New_Line;
   loop
      Temperature := Peripherals.Si7006.Temperature_x100;
      Humidity := Peripherals.Si7006.Humidity;
      Put ("Ticks: "); Put (Integer'Image (Integer (SysTick_Periph.CVR.CURRENT))); New_Line;
      Put ("Temperature: "); Put (Integer'Image (Integer (Temperature))); New_Line;
      Put ("Humidity: "); Put (Integer'Image (Humidity)); New_Line;
      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;

