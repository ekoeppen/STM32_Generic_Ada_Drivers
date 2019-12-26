pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E18 : Short_Integer; pragma Import (Ada, E18, "drivers__text_io_E");
   E16 : Short_Integer; pragma Import (Ada, E16, "stm32gd__board_E");
   E04 : Short_Integer; pragma Import (Ada, E04, "bootloader_E");


   procedure adainit is
   begin
      null;

      E18 := E18 + 1;
      E16 := E16 + 1;
      E04 := E04 + 1;
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
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/drivers.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/startup.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd-afio.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd-exti.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd-flash.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/flash.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd-gpio.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd-i2c.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd-nvic.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd-rcc.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd-spi.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd-usart.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32_svd-usb.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-exti.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-gpio.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-gpio-port.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-gpio-pin.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-gpio-polled.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-i2c.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-i2c-peripheral.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-spi.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-spi-peripheral.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-usart.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-usart-peripheral.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/hal.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/drivers-text_io.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/stm32gd-board.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/bootloader.o
   --   /Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/main.o
   --   -L/Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/
   --   -L/Users/ekoeppen/Unison/Ada/STM32_Generic_Drivers/examples/bootloader/blue_pill/
   --   -L/Volumes/Crypt/Unison/Ada/STM32_Generic_Drivers/examples/common/
   --   -L/opt/gnat/2019-arm-elf/arm-eabi/lib/gnat/zfp-cortex-m3/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
