with Interfaces; use Interfaces;
with STM32GD.Board; use STM32GD.Board;
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with Drivers.CC1101;

procedure Main is

   package GPIO renames STM32GD.GPIO;

   Now : RTC.Date_Time_Type;
   Wait_Time : RTC.Second_Delta_Type := 5;
   package Radio is new Drivers.CC1101 (SPI => SPI, Chip_Select => CSN, IRQ => P2_IN);
   procedure Print_Registers is new Radio.Print_Registers (Put_Line => Text_IO.Put_Line);

   Packet : Radio.Packet_Type (1 .. 62);
   Length : Natural;

   procedure Print_All_Registers is
      Register_Values: Radio.Raw_Register_Array;
   begin
      Radio.Read_Registers (Register_Values);
      for I in Register_Values'Range loop
         Text_IO.Put_Hex (Unsigned_32 (I), 2);
         Text_IO.Put (' ');
      end loop;
      Text_IO.New_Line;
      for R of Register_Values loop
         Text_IO.Put_Hex (Unsigned_32 (R), 2);
         Text_IO.Put (' ');
      end loop;
      Text_IO.New_Line;
   end Print_All_Registers;

   procedure RX_Test is
   begin
      Radio.RX_Mode;
      loop
         RTC.Read (Now);
         LED.Set;
         RTC.Add_Seconds (Now, Wait_Time);
         RTC.Set_Alarm (Now);
         LED.Clear;
         RTC.Wait_For_Alarm;
         Text_IO.Put_Line ("Checking for data...");
         Print_All_Registers;
         if Radio.RX_Available then
            Radio.RX (Packet, Length);
            for I in 1 .. Length loop
               Text_IO.Put_Hex (Unsigned_32 (Packet (I)), 2);
            end loop;
            Text_IO.New_Line;
         end if;
      end loop;
   end RX_Test;

   procedure TX_Test is
      TX_Data : constant Radio.Packet_Type := (9, 16#00#, 16#FF#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#FF#, 16#55#);
   begin
      Radio.RX_Mode;
      loop
         RTC.Read (Now);
         LED.Set;
         RTC.Add_Seconds (Now, Wait_Time);
         RTC.Set_Alarm (Now);
         LED.Clear;
         RTC.Wait_For_Alarm;
         Text_IO.Put_Line ("Sending data...");
         Radio.TX (TX_Data);
         Print_All_Registers;
      end loop;
   end TX_Test;

begin
   Init;
   P1_IN.Init;
   P2_IN.Init;
   SCLK.Init;
   MOSI.Init;
   MISO.Init;
   CSN.Init;
   CSN.Set;
   SPI.Init;
   Text_IO.Put_Line ("CC1101 Test Starting");
   Print_Registers;
   Radio.Init;
   RX_Test;
end Main;
