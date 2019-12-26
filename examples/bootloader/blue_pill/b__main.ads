pragma Warnings (Off);
pragma Ada_95;
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: Community 2019 (20190517-74)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.machine_code%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.unsigned_types%s
   --  drivers%s
   --  startup%s
   --  startup%b
   --  stm32_svd%s
   --  stm32_svd.afio%s
   --  stm32_svd.exti%s
   --  stm32_svd.flash%s
   --  flash%s
   --  flash%b
   --  stm32_svd.gpio%s
   --  stm32_svd.i2c%s
   --  stm32_svd.nvic%s
   --  stm32_svd.rcc%s
   --  stm32_svd.spi%s
   --  stm32_svd.usart%s
   --  stm32_svd.usb%s
   --  stm32gd%s
   --  stm32gd%b
   --  stm32gd.exti%s
   --  stm32gd.exti%b
   --  stm32gd.gpio%s
   --  stm32gd.gpio.port%s
   --  stm32gd.gpio.port%b
   --  stm32gd.gpio.pin%s
   --  stm32gd.gpio.pin%b
   --  stm32gd.gpio.polled%s
   --  stm32gd.gpio.polled%b
   --  stm32gd.i2c%s
   --  stm32gd.i2c.peripheral%s
   --  stm32gd.i2c.peripheral%b
   --  stm32gd.spi%s
   --  stm32gd.spi.peripheral%s
   --  stm32gd.spi.peripheral%b
   --  stm32gd.usart%s
   --  stm32gd.usart.peripheral%s
   --  stm32gd.usart.peripheral%b
   --  hal%s
   --  drivers.text_io%s
   --  drivers.text_io%b
   --  stm32gd.board%s
   --  stm32gd.board%b
   --  bootloader%s
   --  bootloader%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
