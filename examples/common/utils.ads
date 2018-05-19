with STM32_SVD; use STM32_SVD;

package Utils is

	subtype Hex_String_Byte is String (1 .. 2);
	subtype Hex_String_Short is String (1 .. 4);
	subtype Hex_String_Word is String (1 .. 8);

	function To_Hex_String (B : Byte) return Hex_String_Byte;
	function To_Hex_String (S : UInt16) return Hex_String_Short;
	function To_Hex_String (W : UInt32) return Hex_String_Word;

end Utils;
