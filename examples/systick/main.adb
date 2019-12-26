with System.Machine_Code; use System.Machine_Code;
with STM32GD.Board;
with STM32GD.Systick; use STM32GD.Systick;
with Drivers.Text_IO;
with Startup;

procedure Main is

   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);

begin
   STM32GD.Board.Init;
   Text_IO.Put_Line ("Starting SYSTICK...");
   Systick_Periph.CSR := (
      ENABLE => 1,
      TICKINT => 1,
      CLKSOURCE => 1,
      COUNTFLAG => 0,
      Reserved_3_15 => 0,
      Reserved_17_31 => 0);
   loop
      STM32GD.WFI;
   end loop;
end Main;

