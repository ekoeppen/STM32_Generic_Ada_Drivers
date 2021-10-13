with Ada.Real_Time; use Ada.Real_Time;

with STM32GD.Board; use STM32GD.Board;

procedure Main is

   procedure Print_Registers is new Radio.Print_Registers (
      Put_Line => Text_IO.Put_Line);

   procedure RX_Test is
      RX_Address : constant Radio.Address_Type := (
         16#00#, 16#F0#, 16#F0#, 16#F0#, 16#F0#);
   begin
      Text_IO.Put_Line ("Starting RX test");
      Radio.Set_RX_Address (RX_Address);
      Radio.RX_Mode;
      Print_Registers;
      loop
         LED.Toggle;
         Timer.After (Seconds (10), Radio.Cancel'Access);
         if Radio.Wait_For_RX then
            Text_IO.New_Line;
            Text_IO.Put_Line ("Packet received");
         else
            Text_IO.Put_Line ("*");
         end if;
         Print_Registers;
      end loop;
   end RX_Test;

   procedure TX_Test is
      Period            : constant Time_Span := Seconds (3);
      Broadcast_Address : constant Radio.Address_Type := (
         16#00#, 16#F0#, 16#F0#, 16#F0#, 16#F0#);
      TX_Data           : constant Radio.Packet_Type := (
         16#00#, 16#FF#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#FF#,
         16#55#);
   begin
      Text_IO.Put_Line ("Starting TX test");
      Radio.Set_TX_Address (Broadcast_Address);
      Radio.TX_Mode;
      loop
         LED.Toggle;
         Radio.TX (TX_Data);
         Print_Registers;
         delay until Clock + Period;
      end loop;
   end TX_Test;

begin
   Init;
   Radio.Set_Channel (70);
   loop
      RX_Test;
   end loop;
end Main;
