package body Utils is

	Hex_Chars : constant array (Byte range 0 .. 15) of Character := ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');

	function To_Hex_String (B : Byte) return Hex_String_Byte is
		Low_Nibble : constant Byte := B mod 16;
		High_Nibble : constant Byte := B / 16;
	begin
		return Hex_Chars (High_Nibble) & Hex_Chars (Low_Nibble);
	end To_Hex_String;

	function To_Hex_String (S : UInt16) return Hex_String_Short is
	begin
		return To_Hex_String (Byte (S / 256)) & To_Hex_String (Byte (S mod 256));
	end To_Hex_String;

	function To_Hex_String (W : UInt32) return Hex_String_Word is
	begin
		return To_Hex_String (UInt16 (W / 65536)) & To_Hex_String (UInt16 (W mod 65536));
	end To_Hex_String;

end Utils;
