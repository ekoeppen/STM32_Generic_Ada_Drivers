with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;

with STM32_SVD;                     use STM32_SVD;
with STM32GD.Board; use STM32GD.Board;

with Packet;                        use Packet;
with CBOR_Codec;
with RTC_IRQ;
with RTC;
with Peripherals;

procedure Main is
   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (1000);
   Date_Time    : RTC.Date_Time_Type;

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

   procedure Send_Sensor_Data is
   begin
      Start_RF_Message;
      RF_CBOR.Encode_Tag (Sensor_Reading_Tag);
      RF_CBOR.Encode_Array (4);
      RF_CBOR.Encode_Byte_String ("Sensor");
      RF_CBOR.Encode_Tag (Voltage_Tag);
      RF_CBOR.Encode_Decimal_Fraction (155, -2);
      RF_CBOR.Encode_Tag (Temperature_Tag);
      RF_CBOR.Encode_Decimal_Fraction (235, -1);
      RF_CBOR.Encode_Tag (Humidity_Tag);
      RF_CBOR.Encode_Decimal_Fraction (50, 0);
      Peripherals.Radio.TX (RF_Message);
   end Send_Sensor_Data;

begin
   Init;
   RTC.Init;
   Peripherals.Init;
   RTC.Read (Date_Time);
   Peripherals.Enable_Stop_Mode (True);
   Put_Line ("Sensor starting");
   loop
      Put_Line ("Sending data");
      LED_GREEN.Toggle;
      Send_Sensor_Data;
      Put_Line ("Data sent");
      RTC.Read (Date_Time);
      RTC.Add_Seconds (Date_Time, 10);
      RTC.Set_Alarm (Date_Time);
      Peripherals.Power_Down;
      Suspend_Until_True (RTC_IRQ.Alarm_Occurred);
      Peripherals.Power_Up;
   end loop;
end Main;
