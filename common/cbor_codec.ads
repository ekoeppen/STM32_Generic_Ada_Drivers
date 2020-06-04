with Interfaces; use Interfaces;

generic

   with procedure Write (Data : Unsigned_8);
   with function Read return Unsigned_8;

package CBOR_Codec is

   type Major_Type is (Unsigned_Integer, Negative_Integer, Byte_String,
      UTF8_String, Item_Array, Item_Map, Tag, Simple_Or_Float)
      with Size => 3;

   for Major_Type use (
      Unsigned_Integer  => 0,
      Negative_Integer  => 1,
      Byte_String       => 2,
      UTF8_String       => 3,
      Item_Array        => 4,
      Item_Map          => 5,
      Tag               => 6,
      Simple_Or_Float   => 7);

   Date_Time_String_Tag    : constant Natural := 0;
   Epoch_Time_Tag          : constant Natural := 1;
   Positive_Bignum_Tag     : constant Natural := 2;
   Negative_Bignum_Tag     : constant Natural := 3;
   Decimal_Fraction_Tag    : constant Natural := 4;
   Bigfloat_Tag            : constant Natural := 5;
   Base64_URL_Expected_Tag : constant Natural := 21;
   Base64_Expected_Tag     : constant Natural := 22;
   Base16_Expected_Tag     : constant Natural := 23;
   CBOR_Data_Tag           : constant Natural := 24;
   URI_String_Tag          : constant Natural := 32;
   Base64_URL_String_Tag   : constant Natural := 33;
   Base64_String_Tag       : constant Natural := 34;
   Regexp_Tag              : constant Natural := 35;
   MIME_Message_Tag        : constant Natural := 36;

   procedure Encode_Additional_Data (Value : Integer; Major : Major_Type);
   procedure Encode_Integer (Value : Integer);
   procedure Encode_Byte_String (Value : String);
   procedure Encode_UTF8_String (Value : String);
   procedure Encode_Array (Count : Natural);
   procedure Encode_Map (Count : Natural);
   procedure Encode_Tag (Value : Natural);
   procedure Encode_Null;
   procedure Encode_False;
   procedure Encode_True;
   procedure Encode_Undefined;
   procedure Encode_Simple_Value (Value : Integer);
   procedure Encode_Float (Value : Short_Float);
   procedure Encode_Float (Value : Float);
   procedure Encode_Decimal_Fraction (Value : Integer; Mantissa : Integer);

   function Decode_Integer (Value : out Integer) return Boolean;
   function Decode_Byte_String (Size : out Natural) return Boolean;
   function Decode_UTF8_String return Boolean;
   function Decode_Array (Count : out Natural) return Boolean;
   function Decode_Map return Boolean;
   function Decode_Tag (Value : out Integer) return Boolean;
   function Decode_Null return Boolean;
   function Decode_Boolean return Boolean;
   function Decode_Undefined return Boolean;
   function Decode_Simple_Value return Boolean;
   function Decode_Float return Boolean;
   function Decode_Decimal_Fraction (Value : out Integer;
      Mantissa : out Integer) return Boolean;

end CBOR_Codec;
