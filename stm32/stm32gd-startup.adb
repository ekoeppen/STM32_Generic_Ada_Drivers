with System;
with System.Storage_Elements; use System.Storage_Elements;

package body STM32GD.Startup is

   procedure Ada_Main with Import => True,
      Convention => C,
      External_Name => "main";

   procedure Default_Handler is
   begin
      null;
   end Default_Handler;

   procedure Fault_Handler is
   begin
      loop null; end loop;
   end Fault_Handler;

   procedure SVCall_Handler is
   begin
      null;
   end SVCall_Handler;

   procedure PendSV_Handler is
   begin
      null;
   end PendSV_Handler;

   procedure SysTick_Handler is
   begin
      null;
   end SysTick_Handler;

   procedure Reset_Handler is
      Sdata : Storage_Element
        with Import, Convention => Asm, External_Name => "__data_start";
      Edata : Storage_Element
        with Import, Convention => Asm, External_Name => "__data_end";
      Sbss : Storage_Element
        with Import, Convention => Asm, External_Name => "__bss_start";
      Ebss : Storage_Element
        with Import, Convention => Asm, External_Name => "__bss_end";

      Data_Size : constant Storage_Offset := Edata'Address - Sdata'Address;

      --  Index from 1 so as to avoid subtracting 1 from the size
      Data_In_Flash : Storage_Array (1 .. Data_Size)
        with Import, Convention => Asm, External_Name => "__data_load";

      Data_In_Sram : Storage_Array (1 .. Data_Size)
        with Import, Convention => Asm, External_Name => "__data_start";

      Bss_Size : constant Storage_Offset := Ebss'Address - Sbss'Address;

      Bss : Storage_Array (1 .. Bss_Size)
        with Import, Convention => Ada, External_Name => "__bss_start";
   begin
      Data_In_Sram := Data_In_Flash;
      Bss := (others => 0);

      Ada_Main;
   end Reset_Handler;

   Standard_Vectors : constant array (1 .. 16) of System.Address := (
      Stack_End'Address,
      Reset_Handler'Address,
      Fault_Handler'Address,
      Fault_Handler'Address,
      Fault_Handler'Address,
      Fault_Handler'Address,
      Fault_Handler'Address,
      Fault_Handler'Address,
      Fault_Handler'Address,
      Fault_Handler'Address,
      Fault_Handler'Address,
      SVCall_Handler'Address,
      Fault_Handler'Address,
      Fault_Handler'Address,
      PendSV_Handler'Address,
      SysTick_Handler'Address) with Export => True, External_Name => "standard_vectors";
        pragma Linker_Section (Standard_Vectors, ".standard_vectors");

end STM32GD.Startup;
