package STM32GD.Startup is

   pragma Preelaborate;

   procedure Default_Handler;
   procedure Reset_Handler with Export => True, External_Name => "_start_rom";
      pragma Machine_Attribute (Reset_Handler, "naked");

end STM32GD.Startup;
