generic

   Frequency : Unsigned_32;
   Clock: Clock_Type;
   Input: Input_Type;
   Input_Frequency : Unsigned_32 := 0;

package STM32GD.Clock.Source is

   pragma Preelaborate;

   procedure Init;
   procedure Delay_us (us : Natural);
   procedure Delay_ms (ms : Natural);
   procedure Delay_s (s : Natural);
   function Millisecond_Counter return Unsigned_32;
   procedure Delay_Slow_Periods (P : Unsigned_16);
   function Maximum_Delay_ms return Unsigned_16;

end STM32GD.Clock.Source;
