with Interfaces; use Interfaces;
with STM32GD.Board; use STM32GD.Board;
with STM32_SVD; use STM32_SVD;
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with Drivers.RFM69;
with Host_Message;

package body Modem is

   package Radio renames STM32GD.Board.Radio;

   Packet: Radio.Packet_Type;
   Host_Packet : Host_Message.Packet_Type (1 .. Unsigned_8 (Packet'Last));
   Now : RTC.Date_Time_Type;
   Wait_Time : RTC.Second_Delta_Type := 30;
   Sync_Word : constant Radio.Sync_Word_Type (1 .. 3) := (16#F0#, 16#12#, 16#78#);
   RX_Address : constant Radio.Address_Type := 0;
   procedure Print_Registers is new Radio.Print_Registers (Put_Line => Text_IO.Put_Line);

   function Init return Boolean is
      use Radio;
      S : Sync_Word_Type (1 .. 3);
   begin
      STM32GD.Board.Init;
      Host_Message.Send_Hello;
      Radio.Init;
      Radio.Get_Sync_Word (S);
      if S = Sync_Word then
         IRQ.Configure_Trigger (Rising => True);
         STM32GD.Clear_Event;
         return True;
      else
         return False;
      end if;
   end Init;

   procedure Run is
      Length : Byte;
   begin
      Radio.Set_RX_Address (RX_Address);
      Radio.RX_Mode;
      RTC.Read (Now);
      RTC.Add_Seconds (Now, Wait_Time);
      RTC.Set_Alarm (Now);

      loop
         STM32GD.Wait_For_Event;
         if Radio.RX_Available then
            LED.Set;
            Radio.Clear_IRQ;
            Radio.RX (Packet, Length);
            for I in 1 .. Length loop
               Host_Packet (Unsigned_8 (I)) := Unsigned_8 (Packet (I));
            end loop;
            Host_Message.Send_Packet (Host_Packet, Unsigned_8 (Length));
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
