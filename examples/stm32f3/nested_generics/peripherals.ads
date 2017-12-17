with STM32GD.GPIO.Pin;

generic

	with package Input is new STM32GD.GPIO.Pin (<>);
	with package Output is new STM32GD.GPIO.Pin (<>);

package Peripherals is

	procedure Init;
	procedure Run;

end Peripherals;
