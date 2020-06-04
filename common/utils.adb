package body Utils is

	Hex_Chars : constant array (Unsigned_8 range 0 .. 15) of Character := ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');

	function To_Hex_String (B : Unsigned_8) return Hex_String_Byte is
		Low_Nibble : constant Unsigned_8 := B mod 16;
		High_Nibble : constant Unsigned_8 := B / 16;
	begin
		return Hex_Chars (High_Nibble) & Hex_Chars (Low_Nibble);
	end To_Hex_String;

	function To_Hex_String (S : Unsigned_16) return Hex_String_Short is
	begin
		return To_Hex_String (Unsigned_8 (S / 256)) & To_Hex_String (Unsigned_8 (S mod 256));
	end To_Hex_String;

	function To_Hex_String (W : Unsigned_32) return Hex_String_Word is
	begin
		return To_Hex_String (Unsigned_16 (W / 65536)) & To_Hex_String (Unsigned_16 (W mod 65536));
	end To_Hex_String;

end Utils;
