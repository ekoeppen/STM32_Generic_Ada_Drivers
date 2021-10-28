package STM32GD.Power is

   subtype Millivolts is Natural range 0..4095;
   function Supply_Voltage return Millivolts;

   procedure Enable_Stop;
   procedure Stop;

end STM32GD.Power;
