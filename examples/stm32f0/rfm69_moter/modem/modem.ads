with Peripherals; use Peripherals;

package Modem is

   protected TX is
     procedure Send (Data : in Radio.Packet_Type; Repeat : in Boolean := False);
     procedure Cancel_Send_Repeatedly;
     procedure Get_Data (Data_Available : out Boolean;
        Data : out Radio.Packet_Type);
   private
     Repeat    : Boolean := False;
     No_Data   : Boolean := True;
     Data      : Radio.Packet_Type;
   end TX;

   protected RX is
     procedure Receive (Data : in Radio.Packet_Type);
     procedure Get_Data (Data_Available : out Boolean;
        Data : out Radio.Packet_Type);
   private
     No_Data   : Boolean := True;
     Data      : Radio.Packet_Type;
   end RX;

end Modem;
