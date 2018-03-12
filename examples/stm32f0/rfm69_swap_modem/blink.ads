with Ada.Real_Time; use Ada.Real_Time;

package Blink is

   protected Blink_Parameters is
      procedure Set_Rate (R : Time_Span);
      procedure Set_Blinks (C : Natural);

      function Get_Rate return Time_Span;
      function Get_Blinks return Natural;
   private
      Rate : Time_Span := Milliseconds (1000);
      Count : Natural;
   end Blink_Parameters;

end Blink;
