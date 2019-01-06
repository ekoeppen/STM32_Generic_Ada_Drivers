with STM32_SVD; use STM32_SVD;
with Interfaces; use Interfaces;

generic

   type Buffer_Size_Type is range <>;
   type Buffer_Type is array (Buffer_Size_Type) of Byte;
   type Tag_Type is (<>);

package TLV is

   --  type Data_Types is (False, True, Byte, Short, Long, Float, Double,
   --     String, Timestamp, Duration, Sequence);

   procedure Encode (Tag : Tag_Type; Value : Integer;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);

   procedure Encode (Tag : Tag_Type; Value : Short_Float;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);

   procedure Encode (Tag : Tag_Type; Value : String;
      Buffer : in out Buffer_Type; Position : in out Buffer_Size_Type);

   procedure Start_Sequence (Tag : Tag_Type; Buffer : in out Buffer_Type;
      Length_Position : out Buffer_Size_Type;
      Position : in out Buffer_Size_Type);

   procedure End_Sequence (Buffer : in out Buffer_Type;
      Length_Position : in Buffer_Size_Type;
      Position : in out Buffer_Size_Type);

end TLV;
