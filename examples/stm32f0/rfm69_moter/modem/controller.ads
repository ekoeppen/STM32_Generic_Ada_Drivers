with Ada.Real_Time; use Ada.Real_Time;

package Controller is

   Period : constant Time_Span := Milliseconds (200);

   procedure Periodic_Tasks;
   procedure Handle_Host_Data;
   procedure Handle_RF_Data;
   procedure Send_Log_Message (Message : String);

end Controller;
