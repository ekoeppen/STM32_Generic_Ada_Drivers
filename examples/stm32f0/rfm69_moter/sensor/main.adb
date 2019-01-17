with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Ada.Text_IO;                  use Ada.Text_IO;

with STM32_SVD;                    use STM32_SVD;
with STM32GD.Board;                use STM32GD.Board;
with STM32GD.SysTick;              use STM32GD.SysTick;

with Packet;                       use Packet;
with CBOR_Codec;
with RTC_IRQ;
with RTC;
with Peripherals;
with Utils;

procedure Main is
   Date_Time    : RTC.Date_Time_Type;
   Temperature  : Peripherals.Si7006.Temperature_Type;
   Humidity     : Peripherals.Si7006.Humidity_Type;

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
      RF_CBOR.Encode_Byte_String ("Sensor");
      RF_CBOR.Encode_Tag (Voltage_Tag);
      RF_CBOR.Encode_Decimal_Fraction (Peripherals.Supply_Voltage, -3);
      RF_CBOR.Encode_Tag (Temperature_Tag);
      RF_CBOR.Encode_Decimal_Fraction (Temperature, -2);
      RF_CBOR.Encode_Tag (Humidity_Tag);
      RF_CBOR.Encode_Decimal_Fraction (Humidity, 0);
      Put ("Packet: ");
      for I in Integer range RF_Message'First .. RF_Message_Index loop
         Put (Utils.To_Hex_String (RF_Message (I)));
      end loop;
      New_Line;
      Peripherals.Radio.TX (RF_Message);
   end Send_Sensor_Data;

begin
   Init;
   RTC.Init;
   Peripherals.Init;
   RTC.Read (Date_Time);
   Put_Line ("Sensor starting");
   loop
      LED_GREEN.Set;
      --  Put_Line ("Reading sensor data");
      Read_Sensor_Data;
      Send_Sensor_Data;
      RTC.Read (Date_Time);
      RTC.Add_Seconds (Date_Time, 4);
      RTC.Set_Alarm (Date_Time);
      LED_GREEN.Clear;
      --  Put_Line ("Entering sleep");
      Peripherals.Power_Down;
      --  Peripherals.Enable_Stop_Mode (True);
      Suspend_Until_True (RTC_IRQ.Alarm_Occurred);
      --  Peripherals.Enable_Stop_Mode (False);
      Peripherals.Power_Up;
      --  Put_Line ("Exited sleep");
   end loop;
end Main;
