with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;

with STM32GD.Board;
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;

with Peripherals; use Peripherals;

procedure Main is

   package GPIO renames STM32GD.GPIO;

   procedure RX_Test is
      RX_Address        : constant Radio.Address_Type := (16#00#, 16#F0#, 16#F0#, 16#F0#, 16#F0#);
   begin
      Put_Line ("Starting RX test");
      Radio.Set_RX_Address (RX_Address);
      Radio.RX_Mode;
      loop
         STM32GD.Board.LED_RED.Toggle;
         Timer.After (Seconds (10), Radio.Cancel'Access);
         if Radio.Wait_For_RX then
            Put_Line ("Packet received");
         end if;
         Radio.Print_Registers;
      end loop;
   end RX_Test;

   procedure TX_Test is
      Period            : constant Time_Span := Seconds (3);
      Broadcast_Address : constant Radio.Address_Type := (16#00#, 16#F0#, 16#F0#, 16#F0#, 16#F0#);
      TX_Data           : constant Radio.Packet_Type := (16#00#, 16#FF#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#FF#, 16#55#);
   begin
      Put_Line ("Starting TX test");
      Radio.Set_TX_Address (Broadcast_Address);
      Radio.TX_Mode;
      loop
         STM32GD.Board.LED_RED.Toggle;
         Radio.TX (TX_Data);
         Radio.Print_Registers;
         delay until Clock + Period;
      end loop;
   end TX_Test;

begin
   STM32GD.Board.Init;
   Peripherals.Init;
   Radio.Set_Channel (70);
   loop
      null;
   end loop;
end Main;
