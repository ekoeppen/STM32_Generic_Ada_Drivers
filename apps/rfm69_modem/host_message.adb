with Interfaces; use Interfaces;
with STM32GD;
with STM32_SVD; use STM32_SVD;
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
   Mote_Info_Tag      : constant Natural := 73;
   Revision_Tag       : constant Natural := 74;
   Status_Cmd_Tag     : constant Natural := 256;
   Ping_Cmd_Tag       : constant Natural := 257;
   Reset_Cmd_Tag      : constant Natural := 258;

   UID : STM32GD.UID_Type := STM32GD.UID;
   Message : array (1 .. 256) of Character;
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

   procedure Send_Packet (Packet: Packet_Type; Length: Unsigned_8) is
   begin
      if Length > 0 and then Length < Packet'Length then
         Start_Message;
         CBOR.Encode_Tag (RF_Packet_Tag);
         CBOR.Encode_Additional_Data (Integer (Length), CBOR.Byte_String);
         for I in 0 .. Length - 1 loop
            Write_Message (Packet (Packet'First + I));
         end loop;
         Send_Message;
      end if;
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

   procedure Send_Register (Register: Radio.Register_Type;
      Radio_Registers: Radio.Raw_Register_Array) is
      U : Utils.Hex_String_Word;
   begin
      U := Utils.To_Hex_String (UID (1) xor UID (2) xor UID (3));
      Start_Message;
      CBOR.Encode_Tag (Register_Value_Tag);
      CBOR.Encode_Array (3);
      CBOR.Encode_Byte_String (U);
      CBOR.Encode_Integer (Register'Enum_Rep);
      CBOR.Encode_Integer (Integer (Radio_Registers (Register'Enum_Rep)));
      Send_Message;
   end Send_Register;

   procedure Send_Status (Radio_Registers: Radio.Raw_Register_Array) is
   begin
      Send_Register (Radio.OPMODE, Radio_Registers);
      Send_Register (Radio.IRQFLAGS1, Radio_Registers);
      Send_Register (Radio.IRQFLAGS2, Radio_Registers);
   end Send_Status;

   procedure Send_Error_Message (M : String) is
   begin
      Start_Message;
      CBOR.Encode_Tag (Log_Message_Tag);
      CBOR.Encode_Byte_String (M);
      Send_Message;
   end Send_Error_Message;

end Host_Message;
