with System;

package body TLV is

   type Base_Type is (Base_Integer, Base_Float, Base_String, Base_Sequence)
      with Size => 2;
   for Base_Type use (
      Base_Integer   => 0,
      Base_Float     => 1,
      Base_String    => 2,
      Base_Sequence  => 3);

   type Tag_Value_Type is new Integer range 0 .. 63 with Size => 6;

   type Tag_Specifier (As_Value : Boolean := False) is
      record
         case As_Value is
            when True =>
               Val   : Byte;
            when False =>
               Base  : UInt2;
               Value : UInt6;
         end case;
      end record
      with Unchecked_Union, Size => 8, Bit_Order => System.Low_Order_First;

   for Tag_Specifier use
      record
         Base  at 0 range 6 .. 7;
         Value at 0 range 0 .. 5;
      end record;

   procedure Encode (Tag : Tag_Type; Value : Integer;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      Buffer (Position) := Tag'Enum_Rep;
      Buffer (Position + 1) := 1;
      Buffer (Position + 2) := 0;
      Position := Position + 6;
   end Encode;

   procedure Encode (Tag : Tag_Type; Value : String;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      Buffer (Position) := Tag'Enum_Rep;
      Buffer (Position + 1) := 1;
      Position := Position + 2;
      for C of Value loop
         Buffer (Position) := Character'Pos (C);
         Position := Position + 1;
      end loop;
   end Encode;

   procedure Encode (Tag : Tag_Type; Value : Short_Float;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type) is
   begin
      Buffer (Position) := Tag'Enum_Rep;
      Buffer (Position + 1) := 1;
      Buffer (Position + 2) := 0;
      Position := Position + 6;
   end Encode;

   procedure Start_Sequence (
      Tag : Tag_Type;
      Buffer : in out Buffer_Type;
      Length_Position : out Buffer_Size_Type;
      Position : in out Buffer_Size_Type) is
   begin
      Buffer (Position) := Tag'Enum_Rep;
      Length_Position := Position + 1;
      Position := Position + 2;
   end Start_Sequence;

   procedure End_Sequence (
      Buffer : in out Buffer_Type;
      Length_Position : in Buffer_Size_Type;
      Position : in out Buffer_Size_Type) is
   begin
      Buffer (Length_Position) := Byte (Position - Length_Position - 1);
   end End_Sequence;

end TLV;
