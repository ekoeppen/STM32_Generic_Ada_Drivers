pragma Ada_95;
pragma Warnings (Off);
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2016 (20160515-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#1585eee9#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#0bedc8d1#;
   pragma Export (C, u00002, "systemS");
   u00003 : constant Version_32 := 16#cc94381b#;
   pragma Export (C, u00003, "last_chance_handlerB");
   u00004 : constant Version_32 := 16#d1bc38d5#;
   pragma Export (C, u00004, "last_chance_handlerS");
   u00005 : constant Version_32 := 16#f7ddc64a#;
   pragma Export (C, u00005, "stm32_svdS");
   u00006 : constant Version_32 := 16#f5ce792d#;
   pragma Export (C, u00006, "stm32_svd__spiS");
   u00007 : constant Version_32 := 16#71f79a66#;
   pragma Export (C, u00007, "halS");
   u00008 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00008, "interfacesS");
   u00009 : constant Version_32 := 16#944af4bb#;
   pragma Export (C, u00009, "stm32gdS");
   u00010 : constant Version_32 := 16#b29fd3cb#;
   pragma Export (C, u00010, "stm32gd__spiS");
   u00011 : constant Version_32 := 16#41e8b3a3#;
   pragma Export (C, u00011, "stm32gd__spi__peripheralB");
   u00012 : constant Version_32 := 16#bb8598f7#;
   pragma Export (C, u00012, "stm32gd__spi__peripheralS");
   --  BEGIN ELABORATION ORDER
   --  interfaces%s
   --  system%s
   --  hal%s
   --  stm32_svd%s
   --  stm32_svd.spi%s
   --  stm32gd%s
   --  last_chance_handler%s
   --  last_chance_handler%b
   --  stm32gd.spi%s
   --  stm32gd.spi.peripheral%s
   --  stm32gd.spi.peripheral%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
