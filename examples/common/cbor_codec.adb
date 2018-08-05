with System;
with Ada.Text_IO; use Ada.Text_IO;

package body CBOR_Codec is

   subtype Additional_Value_Type is Integer range 0 .. 31;
   Additional_8Bit   : constant Additional_Value_Type := 24;
   Additional_16Bit  : constant Additional_Value_Type := 25;
   Additional_32Bit  : constant Additional_Value_Type := 26;
   Additional_64Bit  : constant Additional_Value_Type := 27;

   type Encoding_Type (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val : Byte;
            when False =>
               Major : Major_Type;
               Value : Additional_Value_Type;
         end case;
      end record
      with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for Encoding_Type use
      record
         Major at 0 range 5 .. 7;
         Value at 0 range 0 .. 4;
      end record;

   procedure Encode_Additional_Data (Value : Integer; Major : Major_Type) is
      Encoding_Byte : Encoding_Type;
   begin
      Encoding_Byte.Major := Major;
      if Value <= Additional_8Bit - 1 then
         Encoding_Byte.Value := Value;
         Write (Encoding_Byte.Val);
      elsif Value <= Integer (Byte'Last) then
         Encoding_Byte.Value := Additional_8Bit;
         Write (Encoding_Byte.Val);
         Write (Byte (Value));
      elsif Value <= Integer (UInt16'Last) then
         Encoding_Byte.Value := Additional_16Bit;
         Write (Encoding_Byte.Val);
         Write (Byte (Value / 2**8));
         Write (Byte (Value mod 2**8));
      elsif Value <= Integer'Last then
         Encoding_Byte.Value := Additional_32Bit;
         Write (Encoding_Byte.Val);
         Write (Byte ((Value / 2**24) mod 2**8));
         Write (Byte ((Value / 2**16) mod 2**8));
         Write (Byte ((Value / 2**8)  mod 2**8));
         Write (Byte (Value mod 2**8));
      end if;
   end Encode_Additional_Data;

   procedure Encode_Integer (Value : Integer) is
      Major : Major_Type;
      Positive_Value : Integer;
   begin
      if Value >= 0 then
         Major := Unsigned_Integer;
         Positive_Value := Value;
      else
         Major := Negative_Integer;
         Positive_Value := -1 - Value;
      end if;
      Encode_Additional_Data (Positive_Value, Major);
   end Encode_Integer;

   procedure Encode_Byte_String (Value : String) is
   begin
      Encode_Additional_Data (Value'Length, Byte_String);
      for C of Value loop
         Write (Character'Pos (C));
      end loop;
   end Encode_Byte_String;

   procedure Encode_UTF8_String (Value : String) is
   begin
      null;
   end Encode_UTF8_String;

   procedure Encode_Array (Count : Natural) is
   begin
      Encode_Additional_Data (Count, Item_Array);
   end Encode_Array;

   procedure Encode_Map (Count : Natural) is
   begin
      Encode_Additional_Data (Count, Item_Map);
   end Encode_Map;

   procedure Encode_Tag (Value : Natural) is
   begin
      Encode_Additional_Data (Value, Tag);
   end Encode_Tag;

   procedure Encode_Null is
   begin
      null;
   end Encode_Null;

   procedure Encode_False is
   begin
      null;
   end Encode_False;

   procedure Encode_True is
   begin
      null;
   end Encode_True;

   procedure Encode_Undefined is
   begin
      null;
   end Encode_Undefined;

   procedure Encode_Simple_Value (Value : Integer) is
   begin
      null;
   end Encode_Simple_Value;

   procedure Encode_Float (Value : Short_Float) is
   begin
      null;
   end Encode_Float;

   procedure Encode_Float (Value : Float) is
   begin
      null;
   end Encode_Float;

   procedure Encode_Decimal_Fraction (Value : Integer; Mantissa : Integer) is
   begin
      Encode_Tag (Decimal_Fraction_Tag);
      Encode_Array (2);
      Encode_Integer (Mantissa);
      Encode_Integer (Value);
   end Encode_Decimal_Fraction;

   function Decode_Additional_Data (Value : out Integer;
      Encoding_Byte : Encoding_Type) return Boolean is
      Success : Boolean := False;
   begin
      case Encoding_Byte.Value is
         when  Additional_8Bit =>
            Value := Integer (Read);
            return True;
         when Additional_16Bit =>
            Value := Integer (Read) * 2**8 +
               Integer (Read);
            return True;
         when Additional_32Bit =>
            Value := Integer (Read) * 2**24 +
               Integer (Read) * 2**16 +
               Integer (Read) * 2**8 +
               Integer (Read);
            return True;
         when Additional_64Bit =>
            return False;
         when others =>
            Value := Encoding_Byte.Value;
            return True;
      end case;
   end Decode_Additional_Data;

   function Decode_Integer (Value : out Integer) return Boolean is
      Encoding_Byte : Encoding_Type;
   begin
      Encoding_Byte.Val := Read;
      if Decode_Additional_Data (Value, Encoding_Byte) then
         if Encoding_Byte.Major = Unsigned_Integer then
            return True;
         elsif Encoding_Byte.Major = Negative_Integer then
            Value := -1 - Value;
            return True;
         end if;
      end if;
      return False;
   end Decode_Integer;

   function Decode_Byte_String (Size : out Natural) return Boolean is
      Encoding_Byte : Encoding_Type;
   begin
      Encoding_Byte.Val := Read;
      if Encoding_Byte.Major = Byte_String and then
         Decode_Additional_Data (Size, Encoding_Byte) then
         return True;
      else
         return False;
      end if;
   end Decode_Byte_String;

   function Decode_UTF8_String return Boolean is
   begin
      return False;
   end Decode_UTF8_String;

   function Decode_Array (Count : out Natural) return Boolean is
      Encoding_Byte : Encoding_Type;
   begin
      Encoding_Byte.Val := Read;
      if Encoding_Byte.Major = Item_Array and then
         Decode_Additional_Data (Count, Encoding_Byte) then
         return True;
      else
         return False;
      end if;
   end Decode_Array;

   function Decode_Map return Boolean is
   begin
      return False;
   end Decode_Map;

   function Decode_Tag (Value : out Integer) return Boolean is
      Encoding_Byte : Encoding_Type;
   begin
      Encoding_Byte.Val := Read;
      if Encoding_Byte.Major = Tag and then
         Decode_Additional_Data (Value, Encoding_Byte) then
         return True;
      else
         return False;
      end if;
   end Decode_Tag;

   function Decode_Null return Boolean is
   begin
      return False;
   end Decode_Null;

   function Decode_Boolean return Boolean is
   begin
      return False;
   end Decode_Boolean;

   function Decode_Undefined return Boolean is
   begin
      return False;
   end Decode_Undefined;

   function Decode_Simple_Value return Boolean is
   begin
      return False;
   end Decode_Simple_Value ;

   function Decode_Float return Boolean is
   begin
      return False;
   end Decode_Float ;

   function Decode_Decimal_Fraction (Value : out Integer;
      Mantissa : out Integer) return Boolean is
      Tag : Integer;
      Count : Integer;
   begin
      if Decode_Tag (Tag) and then
         Tag = Decimal_Fraction_Tag and then
         Decode_Array (Count) and then
         Count = 2 and then
         Decode_Integer (Value) and then
         Decode_Integer (Mantissa) then
         return True;
      else
         return False;
      end if;
   end Decode_Decimal_Fraction;

end CBOR_Codec;
