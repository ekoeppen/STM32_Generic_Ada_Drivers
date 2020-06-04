with Interfaces; use Interfaces;
with STM32GD;
with STM32_SVD; use STM32_SVD;
with STM32GD.Board;
with STM32GD.Power;

procedure Main is

   package Board renames STM32GD.Board;
   package Text_IO renames STM32GD.Board.Text_IO;
   package Radio renames STM32GD.Board.Radio;
   procedure Print_Registers is new Radio.Print_Registers (Put_Line => Text_IO.Put_Line);

   Line : String (1 .. 8);
   Len : Natural;

   procedure RX_Test is
      RX_Address        : constant Radio.Address_Type := 0;
      Packet: Radio.Packet_Type (1 .. 48);
      Length : Byte;
   begin
      Text_IO.Put_Line ("Starting RX test");
      Radio.Set_RX_Address (RX_Address);
      Radio.RX_Mode;
      loop
         STM32GD.Board.LED.Toggle;
         if Radio.Wait_For_RX then
            Text_IO.Put_Line ("Packet received");
            Print_Registers;
            Radio.Clear_IRQ;
            Radio.RX (Packet, Length);
            for I in 1 .. Length loop
               Text_IO.Put_Hex (Unsigned_32 (Packet (I)), 2);
            end loop;
            Text_IO.New_Line;
         end if;
      end loop;
   end RX_Test;

   procedure TX_Test is
      Broadcast_Address : constant Radio.Address_Type := 0;
      TX_Data           : constant Radio.Packet_Type := (
         16#01#, 16#02#, 16#03#, 16#04#, 16#05#, 16#06#, 16#07#, 16#08#, 16#09#
         --  16#00#, 16#FF#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#FF#, 16#55#
        );
   begin
      Text_IO.Put_Line ("Starting TX test");
      Radio.Set_TX_Address (Broadcast_Address);
      Radio.TX_Mode;
      loop
         Text_IO.Put_Line ("Press <enter>");
         Text_IO.Get_Line (Line, Len);
         STM32GD.Board.LED.Toggle;
         Radio.TX (TX_Data, 9);
         Print_Registers;
      end loop;
   end TX_Test;

   procedure Power_Down_Test is
   begin
      Radio.Power_Down;
      Board.Disable_Peripherals;
      STM32GD.Power.Enable_Stop;
      loop STM32GD.Wait_For_Interrupt; end loop;
   end Power_Down_Test;

begin
   Board.Init;
   Text_IO.Put_Line ("Starting RFM69 Test");
   Radio.Init;
   Text_IO.Put_Line ("r: RX test -- t: TX test -- others: Power down");
   Text_IO.Get_Line (Line, Len);
   case Line (Line'First) is
      when 'r' => RX_Test;
      when 't' => TX_Test;
      when others => Power_Down_Test;
   end case;
end Main;
