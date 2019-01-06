with STM32_SVD;                    use STM32_SVD;
with STM32GD.Board;                use STM32GD.Board;
with STM32GD.USART;                use STM32GD.USART;
with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Peripherals;                  use Peripherals;
with Utils;                        use Utils;
with Blink;

package body Modem is

   task Modem_Task with Storage_Size => 256, Secondary_Stack_Size => 32;

   -----------------------------------------------------------------------------

   task body Modem_Task is
      Next_Release   : Time := Clock;
      Period         : constant Time_Span := Milliseconds (300);
      Data           : Radio.Packet_Type;
      Data_Available : Boolean;

      procedure Transmit is
      begin
         Radio.TX (Data);
      end Transmit;

      procedure Receive is
      begin
         Radio.RX (Data);
         RX.Receive (Data);
      end Receive;

   begin
      Blink.Blink_Parameters.Increase_Blink_Count (Blink.Green);
      Radio.RX_Mode;
      loop
         if Radio.RX_Available then
            Receive;
         end if;

         TX.Get_Data (Data_Available, Data);
         if Data_Available then
            Transmit;
            Radio.RX_Mode;
         end if;

         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end Modem_Task;

   -----------------------------------------------------------------------------

   protected body TX is

     procedure Send (Data : in Radio.Packet_Type) is
     begin
        TX.Data := Data;
        TX.Data_Available := True;
     end Send;

     procedure Get_Data (Data_Available : out Boolean;
        Data : out Radio.Packet_Type) is
     begin
        Data_Available := TX.Data_Available;
        if Data_Available then
           TX.Data_Available := False;
           Data := TX.Data;
        end if;
     end Get_Data;

   end TX;

   -----------------------------------------------------------------------------

   protected body RX is

     procedure Receive (Data : in Radio.Packet_Type) is
     begin
        RX.Data := Data;
        RX.Data_Available := True;
     end Receive;

     procedure Get_Data (Data_Available : out Boolean;
        Data : out Radio.Packet_Type) is
     begin
        Data_Available := RX.Data_Available;
        if Data_Available then
           RX.Data_Available := False;
           Data := RX.Data;
        end if;
     end Get_Data;

   end RX;

end Modem;
