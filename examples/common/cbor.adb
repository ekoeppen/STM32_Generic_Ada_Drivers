with System;
with Ada.Text_IO; use Ada.Text_IO;

package body CBOR is

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


   procedure Encode_Additional_Data (Value : Integer; Major : Major_Type;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
      Encoding_Byte     : Encoding_Type;
      Encoding_Position : Buffer_Size_Type;
   begin
      Encoding_Position := Position;
      Encoding_Byte.Major := Major;
      if Value in Additional_Value_Type then
         Encoding_Byte.Value := Value;
         Position := Position + 1;
      elsif Value <= Integer (Byte'Last) then
         Encoding_Byte.Value := Additional_8Bit;
         Buffer (Position + 1) := Byte (Value);
         Position := Position + 2;
      elsif Value <= Integer (UInt16'Last) then
         Encoding_Byte.Value := Additional_16Bit;
         Buffer (Position + 1) := Byte (Value / 2**8);
         Buffer (Position + 2) := Byte (Value mod 2**8);
         Position := Position + 3;
      elsif Value <= Integer'Last then
         Encoding_Byte.Value := Additional_32Bit;
         Buffer (Position + 1) := Byte ((Value / 2**24) mod 2**8);
         Buffer (Position + 2) := Byte ((Value / 2**16) mod 2**8);
         Buffer (Position + 3) := Byte ((Value / 2**8) mod 2**8);
         Buffer (Position + 4) := Byte (Value mod 2**8);
         Position := Position + 5;
      end if;
      Buffer (Encoding_Position) := Encoding_Byte.Val;
   end Encode_Additional_Data;

   procedure Encode_Integer (Value : Integer;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
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
      Encode_Additional_Data (Positive_Value, Major, Buffer, Position);
   end Encode_Integer;

   procedure Encode_Byte_String (Value : String;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      Encode_Additional_Data (Value'Length, Byte_String, Buffer, Position);
      for C of Value loop
         Buffer (Position) := Character'Pos (C);
         Position := Position + 1;
      end loop;
   end Encode_Byte_String;

   procedure Encode_UTF8_String (Value : String;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      null;
   end Encode_UTF8_String;

   procedure Encode_Array (Count : Natural;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      Encode_Additional_Data (Count, Item_Array, Buffer, Position);
   end Encode_Array;

   procedure Encode_Map (Count : Natural;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      Encode_Additional_Data (Count, Item_Map, Buffer, Position);
   end Encode_Map;

   procedure Encode_Tag (Value : Natural;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      Encode_Additional_Data (Value, Tag, Buffer, Position);
   end Encode_Tag;

   procedure Encode_Null (
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      null;
   end Encode_Null;

   procedure Encode_False (
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      null;
   end Encode_False;

   procedure Encode_True (
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      null;
   end Encode_True;

   procedure Encode_Undefined (
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      null;
   end Encode_Undefined;

   procedure Encode_Simple_Value (Value : Integer;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      null;
   end Encode_Simple_Value;

   procedure Encode_Float (Value : Short_Float;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      null;
   end Encode_Float;

   procedure Encode_Float (Value : Float;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      null;
   end Encode_Float;

   procedure Encode_Decimal_Fraction (Value : Integer; Mantissa : Integer;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      Encode_Tag (Decimal_Fraction_Tag, Buffer, Position);
      Encode_Array (2, Buffer, Position);
      Encode_Integer (Mantissa, Buffer, Position);
      Encode_Integer (Value, Buffer, Position);
   end Encode_Decimal_Fraction;

   function Decode_Additional_Data (Value : out Integer;
      Encoding_Byte : Encoding_Type;
      Buffer : in Buffer_Type;
      Position : in out Buffer_Size_Type) return Boolean is
      Success : Boolean := False;
      Last_Position : Buffer_Size_Type := Position;
   begin
      case Encoding_Byte.Value is
         when  Additional_8Bit =>
            Value := Integer (Buffer (Position));
            Position := Position + 1;
            return True;
         when Additional_16Bit =>
            Value := Integer (Buffer (Position)) * 2**8 +
               Integer (Buffer (Position + 1));
            Position := Position + 2;
            return True;
         when Additional_32Bit =>
            Value := Integer (Buffer (Position)) * 2**24 +
               Integer (Buffer (Position + 1)) * 2**16 +
               Integer (Buffer (Position + 2)) * 2**8 +
               Integer (Buffer (Position + 3));
            Position := Position + 4;
            return True;
         when Additional_64Bit =>
            Position := Last_Position;
            return False;
         when others =>
            Value := Encoding_Byte.Value;
            return True;
      end case;
   end Decode_Additional_Data;

   function Decode_Integer (Value : out Integer;
      Buffer : in Buffer_Type;
      Position : in out Buffer_Size_Type) return Boolean is
      Encoding_Byte : Encoding_Type;
      Last_Position : Buffer_Size_Type := Position;
   begin
      Encoding_Byte.Val := Buffer (Position);
      Position := Position + 1;
      if Decode_Additional_Data (Value, Encoding_Byte, Buffer, Position) then
         if Encoding_Byte.Major = Unsigned_Integer then
            return True;
         elsif Encoding_Byte.Major = Negative_Integer then
            Value := -1 - Value;
            return True;
         end if;
      end if;
      Position := Last_Position;
      return False;
   end Decode_Integer;

   function Decode_Byte_String (Start : out Buffer_Size_Type;
      Size : out Natural;
      Buffer : in Buffer_Type;
      Position : in out Buffer_Size_Type) return Boolean is
      Encoding_Byte : Encoding_Type;
      Last_Position : Buffer_Size_Type := Position;
   begin
      Encoding_Byte.Val := Buffer (Position);
      Position := Position + 1;
      if Encoding_Byte.Major = Byte_String and then
         Decode_Additional_Data (Size, Encoding_Byte, Buffer, Position) then
         Start := Position;
         Position := Position + Buffer_Size_Type (Size);
         return True;
      else
         Position := Last_Position;
         return False;
      end if;
   end Decode_Byte_String;

   function Decode_UTF8_String return Boolean is
   begin
      return False;
   end Decode_UTF8_String;

   function Decode_Array (Count : out Natural;
      Buffer : in Buffer_Type;
      Position : in out Buffer_Size_Type) return Boolean is
      Encoding_Byte : Encoding_Type;
      Last_Position : Buffer_Size_Type := Position;
   begin
      Encoding_Byte.Val := Buffer (Position);
      Position := Position + 1;
      if Encoding_Byte.Major = Item_Array and then
         Decode_Additional_Data (Count, Encoding_Byte, Buffer, Position) then
         return True;
      else
         Position := Last_Position;
         return False;
      end if;
   end Decode_Array;

   function Decode_Map return Boolean is
   begin
      return False;
   end Decode_Map;

   function Decode_Tag (Value : out Integer;
      Buffer : in Buffer_Type;
      Position : in out Buffer_Size_Type) return Boolean is
      Encoding_Byte : Encoding_Type;
      Last_Position : Buffer_Size_Type := Position;
   begin
      Encoding_Byte.Val := Buffer (Position);
      Position := Position + 1;
      if Encoding_Byte.Major = Tag and then
         Decode_Additional_Data (Value, Encoding_Byte, Buffer, Position) then
         return True;
      else
         Position := Last_Position;
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
      Mantissa : out Integer; Buffer : in Buffer_Type;
      Position : in out Buffer_Size_Type) return Boolean is
      Tag : Integer;
      Count : Integer;
      Last_Position : Buffer_Size_Type := Position;
   begin
      if Decode_Tag (Tag, Buffer, Position) and then
         Tag = Decimal_Fraction_Tag and then
         Decode_Array (Count, Buffer, Position) and then
         Count = 2 and then
         Decode_Integer (Value, Buffer, Position) and then
         Decode_Integer (Mantissa, Buffer, Position) then
         return True;
      else
         Position := Last_Position;
         return False;
      end if;
   end Decode_Decimal_Fraction;

end CBOR;
