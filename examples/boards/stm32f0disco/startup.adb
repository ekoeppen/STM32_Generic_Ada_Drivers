with System;

package body Startup is

   Vectors : constant array (0 .. 9) of System.Address := (
      Reset_Handler'Address,
      others => Default_Handler'Address)
      with Export => True;
   pragma Linker_Section (Vectors, ".isr_vector");

   procedure Ada_Main with Import => True, Convention => C, External_Name => "_ada_main";

   procedure Default_Handler is
   begin
      loop null; end loop;
   end Default_Handler;

   procedure Reset_Handler is
   begin
      Ada_Main;
   end Reset_Handler;

end Startup;
