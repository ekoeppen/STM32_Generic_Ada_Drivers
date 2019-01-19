package body Timeout is

	procedure Start (Timeout_Time : out Time ; Duration : Time_Span) is
	begin
		Timeout_Time := Clock + Duration;
	end Start;

	function Timed_Out (Timeout_Time : Time) return Boolean is
	begin
		return Clock > Timeout_Time;
	end Timed_Out;

end Timeout;
