with Serial;

package body Modem is

	task Modem_Task with Storage_Size => 256 is
		pragma Priority(1);
	end Modem_Task;
	task Command_Task with Storage_Size => 256 is
		pragma Priority(1);
	end Command_Task;

	-----------------------------------------------------------------------------

	task body Modem_Task is
	begin
		loop
			null;
			--  Radio.Wait_For_Packet (Radio_Packet);
			--  Handle_Packet (Radio_Packet);
		end loop;
	end Modem_Task;

	task body Command_Task is
	begin
		loop
			null;
			--  Serial.Read_Line (Command_Line);
			--  Handle_Command (Command_Line);
		end loop;
	end Command_Task;

end Modem;
