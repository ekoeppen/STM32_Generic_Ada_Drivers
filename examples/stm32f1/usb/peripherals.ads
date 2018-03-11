with STM32GD.USB.Peripheral;
with STM32GD.Drivers.CDC;

package Peripherals is

   package USB is new STM32GD.USB.Peripheral (
		EP0_Reset_Callback => STM32GD.Drivers.CDC.EP0_Reset,
		EP0_Handler_Callback => STM32GD.Drivers.CDC.EP0_Handler);

end Peripherals;
