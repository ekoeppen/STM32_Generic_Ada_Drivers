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
with System;

package body Controller is

   subtype Host_Message_Size_Type is Positive range 1 .. 64;
   subtype Host_Message_Type is USART_Data (Host_Message_Size_Type);
   Host_Message       : Host_Message_Type;
   Host_Message_Index : Host_Message_Size_Type;
   RF_Message         : Packet_Type;
   RF_Message_Index   : Packet_Size_Type;

   Heartbeat_Period   : constant Time_Span := Seconds (60);
   Ticks_To_Heartbeat : Integer := Heartbeat_Period / Period;
   Ping_Period        : constant Time_Span := Seconds (2);
   Ticks_To_Ping      : Integer := Ping_Period / Period;
   Heartbeat          : Integer := 0;
   Ping_Count         : Natural := 0;

   procedure Write_To_Host_Message (Data : Byte);
   function Read_From_Host_Message return Byte;

   procedure Write_To_RF_Message (Data : Byte);
   function Read_From_RF_Message return Byte;

   -----------------------------------------------------------------------------

   package Host_CBOR is new CBOR_Codec (
      Write => Write_To_Host_Message,
      Read => Read_From_Host_Message);

   package RF_CBOR is new CBOR_Codec (
      Write => Write_To_RF_Message,
      Read => Read_From_RF_Message);

   procedure Send_Host_Message is
   begin
      Output.Write (Host_Message, Host_Message_Index - Host_Message'First);
   end Send_Host_Message;

   procedure Start_Host_Message is
   begin
      Host_Message_Index := Host_Message'First;
   end Start_Host_Message;

   procedure Write_To_Host_Message (Data : Byte) is
   begin
      Host_Message (Host_Message_Index) := Data;
      Host_Message_Index := Host_Message_Index + 1;
   end Write_To_Host_Message;

   function Read_From_Host_Message return Byte is
      B : Byte;
   begin
      B := Host_Message (Host_Message_Index);
      Host_Message_Index := Host_Message_Index + 1;
      return B;
   end Read_From_Host_Message;

   procedure Start_RF_Message is
   begin
      RF_Message_Index := RF_Message'First;
   end Start_RF_Message;

   procedure Write_To_RF_Message (Data : Byte) is
   begin
      RF_Message (RF_Message_Index) := Data;
      RF_Message_Index := RF_Message_Index + 1;
   end Write_To_RF_Message;

   function Read_From_RF_Message return Byte is
      B : Byte;
   begin
      B := RF_Message (RF_Message_Index);
      RF_Message_Index := RF_Message_Index + 1;
      return B;
   end Read_From_RF_Message;

   procedure Send_Log_Message (Message : String) is
   begin
      Start_Host_Message;
      Host_CBOR.Encode_Tag (Log_Message_Tag);
      Host_CBOR.Encode_Byte_String (Message);
      Send_Host_Message;
   end Send_Log_Message;

   procedure Handle_Command is
      Tag        : Integer;

      procedure Set_Ping_Count is
         Count : Integer;
      begin
         if Host_CBOR.Decode_Integer (Count) and then Count >= 0 then
            Send_Log_Message ("Setting ping count");
            Ping_Count := Count;
         end if;
      end Set_Ping_Count;

      procedure Reset is
         SCB_AIRCR : aliased STM32_SVD.UInt32
         with Import, Address => System'To_Address (16#E000ED0C#);
      begin
         Send_Log_Message ("Resetting");
         SCB_AIRCR := 16#05FA_0004#;
      end Reset;

      procedure Report_Modem_Status is
         Registers : Radio.Raw_Register_Array;
      begin
         Send_Log_Message ("Modem status");
         Radio.Read_Registers (Registers);
         for I in Registers'Range loop
            Start_Host_Message;
            Host_CBOR.Encode_Tag (Register_Value_Tag);
            Host_CBOR.Encode_Array (2);
            Host_CBOR.Encode_Integer (I);
            Host_CBOR.Encode_Integer (Integer (Registers (I)));
            Send_Host_Message;
         end loop;
      end Report_Modem_Status;

   begin
      Host_Message_Index := Host_Message'First;
      if Host_CBOR.Decode_Tag (Tag) then
         case Tag is
            when Reset_Cmd_Tag => Reset;
            when Ping_Cmd_Tag => Set_Ping_Count;
            when Status_Cmd_Tag => Report_Modem_Status;
            when others => null;
         end case;
      end if;
   end Handle_Command;

   procedure Handle_Host_Data is
      Command_Line : Serial_Data;
   begin
      if Input.Is_Ready then
         Input.Read (Command_Line);
         Host_Message := Command_Line.Data;
         Handle_Command;
      end if;
   end Handle_Host_Data;

   procedure Handle_RF_Data is
      Packet       : Packet_Type;
      Packet_Ready : Boolean;
   begin
      Modem.RX.Get_Data (Packet_Ready, Packet);
      if Packet_Ready then
         LED_RED.Set;
         Start_Host_Message;
         for I in Packet'Range loop
            Write_To_Host_Message (Packet (I));
         end loop;
         Send_Host_Message;
         LED_RED.Clear;
      end if;
   end Handle_RF_Data;

   procedure Send_Heartbeat is
   begin
      Ticks_to_Heartbeat := Ticks_To_Heartbeat - 1;
      if Ticks_To_Heartbeat = 0 then
         Ticks_To_Heartbeat := Heartbeat_Period / Period;
         Heartbeat := Heartbeat + 1;
         Start_Host_Message;
         Host_CBOR.Encode_Tag (Heartbeat_Tag);
         Host_CBOR.Encode_Array (2);
         Host_CBOR.Encode_Byte_String ("Modem");
         Host_CBOR.Encode_Integer (Heartbeat);
         Send_Host_Message;
      end if;
   end Send_Heartbeat;

   procedure Send_Ping is
   begin
      if Ping_Count > 0 then
         Ticks_to_Ping := Ticks_To_Ping - 1;
         if Ticks_To_Ping = 0 then
            Ping_Count := Ping_Count - 1;
            Ticks_To_Ping := Ping_Period / Period;
            Start_RF_Message;
            RF_CBOR.Encode_Tag (Ping_Tag);
            RF_CBOR.Encode_Byte_String ("Modem");
            Modem.TX.Send (RF_Message);
            Send_Log_Message ("Ping");
         end if;
      end if;
   end Send_Ping;

   procedure Periodic_Tasks is
   begin
      Send_Heartbeat;
      Send_Ping;
   end Periodic_Tasks;

end Controller;
