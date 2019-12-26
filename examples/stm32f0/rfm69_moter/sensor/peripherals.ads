with STM32GD.Board;
with Drivers.Si7006;
with Drivers.Text_IO;

package Peripherals is

   subtype Millivolts is Natural range 0..4095;

   package Si7006 is new Drivers.Si7006 (I2C => STM32GD.Board.I2C);

   procedure Init;
   procedure Power_Down;
   procedure Power_Up;
   procedure Enable_Stop_Mode (Low_Power : Boolean);
   procedure Enter_Stop_Mode;
   procedure Disable_Stop_Mode;
   function Supply_Voltage return Millivolts;

end Peripherals;
