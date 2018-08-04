with STM32_SVD;                     use STM32_SVD;
with Serial;                        use Serial;
with STM32GD.Board;                 use STM32GD.Board;
with STM32GD.USART;                 use STM32GD.USART;
with Ada.Real_Time;                 use Ada.Real_Time;
with Ada.Synchronous_Task_Control;  use Ada.Synchronous_Task_Control;
with Peripherals;                   use Peripherals; use Peripherals.Radio;
with Utils;                         use Utils;
with Modem;                         use Modem;
with Packet;                        use Packet;
with CBOR_Codec;
with Blink;

package body Controller is

   task Controller_Task with Storage_Size => 512;

   subtype Host_Message_Size_Type is Positive range 1 .. 64;
   subtype Host_Message_Type is USART_Data (Host_Message_Size_Type);
   Host_Message : Host_Message_Type;
   Host_Message_Index : Host_Message_Size_Type;

   procedure Write_To_Host_Message (Data : Byte);
   function Read_From_Host_Message return Byte;

   -----------------------------------------------------------------------------

   package CBOR is new CBOR_Codec (
      Write => Write_To_Host_Message,
      Read => Read_From_Host_Message);

   procedure Send_Host_Message is
   begin
      Output.Write (Host_Message, Host_Message_Index - Host_Message'First);
   end Send_Host_Message;

   procedure Start_Host_Message is
   begin
      Host_Message_Index := Host_Message'First;
      Write_to_Host_Message (16#10#);
      Write_to_Host_Message (16#02#);
   end Start_Host_Message;

   procedure End_Host_Message is
   begin
      Write_to_Host_Message (16#03#);
   end End_Host_Message;

   procedure Write_To_Host_Message (Data : Byte) is
   begin
      if Data = 16#10# then
         Host_Message (Host_Message_Index) := Data;
         Host_Message_Index := Host_Message_Index + 1;
      end if;
      Host_Message (Host_Message_Index) := Data;
      Host_Message_Index := Host_Message_Index + 1;
   end Write_To_Host_Message;

   function Read_From_Host_Message return Byte is
      B : Byte;
   begin
      B := Host_Message (Host_Message_Index);
      Host_Message_Index := Host_Message_Index + 1;
      if B = 16#10# then
         B := Host_Message (Host_Message_Index);
         Host_Message_Index := Host_Message_Index + 1;
      end if;
      return B;
   end Read_From_Host_Message;

   procedure Send_Log_Message (Message : String) is
   begin
      Start_Host_Message;
      CBOR.Encode_Tag (Log_Message_Tag);
      CBOR.Encode_Byte_String (Message);
      End_Host_Message;
      Send_Host_Message;
   end Send_Log_Message;

   task body Controller_Task is
      Next_Tick    : Time := Clock;
      Tick_Period  : constant Time_Span := Milliseconds (100);

      procedure Handle_Command (Line : Serial_Data) is
         Tag        : Integer;
      begin
         Host_Message_Index := Host_Message'First;
         if CBOR.Decode_Tag (Tag) then
            case Tag is
               when Reset_Cmd_Tag => null;
               when Ping_Cmd_Tag => null;
               when Status_Cmd_Tag => null;
               when others => null;
            end case;
         end if;
      end Handle_Command;

      procedure Handle_Host_Data is
         Command_Line : Serial_Data;
      begin
         if Input.Is_Ready then
            Input.Read_Line (Command_Line);
            Handle_Command (Command_Line);
         end if;
      end Handle_Host_Data;

      procedure Handle_RF_Data is
         Packet       : Packet_Type;
         Packet_Ready : Boolean;
      begin
         Modem.RX.Get_Data (Packet_Ready, Packet);
         if Packet_Ready then
            Start_Host_Message;
            for I in Packet'Range loop
               Write_To_Host_Message (Packet (I));
            end loop;
            End_Host_Message;
            Send_Host_Message;
         end if;
      end Handle_RF_Data;

      procedure Send_Heartbeat is
         Heartbeat_Period   : constant Time_Span := Seconds (5);
         Ticks_To_Heartbeat : Integer := Heartbeat_Period / Tick_Period;
      begin
         Ticks_to_Heartbeat := Ticks_To_Heartbeat - 1;
         if Ticks_To_Heartbeat = 0 then
            Ticks_To_Heartbeat := Heartbeat_Period / Tick_Period;
            Send_Log_Message ("Ping");
         end if;
      end Send_Heartbeat;

      procedure Send_Ping is
         Ping_Period   : constant Time_Span := Seconds (2);
         Ticks_To_Ping : Integer := Ping_Period / Tick_Period;
      begin
         Ticks_to_Ping := Ticks_To_Ping - 1;
         if Ticks_To_Ping = 0 then
            Ticks_To_Ping := Ping_Period / Tick_Period;
            Send_Log_Message ("Ping");
         end if;
      end Send_Ping;

      procedure Periodic_Tasks is
      begin
         Send_Heartbeat;
         Send_Ping;
      end Periodic_Tasks;

   begin
      Blink.Blink_Parameters.Increase_Blink_Count (Blink.Green);
      Send_Log_Message ("Ready");
      loop
         Handle_Host_Data;
         Handle_RF_Data;
         Periodic_Tasks;
         Next_Tick := Next_Tick + Tick_Period;
         delay until Next_Tick;
      end loop;
   end Controller_Task;

end Controller;
