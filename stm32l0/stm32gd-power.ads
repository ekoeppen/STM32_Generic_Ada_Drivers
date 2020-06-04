package STM32GD.Power is

   subtype Millivolts is Natural range 0..4095;

   procedure Enable_Sleep;
   procedure Enable_Stop;
   procedure Enable_Standby;

   function Supply_Voltage return Millivolts;

end STM32GD.Power;
