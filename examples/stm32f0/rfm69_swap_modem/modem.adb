with STM32_SVD; use STM32_SVD;
with Serial; use Serial;
with STM32GD.Board; use STM32GD.Board;
with STM32GD.USART; use STM32GD.USART;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Peripherals; use Peripherals;
with Utils; use Utils;

package body Modem is

   task Modem_Task with Storage_Size => 768;
   task Command_Task with Storage_Size => 512;

   protected TX_Data is
     entry Set_Data (Data : in Radio.Packet_Type);
     procedure Get_Data (Data_Available : out Boolean;
        Data : out Radio.Packet_Type);
   private
     No_Data : Boolean := True;
     TX_Data : Radio.Packet_Type;
   end TX_Data;

   -----------------------------------------------------------------------------

   task body Modem_Task is
      Next_Release   : Time := Clock;
      Period         : constant Time_Span := Milliseconds (1000);
      Data           : Radio.Packet_Type;
      Data_Available : Boolean;

      procedure TX_Once is
      begin
         Serial.Output.Write_Line ("Sending packet");
         LED_YELLOW.Set;
         Radio.TX (Data);
         LED_YELLOW.Clear;
      end TX_Once;

      procedure TX_Loop is
      begin
         loop
            TX_Once;
            Next_Release := Next_Release + Period;
            delay until Next_Release;
         end loop;
      end TX_Loop;

      procedure RX_Once is
      begin
         LED_RED.Set;
         Serial.Output.Write_Line ("Packet received");
         Radio.Print_Registers;
         Radio.RX (Data);
         for D of Data loop
            Serial.Output.Write (To_Hex_String (D));
         end loop;
         Serial.Output.Write_Line ("");
         LED_RED.Clear;
      end RX_Once;

   begin
      Serial.Output.Write_Line ("Modem task starting");
      Radio.RX_Mode;
      loop
         TX_Data.Get_Data (Data_Available, Data);
         if Data_Available then
            TX_Once;
            Radio.RX_Mode;
         end if;
         if Radio.RX_Available then
            RX_Once;
         end if;

         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end Modem_Task;

   -----------------------------------------------------------------------------

   protected body TX_Data is

     entry Set_Data (Data : in Radio.Packet_Type) when No_Data is
     begin
        TX_Data := Data;
        No_Data := False;
     end Set_Data;

     procedure Get_Data (Data_Available : out Boolean;
        Data : out Radio.Packet_Type) is
     begin
        Data_Available := not No_Data;
        if Data_Available then
           No_Data := True;
           Data := TX_Data;
        end if;
     end Get_Data;

   end TX_Data;

   -----------------------------------------------------------------------------

   procedure Handle_Command (Line : Serial_Data) is
      Transmit_Cmd   : Byte := Character'Pos ('t');
      Receive_Cmd    : Byte := Character'Pos ('r');
      Status_Cmd     : Byte := Character'Pos ('s');
      Test_Data      : Radio.Packet_Type := (7, 1, 2, 3, 4, 5, 6, 7);
   begin
      Serial.Output.Write (Line);
      if Line.Length > 1 then
         if Line.Data (1) = Transmit_Cmd then
            Serial.Output.Write_Line ("Transmitting");
            TX_Data.Set_Data (Test_Data);
         elsif Line.Data (1) = Receive_Cmd then
            Serial.Output.Write_Line ("Receiving");
            if Radio.Wait_For_RX then
               Serial.Output.Write_Line ("Got packet");
            end if;
         elsif Line.Data (1) = Status_Cmd then
            Serial.Output.Write_Line ("Status");
            Radio.Print_Registers;
         end if;
      end if;
   end Handle_Command;

   task body Command_Task is
      Command_Line : Serial_Data;
   begin
      Serial.Output.Write_Line ("Command task starting");
      loop
         Serial.Output.Write ("Command: ");
         Serial.Input.Read_Line (Command_Line);
         Handle_Command (Command_Line);
      end loop;
   end Command_Task;

end Modem;
