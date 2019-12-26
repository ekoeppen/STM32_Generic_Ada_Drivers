with Interfaces; use Interfaces;
with STM32GD.Board;

procedure Main is
begin

   STM32GD.Board.Init;
	STM32GD.Board.Text_IO.Put_Line ("Hello, World!");
	STM32GD.Board.Text_IO.Put_Integer (Integer'Last); STM32GD.Board.Text_IO.New_Line;
	STM32GD.Board.Text_IO.Put_Integer (Integer'First + 1); STM32GD.Board.Text_IO.New_Line;
	STM32GD.Board.Text_IO.Put_Hex (Unsigned_32'Last); STM32GD.Board.Text_IO.New_Line;
	STM32GD.Board.Text_IO.Put_Hex (16#1234_5678#, 4); STM32GD.Board.Text_IO.New_Line;
	STM32GD.Board.Text_IO.Put_Hex (16#1234#, 8); STM32GD.Board.Text_IO.New_Line;
	STM32GD.Board.Text_IO.Hex_Dump ("Short string");
	STM32GD.Board.Text_IO.Hex_Dump ("Hex dump of a longer string 1234");

end Main;
