package Startup is

   procedure Reset_Handler with Export => True, External_Name => "Reset_Handler";
   procedure Default_Handler with Export => True, External_Name => "Default_Handler";

end Startup;
