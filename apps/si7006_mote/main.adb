with Interfaces; use Interfaces;
with STM32_SVD; use STM32_SVD;
with STM32GD.Board; use STM32GD.Board;
with STM32GD.Power;
with Drivers.Si7006;
with CBOR_Codec;
with Utils;
with Config;

procedure Main is

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

   Packet : Radio.Packet_Type (1 .. 30);
   Packet_Index : Byte;
   Node_Name : Utils.Hex_String_Word;

   procedure Write_Packet (C : Unsigned_8);
   function Read_Packet return Unsigned_8;

   package CBOR is new CBOR_Codec (Write => Write_Packet, Read => Read_Packet);
   package Temp_Sensor is new Drivers.Si7006 (I2C => STM32GD.Board.I2C);
   procedure Print_Registers is new Radio.Print_Registers (Put_Line => Text_IO.Put_Line);

   procedure Write_Packet (C : Unsigned_8) is
   begin
      Packet (Packet_Index) := Byte (C);
      Packet_Index := Packet_Index + 1;
   end Write_Packet;

   function Read_Packet return Unsigned_8 is
   begin
      return 0;
   end Read_Packet;

   function Read_Sensor_Data return Boolean is
      Temperature : Temp_Sensor.Temperature_Type;
      Humidity    : Temp_Sensor.Humidity_Type;
      Voltage     : STM32GD.Power.Millivolts;
   begin
      Temperature := Temp_Sensor.Temperature_x100;
      Humidity :=  Temp_Sensor.Humidity;
      Voltage := STM32GD.Power.Supply_Voltage;

      Text_IO.Put ("Voltage="); Text_IO.Put_Integer (Voltage);
      Text_IO.Put (" Temperature="); Text_IO.Put_Integer (Temperature);
      Text_IO.Put (" Humidity="); Text_IO.Put_Integer (Humidity);
      Text_IO.New_Line;
      Packet_Index := 1;
      CBOR.Encode_Tag (Sensor_Reading_Tag);
      CBOR.Encode_Array (4);
      CBOR.Encode_Byte_String (Node_Name);
      CBOR.Encode_Tag (Temperature_Tag);
      CBOR.Encode_Decimal_Fraction (Temperature, -2);
      CBOR.Encode_Tag (Voltage_Tag);
      CBOR.Encode_Decimal_Fraction (Voltage, -3);
      CBOR.Encode_Tag (Humidity_Tag);
      CBOR.Encode_Integer (Humidity);
      return True;
   end Read_Sensor_Data;

   procedure Send_Mote_Info is
      Revision : String (1 .. 6);
   begin
      Packet_Index := 1;
      CBOR.Encode_Tag (Mote_Info_Tag);
      CBOR.Encode_Array (1);
      CBOR.Encode_Tag (Revision_Tag);
      Config.Get_Git_Short_Hash (Revision);
      CBOR.Encode_Byte_String (Revision);
      Radio.TX_Mode;
      Radio.TX (Packet, Packet_Index);
      Radio.Power_Down;
      Text_IO.Put ("Config: TX_Power=");
      Text_IO.Put_Integer (Config.TX_Power);
      Text_IO.Put (" Transmit_Interval=");
      Text_IO.Put_Integer (Config.Transmit_Interval);
      Text_IO.Put (" Revision="); Text_IO.Put (Revision);
      Text_IO.New_Line;
   end Send_Mote_Info;

   procedure Run (Interval_Seconds : Natural) is
      Now : RTC.Date_Time_Type;
   begin
      loop
         Text_IO.Put_Line ("Measuring");
         if Read_Sensor_Data then
            Text_IO.Put_Line ("Sending");
            Radio.TX_Mode;
            Radio.TX (Packet, Packet_Index);
            Radio.Power_Down;
            Text_IO.Put_Line ("Sent");
         end if;
         RTC.Read (Now);
         RTC.Add_Seconds (Now, Interval_Seconds mod 60);
         if Interval_Seconds >= 60 then
            RTC.Add_Minutes (Now, Interval_Seconds / 60);
         end if;
         RTC.Set_Alarm (Now);
         Disable_Peripherals;
         RTC.Wait_For_Alarm;
         Enable_Peripherals;
      end loop;
   end Run;

begin
   Init;
   Radio.Init;
   Radio.Set_Output_Power (Config.TX_Power);
   Print_Registers;
   Radio.Power_Down;
   LED.Set;

   Config.Get_Node_Name (Node_Name);
   Text_IO.Put ("Starting: Node=");
   Text_IO.Put_Line (Node_Name);
   STM32GD.Power.Enable_Stop;
   Send_Mote_Info;
   Run (Config.Transmit_Interval);
end Main;
