with System;
with System.Storage_Elements; use System.Storage_Elements;
with System.Machine_Code; use System.Machine_Code;
with System.BB.MCU_Parameters; use System.BB.MCU_Parameters;

package body STM32GD.Startup is

   procedure Stack_End with Import => True,
      Convention => Asm,
      External_Name => "__stack_end";

   procedure Ada_Main with Import => True,
      Convention => C,
      External_Name => "main";

   procedure SVCall_Handler with Export => True,
      External_Name => "__gnat_sv_call_trap";
      pragma Weak_External (SVCall_Handler);

   procedure PendSV_Handler with Export => True,
      External_Name => "__gnat_pend_sv_trap";
      pragma Weak_External (PendSV_Handler);

   procedure SysTick_Handler with Export => True,
      External_Name => "__gnat_sys_tick_trap";
      pragma Weak_External (SysTick_Handler);

   procedure Default_Handler with Export => True,
      External_Name => "__gnat_irq_trap";
      pragma Weak_External (Default_Handler);

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
      Asm ("movs r0, #0; ldr r0, [r0]", Volatile => True);
      Asm ("movs r1, #0; sub r1, #1", Volatile => True);
      Asm ("cmp r0, r1; bne 1f", Volatile => True);
      Asm ("movs r0, #1; movs r2, #8; lsl r0, r2", Volatile => True);
      Asm ("movs r1, #1; movs r2, #29; lsl r1, r2", Volatile => True);
      Asm ("add r0, r1", Volatile => True);
      Asm ("1: mov sp, r0", Volatile => True);
      Data_In_Sram := Data_In_Flash;
      Bss := (others => 0);

      Ada_Main;
   end Reset_Handler;

   Vectors : array (1 .. Number_Of_Interrupts) of System.Address := (
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
      SysTick_Handler'Address,
      others => Default_Handler'Address) with Export;
      pragma Linker_Section (Vectors, ".vectors");

end STM32GD.Startup;
