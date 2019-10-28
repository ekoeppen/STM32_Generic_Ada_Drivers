package Startup is

   pragma Preelaborate;

   procedure Reset_Handler with Export => True, External_Name => "_start_rom";

end Startup;
