with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with Ada.Real_Time; use Ada.Real_Time;

with STM32GD.Board;
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;

with Peripherals; use Peripherals;
with Drivers.Text_IO;

procedure Main is

   package GPIO renames STM32GD.GPIO;
   package Text_IO is new Drivers.Text_IO (USART => STM32GD.Board.USART);
   use Text_IO;
   procedure Print_Registers is new Peripherals.Radio.Print_Registers (Put_Line => Text_IO.Put_Line);

   procedure RX_Test is
      RX_Address        : constant Radio.Address_Type := 0;
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
         Print_Registers;
      end loop;
   end RX_Test;

   procedure TX_Test is
      Period            : constant Time_Span := Seconds (3);
      Broadcast_Address : constant Radio.Address_Type := 0;
      TX_Data           : constant Radio.Packet_Type := (
         16#00#, 16#FF#, 16#00#, 16#00#, 16#00#, 16#00#, 16#00#, 16#FF#, 16#55#,
         others => 0);
   begin
      Put_Line ("Starting TX test");
      Radio.Set_TX_Address (Broadcast_Address);
      Radio.TX_Mode;
      loop
         STM32GD.Board.LED_RED.Toggle;
         Radio.TX (TX_Data);
         Print_Registers;
         delay until Clock + Period;
      end loop;
   end TX_Test;

begin
   STM32GD.Board.Init;
   Peripherals.Init;
   loop
      TX_Test;
   end loop;
end Main;
