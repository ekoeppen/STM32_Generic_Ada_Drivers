with STM32_SVD; use STM32_SVD;

generic

   type Buffer_Size_Type is range <>;
   type Buffer_Type is array (Buffer_Size_Type) of Byte;

package CBOR is

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

   procedure Encode_Integer (Value : Integer;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_Byte_String (Value : String;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_UTF8_String (Value : String;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_Array (Count : Natural;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_Map (Count : Natural;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_Tag (Value : Natural;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_Null (
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_False (
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_True (
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_Undefined (
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_Simple_Value (Value : Integer;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_Float (Value : Short_Float;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_Float (Value : Float;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);
   procedure Encode_Decimal_Fraction (Value : Integer; Mantissa : Integer;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);

   function Decode_Integer (Value : out Integer;
      Buffer : in out Buffer_Type;
      Position : in out Buffer_Size_Type) return Boolean;
   function Decode_Byte_String (Start : out Buffer_Size_Type;
      Size : out Natural;
      Buffer : in out Buffer_Type;
      Position : in out Buffer_Size_Type) return Boolean;
   function Decode_UTF8_String return Boolean;
   function Decode_Array (Count : out Natural;
      Buffer : in out Buffer_Type;
      Position : in out Buffer_Size_Type)  return Boolean;
   function Decode_Map return Boolean;
   function Decode_Tag (Value : out Integer;
      Buffer : in out Buffer_Type;
      Position : in out Buffer_Size_Type) return Boolean;
   function Decode_Null return Boolean;
   function Decode_Boolean return Boolean;
   function Decode_Undefined return Boolean;
   function Decode_Simple_Value return Boolean;
   function Decode_Float return Boolean;
   function Decode_Decimal_Fraction (Value : out Integer;
      Mantissa : out Integer; Buffer : in out Buffer_Type;
      Position : in out Buffer_Size_Type) return Boolean;

end CBOR;
