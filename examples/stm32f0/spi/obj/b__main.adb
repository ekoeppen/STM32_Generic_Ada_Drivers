pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E04 : Short_Integer; pragma Import (Ada, E04, "last_chance_handler_E");
   E12 : Short_Integer; pragma Import (Ada, E12, "stm32gd__spi__peripheral_E");


   procedure adainit is
   begin
      null;

      E04 := E04 + 1;
      E12 := E12 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/ekoeppen/Documents/Unison/Ada/STM32_Generic_Drivers/examples/spi/obj/stm32gd.o
   --   /home/ekoeppen/Documents/Unison/Ada/STM32_Generic_Drivers/examples/spi/obj/last_chance_handler.o
   --   /home/ekoeppen/Documents/Unison/Ada/STM32_Generic_Drivers/examples/spi/obj/stm32gd-spi.o
   --   /home/ekoeppen/Documents/Unison/Ada/STM32_Generic_Drivers/examples/spi/obj/stm32gd-spi-peripheral.o
   --   /home/ekoeppen/Documents/Unison/Ada/STM32_Generic_Drivers/examples/spi/obj/main.o
   --   -L/home/ekoeppen/Documents/Unison/Ada/STM32_Generic_Drivers/examples/spi/obj/
   --   -L/home/ekoeppen/Documents/Unison/Ada/STM32_Generic_Drivers/examples/spi/obj/
   --   -L/home/ekoeppen/Documents/Unison/Ada/STM32_Generic_Drivers/examples/common/
   --   -L/home/ekoeppen/Documents/Unison/Ada/Ada_Drivers_Library/boards/lib/stm32f072stackable/ravenscar-sfp/Debug/
   --   -L/home/ekoeppen/Documents/Unison/Ada/Ada_Drivers_Library/boards/stm32f072_stackable/lib/stm32f072stackable/ravenscar-sfp/Production/
   --   -L/home/ekoeppen/Documents/Unison/Ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f072/sfp/adalib/
   --   -L/home/ekoeppen/Documents/Unison/Ada/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f072stackable/ravenscar-sfp/Production/
   --   -L/home/ekoeppen/Documents/Unison/Ada/Ada_Drivers_Library/hal/lib/stm32f072stackable/ravenscar-sfp/Production/
   --   -L/home/ekoeppen/Documents/Unison/Ada/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4/stm32f072stackable/ravenscar-sfp/Production/
   --   -L/home/ekoeppen/Documents/Unison/Ada/Ada_Drivers_Library/components/lib/stm32f072stackable/ravenscar-sfp/Production/
   --   -L/home/ekoeppen/Documents/Unison/Ada/Ada_Drivers_Library/middleware/lib/stm32f072stackable/ravenscar-sfp/Production/
   --   -L/home/ekoeppen/Documents/Unison/Ada/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f072/sfp/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
