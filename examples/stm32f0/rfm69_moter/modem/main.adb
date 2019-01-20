with System;                       use System;
with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Unchecked_Conversion;
with Last_Chance_Handler;

with STM32GD.Board;
with STM32GD.USART;

with Peripherals;
with Modem;
with Controller;

procedure Main is
   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (100);

   Minimum_Storage_Size : Integer := 256;
   pragma Export (
      Convention => C,
      Entity => Minimum_Storage_Size,
      External_Name => "_minimum_storage_size");

   Main_Task_Storage_Size : Integer := 1024;
   pragma Export (
      Convention => C,
      Entity => Main_Task_Storage_Size,
      External_Name => "_environment_task_storage_size");

   Secondary_Stack_Size : Integer := 16;
   pragma Export (
      Convention => C,
      Entity => Secondary_Stack_Size,
      External_Name => "_gnat_default_ss_size");

begin
   STM32GD.Board.Init;
   Peripherals.Init;
   Controller.Send_Log_Message ("Ready");
   while True loop
      Controller.Handle_Host_Data;
      Controller.Handle_RF_Data;
      Controller.Periodic_Tasks;
      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;
