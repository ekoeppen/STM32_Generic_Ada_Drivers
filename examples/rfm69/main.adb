with STM32GD;
with STM32GD.Board;

procedure Main is

   package Board renames STM32GD.Board;
   package Text_IO renames STM32GD.Board.Text_IO;
   package Radio renames STM32GD.Board.Radio;

   procedure RX_Test is
      RX_Address        : constant Radio.Address_Type := 0;
   begin
      Text_IO.Put_Line ("Starting RX test");
      Radio.Set_RX_Address (RX_Address);
      Radio.RX_Mode;
      loop
         STM32GD.Board.LED_RED.Toggle;
         if Radio.Wait_For_RX then
            Text_IO.Put_Line ("Packet received");
         end if;
      end loop;
   end RX_Test;

   procedure TX_Test is
      Broadcast_Address : constant Radio.Address_Type := 0;
      TX_Data           : constant Radio.Packet_Type := (
         16#00#, 16#FF#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#FF#, 16#55#,
         others => 0);
   begin
      Text_IO.Put_Line ("Starting TX test");
      Radio.Set_TX_Address (Broadcast_Address);
      Radio.TX_Mode;
      loop
         STM32GD.Board.LED_RED.Toggle;
         Radio.TX (TX_Data);
      end loop;
   end TX_Test;

begin
   Board.Init;
   Text_IO.Put_Line ("Starting RFM69 Test");
   Radio.Init;
   Radio.Power_Down;
   Board.Power_Down;
   Board.Stop;
end Main;
