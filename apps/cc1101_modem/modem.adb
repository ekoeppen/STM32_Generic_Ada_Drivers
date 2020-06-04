with Interfaces; use Interfaces;
with STM32GD.Board; use STM32GD.Board;
with STM32_SVD; use STM32_SVD;
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with Drivers.CC1101;
with Host_Message;

package body Modem is

   package IRQ renames P2_IN;
   package Radio is new Drivers.CC1101 (SPI => SPI, Chip_Select => CSN, IRQ => IRQ);

   Packet: Radio.Packet_Type (1 .. 32);
   Host_Packet : Host_Message.Packet_Type (1 .. 32);
   Packet_Length : Natural;
   Now : RTC.Date_Time_Type;
   Wait_Time : RTC.Second_Delta_Type := 30;
   Sync_Word : Unsigned_16 := 16#D391#;

   function Init return Boolean is
   begin
      STM32GD.Board.Init;
      Host_Message.Send_Hello;
      Radio.Init;
      if Radio.Get_Sync_Word = Sync_Word then
         IRQ.Configure_Trigger (Rising => True);
         STM32GD.Clear_Event;
         return True;
      else
         return False;
      end if;
   end Init;

   procedure Run is
   begin
      Radio.RX_Mode;
      RTC.Read (Now);
      RTC.Add_Seconds (Now, Wait_Time);
      RTC.Set_Alarm (Now);

      loop
         STM32GD.Wait_For_Event;
         if Radio.RX_Available then
            LED.Set;
            Radio.Clear_IRQ;
            Radio.RX (Packet, Packet_Length);
            for I in 1 .. Packet_Length loop
               Host_Packet (I) := Unsigned_8 (Packet (I));
            end loop;
            Host_Message.Send_Packet (Host_Packet, Packet_Length);
            LED.Clear;
         end if;

         if RTC.Alarm_Triggered then
            RTC.Clear_Alarm;
            Host_Message.Send_Heartbeat;
            RTC.Read (Now);
            RTC.Add_Seconds (Now, Wait_Time);
            RTC.Set_Alarm (Now);
         end if;
      end loop;
   end Run;

   procedure Error is
   begin
      loop
         RTC.Read (Now);
         RTC.Add_Seconds (Now, Wait_Time);
         RTC.Set_Alarm (Now);
         STM32GD.Wait_For_Event;

         if RTC.Alarm_Triggered then
            RTC.Clear_Alarm;
            Host_Message.Send_Error_Message ("Modem init failed");
         end if;
      end loop;
   end Error;

end Modem;
