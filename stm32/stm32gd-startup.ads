package STM32GD.Startup is

   pragma Preelaborate;

   procedure Stack_End with Import => True,
      Convention => Asm,
      External_Name => "__stack_end";

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

   procedure Fault_Handler with Export => True,
      External_Name => "__fault_handler";
      pragma Weak_External (Default_Handler);

   procedure Reset_Handler with Export => True, External_Name => "_start_rom";
      pragma Machine_Attribute (Reset_Handler, "naked");

end STM32GD.Startup;
