with System;

package STM32GD.Vectors is

   pragma Preelaborate;

   procedure Default_Handler;

   type IRQ_Vectors is
      record
         HardFault_Handler : System.Address;
         MemManage_Handler : System.Address;
         BusFault_Handler : System.Address;
         UsageFault_Handler : System.Address;
         Reserved_1C : System.Address;
         Reserved_20 : System.Address;
         Reserved_24 : System.Address;
         Reserved_28 : System.Address;
         SVCall_Handler : System.Address;
         DebugMonitor_Handler : System.Address;
         Reserved_34 : System.Address;
         PendSV_Handler : System.Address;
         SysTick_Handler : System.Address;
         WWDG_Handler : System.Address;
         PVD_Handler : System.Address;
         FLASH_Handler : System.Address;
         RTC_Handler : System.Address;
      end record;

end STM32GD.Vectors;
