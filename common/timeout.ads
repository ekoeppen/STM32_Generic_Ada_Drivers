with Ada.Real_Time; use Ada.Real_Time;

package Timeout is

	procedure Start (Timeout_Time : out Time ; Duration : Time_Span);
	function Timed_Out (Timeout_Time : Time) return Boolean;

end Timeout;
