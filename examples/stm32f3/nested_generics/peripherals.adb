with STM32GD.EXTI;

package body Peripherals is

	procedure Init is
	begin
		Input.Init;
  	 	Input.Configure_Trigger (STM32GD.EXTI.Interrupt_Falling_Edge);
		Output.Init;
		Output.Clear;
	end Init;

	procedure Run is
	begin
		Output.Toggle;
	end Run;

end Peripherals;
