with Ada.Real_Time; use Ada.Real_Time;

package Blink is

	protected type Blink_Parameters is
		procedure Set_Rate (R : Time_Span);
		procedure Set_Blinks (C : Natural);
	private
		Rate : Time_Span;
		Count : Natural;
	end Blink_Parameters;

end Blink;
