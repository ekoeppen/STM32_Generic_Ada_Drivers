with STM32GD.Board;

package body Blink is

	Next_Release : Time := Clock;
	Period       : constant Time_Span := Milliseconds (1000);

	task Blink_Task with Storage_Size => 512;

	protected body Blink_Parameters is
		procedure Set_Rate (R : Time_Span) is
		begin
			Rate := R;
		end Set_Rate;

		procedure Set_Blinks (C : Natural) is
		begin
			Count := C;
		end Set_Blinks;
	end Blink_Parameters;

	task body Blink_Task is
	begin
		loop
			STM32GD.Board.LED_RED.Toggle;
			Next_Release := Next_Release + Period;
			delay until Next_Release;
		end loop;
	end Blink_Task;

end Blink;
