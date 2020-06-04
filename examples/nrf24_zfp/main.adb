with STM32GD.Board; use STM32GD.Board;
with Drivers.Text_IO;

procedure Main is

   procedure Print_Registers is new Radio.Print_Registers (Put_Line => Text_IO.Put_Line);

   procedure RX_Test is
      RX_Address        : constant Radio.Address_Type := (16#00#, 16#F0#, 16#F0#, 16#F0#, 16#F0#);
   begin
      Text_IO.Put_Line ("Starting RX test");
      Radio.Set_RX_Address (RX_Address);
      Radio.RX_Mode;
      loop
         LED.Toggle;
         if Radio.Wait_For_RX then
            Text_IO.Put_Line ("Packet received");
         end if;
         Print_Registers;
      end loop;
   end RX_Test;

   procedure TX_Test is
      Broadcast_Address : constant Radio.Address_Type := (16#00#, 16#F0#, 16#F0#, 16#F0#, 16#F0#);
      TX_Data           : constant Radio.Packet_Type := (16#00#, 16#FF#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#FF#, 16#55#);
      Line              : String (1 .. 8);
      Len               : Natural;
   begin
      Text_IO.Put_Line ("Starting TX test");
      Radio.Set_TX_Address (Broadcast_Address);
      loop
         Text_IO.Put_Line ("Press <enter>");
         Text_IO.Get_Line (Line, Len);
         LED.Set;
         Radio.TX_Mode;
         Radio.TX (TX_Data);
         Radio.Power_Down;
         Text_IO.Put_Line ("Packet sent");
         Print_Registers;
         LED.Clear;
      end loop;
   end TX_Test;

begin
   Init;
   Radio.Init;
   Radio.Set_Channel (70);
   Print_Registers;
   TX_Test;
end Main;
