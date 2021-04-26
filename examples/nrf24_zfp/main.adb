with STM32GD.Board; use STM32GD.Board;
with STM32GD.GPIO; use STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with Drivers.Text_IO;
with Peripherals;

procedure Main is

   procedure Print_Registers is new Peripherals.Radio.Print_Registers (Put_Line => Text_IO.Put_Line);

   procedure RX_Test is
      RX_Address        : constant Peripherals.Radio.Address_Type := (16#00#, 16#F0#, 16#F0#, 16#F0#, 16#F0#);
   begin
      Text_IO.Put_Line ("Starting RX test");
      Peripherals.Radio.Set_RX_Address (RX_Address);
      Peripherals.Radio.RX_Mode;
      loop
         LED.Toggle;
         if Peripherals.Radio.Wait_For_RX then
            Text_IO.Put_Line ("Packet received");
         end if;
         Print_Registers;
      end loop;
   end RX_Test;

   procedure TX_Test is
      Broadcast_Address : constant Peripherals.Radio.Address_Type := (16#00#, 16#F0#, 16#F0#, 16#F0#, 16#F0#);
      TX_Data           : constant Peripherals.Radio.Packet_Type := (16#00#, 16#FF#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#FF#, 16#55#);
      Line              : String (1 .. 8);
      Len               : Natural;
   begin
      Text_IO.Put_Line ("Starting TX test");
      Peripherals.Radio.Set_TX_Address (Broadcast_Address);
      loop
         Text_IO.Put_Line ("Press <enter>");
         Text_IO.Get_Line (Line, Len);
         LED.Set;
         Peripherals.Radio.TX_Mode;
         Peripherals.Radio.TX (TX_Data);
         Peripherals.Radio.Power_Down;
         Text_IO.Put_Line ("Packet sent");
         Print_Registers;
         LED.Clear;
      end loop;
   end TX_Test;

begin
   Init;
   Peripherals.Init;
   Peripherals.Radio.Set_Channel (70);
   Print_Registers;
   TX_Test;
end Main;
