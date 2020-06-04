with Interfaces; use Interfaces;
with STM32GD;
with STM32GD.Board; use STM32GD.Board;
with CBOR_Codec;
with Utils;

package body Host_Message is

   Sensor_Reading_Tag : constant Natural := 6;
   Voltage_Tag        : constant Natural := 7;
   Temperature_Tag    : constant Natural := 8;
   Humidity_Tag       : constant Natural := 9;
   Pressure_Tag       : constant Natural := 10;
   Lux_Tag            : constant Natural := 11;
   UV_Index_Tag       : constant Natural := 12;
   Motion_Tag         : constant Natural := 13;
   Sound_Level_Tag    : constant Natural := 14;
   CO2_Tag            : constant Natural := 15;

   Test_Packet_Tag    : constant Natural := 64;
   Heartbeat_Tag      : constant Natural := 65;
   Log_Message_Tag    : constant Natural := 66;
   Ping_Tag           : constant Natural := 67;
   Register_Value_Tag : constant Natural := 68;
   Error_Message_Tag  : constant Natural := 69;
   Modem_Message_Tag  : constant Natural := 70;
   Modem_ID_Tag       : constant Natural := 71;
   RF_Packet_Tag      : constant Natural := 72;
   Status_Cmd_Tag     : constant Natural := 256;
   Ping_Cmd_Tag       : constant Natural := 257;
   Reset_Cmd_Tag      : constant Natural := 258;

   UID : STM32GD.UID_Type := STM32GD.UID;
   Message : array (1 .. 128) of Character;
   Message_Index : Natural;

   type Heartbeat_Range is range 0 .. 999;
   Heartbeat : Heartbeat_Range := Heartbeat_Range'First;

   procedure Write_Message (C : Unsigned_8);
   function Read_Message return Unsigned_8;

   package CBOR is new CBOR_Codec (Write => Write_Message, Read => Read_Message);

   procedure Start_Message is
   begin
      Message_Index := Message'First;
      CBOR.Encode_Tag (Modem_Message_Tag);
      CBOR.Encode_Array (2);
      CBOR.Encode_Tag (Modem_ID_Tag);
      CBOR.Encode_Integer (Integer (UID (1) xor UID (2) xor UID (3)));
   end Start_Message;

   procedure Write_Message (C : Unsigned_8) is
      H : Utils.Hex_String_Byte;
   begin
      H := Utils.To_Hex_String (C);
      Message (Message_Index) := H (1);
      Message (Message_Index + 1) := H (2);
      Message_Index := Message_Index + 2;
   end Write_Message;

   function Read_Message return Unsigned_8 is
   begin
      return 0;
   end Read_Message;

   procedure Send_Message is
   begin
      for I in 1 .. Message_Index - 1 loop
         Text_IO.Put (Message (I));
      end loop;
      Text_IO.New_Line;
   end Send_Message;

   procedure Send_Hello is
   begin
      Start_Message;
      CBOR.Encode_Tag (Log_Message_Tag);
      CBOR.Encode_Byte_String ("Starting");
      Send_Message;
   end Send_Hello;

   procedure Send_Packet (Packet: Packet_Type; Length: Positive) is
   begin
      Start_Message;
      CBOR.Encode_Tag (RF_Packet_Tag);
      CBOR.Encode_Additional_Data (Length, CBOR.Byte_String);
      for I in 1 .. Length loop
         Write_Message (Packet (I));
      end loop;
      Send_Message;
   end Send_Packet;

   procedure Send_Heartbeat is
      U : Utils.Hex_String_Word;
   begin
      U := Utils.To_Hex_String (UID (1) xor UID (2) xor UID (3));
      Start_Message;
      CBOR.Encode_Tag (Heartbeat_Tag);
      CBOR.Encode_Array (2);
      CBOR.Encode_Byte_String (U);
      CBOR.Encode_Integer (Integer (Heartbeat));
      Send_Message;
      Heartbeat := Heartbeat + 1;
      if Heartbeat = Heartbeat_Range'Last then
         Heartbeat := Heartbeat_Range'First;
      end if;
   end Send_Heartbeat;

   procedure Send_Error_Message (M : String) is
   begin
      Start_Message;
      CBOR.Encode_Tag (Log_Message_Tag);
      CBOR.Encode_Byte_String (M);
      Send_Message;
   end Send_Error_Message;

end Host_Message;
