package STM32GD.Startup is

   pragma Preelaborate;

   procedure Reset_Handler with Export => True, External_Name => "_start_rom";
      pragma Machine_Attribute (Reset_Handler, "naked");
      pragma Weak_External (Reset_Handler);

end STM32GD.Startup;
