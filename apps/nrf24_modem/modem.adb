with Interfaces; use Interfaces;
with STM32GD.Board; use STM32GD.Board;
with STM32_SVD; use STM32_SVD;
with Host_Message;

package body Modem is

   RX_Address : constant Radio.Address_Type := (16#00#, 16#F0#, 16#F0#, 16#F0#, 16#F0#);
   Channel : constant Radio.Channel_Type := 70;
   Packet: Radio.Packet_Type (1 .. 32);
   Host_Packet : Host_Message.Packet_Type (1 .. 32);
   Packet_Length : Natural;
   Now : RTC.Date_Time_Type;
   Wait_Time : RTC.Second_Delta_Type := 30;
   procedure Print_Registers is new Radio.Print_Registers (Put_Line => Text_IO.Put_Line);

   function Init return Boolean is
   begin
      STM32GD.Board.Init;
      Host_Message.Send_Hello;
      Radio.Init;
      Radio.Set_Channel (Channel);
      Radio.Set_RX_Address (RX_Address);
      if Radio.Get_Channel = Channel then
         IRQ.Configure_Trigger (Falling => True);
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
