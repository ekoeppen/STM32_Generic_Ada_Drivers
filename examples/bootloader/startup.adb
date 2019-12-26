with System;
with System.Storage_Elements; use System.Storage_Elements;
with System.Machine_Code; use System.Machine_Code;

package body Startup is

   procedure Ada_Init with Import => True, Convention => C, External_Name => "adainit";
   procedure Ada_Main with Import => True, Convention => C, External_Name => "_ada_main";
   procedure Default_Handler with Export => True, External_Name => "Default_Handler";
   procedure HardFault_Handler with Export => True, External_Name => "HardFault_Handler";
   pragma Weak_External (HardFault_Handler);
   procedure SysTick_Handler with Export => True, External_Name => "SysTick_Handler";
   pragma Weak_External (SysTick_Handler);

   procedure HardFault_Handler is
   begin
      loop null; end loop;
   end HardFault_Handler;

   procedure Default_Handler is
   begin
      null;
   end Default_Handler;

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
      Asm ("movs r0, #1", Volatile => True);
      Asm ("movs r2, #8", Volatile => True);
      Asm ("lsl r0, r2", Volatile => True);
      Asm ("movs r1, #1", Volatile => True);
      Asm ("movs r2, #29", Volatile => True);
      Asm ("lsl r1, r2", Volatile => True);
      Asm ("add r0, r1", Volatile => True);
      Asm ("mov sp, r0", Volatile => True);
      Data_In_Sram := Data_In_Flash;
      Bss := (others => 0);

      Ada_Init;
      Ada_Main;
   end Reset_Handler;

   Vectors : constant array (0 .. 46) of System.Address := (
      Reset_Handler'Address,
      Default_Handler'Address,
      HardFault_Handler'Address,
      Default_Handler'Address,
      Default_Handler'Address,
      SysTick_Handler'Address,
      others => Default_Handler'Address)
      with Export => True;
   pragma Linker_Section (Vectors, ".vectors");

end Startup;
