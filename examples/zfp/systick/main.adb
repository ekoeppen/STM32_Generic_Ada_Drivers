with STM32GD.Board; use STM32GD.Board;
with Monotonic_Counter;

procedure Main is

begin
   Init;
   Text_IO.Put_Line ("Starting SYSTICK...");
   Monotonic_Counter.Reset;
   loop
      STM32GD.WFI;
   end loop;
end Main;

