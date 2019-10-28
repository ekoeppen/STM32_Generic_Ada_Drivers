with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with System.Machine_Code;

with STM32_SVD;                    use STM32_SVD;
with STM32GD.Board;                use STM32GD.Board;

with Packet;                       use Packet;
with CBOR_Codec;
with RTC_IRQ;
with RTC;
with Peripherals;
with Utils;

procedure Main is

   package Text_IO renames Peripherals.Text_IO;

   Date_Time    : RTC.Date_Time_Type;
   Temperature  : Peripherals.Si7006.Temperature_Type;
   Humidity     : Peripherals.Si7006.Humidity_Type;
   Node_Name    : String (1 .. 7 + 8);

   procedure Generate_Node_Name is
      Device_ID_0 : UInt32
         with Import, Address => System'To_Address (16#1FFF_F7AC#);
      Device_ID_1 : UInt32
         with Import, Address => System'To_Address (16#1FFF_F7B0#);
      Device_ID_2 : UInt32
         with Import, Address => System'To_Address (16#1FFF_F7B4#);
      HW_ID : UInt32;
   begin
      HW_ID := Device_ID_0 xor Device_ID_1 xor Device_ID_2;
      Node_Name := "Sensor/" & Utils.To_Hex_String (UInt32 (HW_ID));
   end Generate_Node_Name;

   RF_Message         : Peripherals.Radio.Packet_Type;
   RF_Message_Index   : Peripherals.Radio.Packet_Size_Type;

   procedure Write_To_RF_Message (Data : Byte);
   function Read_From_RF_Message return Byte;

   package RF_CBOR is new CBOR_Codec (
      Write => Write_To_RF_Message,
      Read => Read_From_RF_Message);

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

   procedure Send_Ping is
   begin
      Start_RF_Message;
      RF_CBOR.Encode_Tag (Ping_Tag);
      RF_CBOR.Encode_Byte_String ("Sensor");
      Peripherals.Radio.TX (RF_Message);
   end Send_Ping;

   procedure Read_Sensor_Data is
   begin
      Temperature := Peripherals.Si7006.Temperature_x100;
      Humidity :=  Peripherals.Si7006.Humidity;
   end Read_Sensor_Data;

   procedure Send_Sensor_Data is
   begin
      Start_RF_Message;
      RF_CBOR.Encode_Tag (Sensor_Reading_Tag);
      RF_CBOR.Encode_Array (4);
      RF_CBOR.Encode_Byte_String (Node_Name);
      RF_CBOR.Encode_Tag (Voltage_Tag);
      RF_CBOR.Encode_Decimal_Fraction (Peripherals.Supply_Voltage, -3);
      RF_CBOR.Encode_Tag (Temperature_Tag);
      RF_CBOR.Encode_Decimal_Fraction (Temperature, -2);
      RF_CBOR.Encode_Tag (Humidity_Tag);
      RF_CBOR.Encode_Decimal_Fraction (Humidity, 0);
      Text_IO.Put ("Packet: ");
      for I in Integer range RF_Message'First .. RF_Message_Index loop
         Text_IO.Put (Utils.To_Hex_String (RF_Message (I)));
      end loop;
      Text_IO.New_Line;
      Peripherals.Radio.TX (RF_Message);
   end Send_Sensor_Data;

begin
   Init;
   RTC.Init;
   Peripherals.Init;
   RTC.Read (Date_Time);
   Generate_Node_Name;
   Text_IO.Put_Line ("Sensor " & Node_Name & " starting");
   loop
      LED_GREEN.Set;
      Text_IO.Put_Line ("Reading sensor data");
      Read_Sensor_Data;
      Send_Sensor_Data;
      Peripherals.Radio.Power_Down;
      RTC.Read (Date_Time);
      RTC.Add_Seconds (Date_Time, 60 * 15);
      RTC.Set_Alarm (Date_Time);
      LED_GREEN.Clear;
      Text_IO.Put_Line ("Entering sleep");
      Peripherals.Power_Down;
      Peripherals.Enable_Stop_Mode (True);
      Suspend_Until_True (RTC_IRQ.Alarm_Occurred);
      --  Peripherals.Enable_Stop_Mode (False);
      Peripherals.Power_Up;
      Text_IO.Put_Line ("Exited sleep");
   end loop;
end Main;
