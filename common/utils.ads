with Interfaces; use Interfaces;

package Utils is

	pragma Preelaborate;

	subtype Hex_String_Byte is String (1 .. 2);
	subtype Hex_String_Short is String (1 .. 4);
	subtype Hex_String_Word is String (1 .. 8);

	function To_Hex_String (B : Unsigned_8) return Hex_String_Byte;
	function To_Hex_String (S : Unsigned_16) return Hex_String_Short;
	function To_Hex_String (W : Unsigned_32) return Hex_String_Word;

end Utils;
