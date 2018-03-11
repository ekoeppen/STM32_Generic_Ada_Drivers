with STM32GD.Board;
with Blink;
with Peripherals;
with Serial;

package Tasks is

   Blinker : Blink.Blink_Task_Type;
	Comm_Interface : Serial.Serial_Task_Type;

end Tasks;
