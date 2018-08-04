with Peripherals; use Peripherals;

package Modem is

   protected TX is
     procedure Send (Data : in Radio.Packet_Type);
     procedure Get_Data (Data_Available : out Boolean;
        Data : out Radio.Packet_Type);
   private
     Data_Available : Boolean := False;
     Data           : Radio.Packet_Type;
   end TX;

   protected RX is
     procedure Receive (Data : in Radio.Packet_Type);
     procedure Get_Data (Data_Available : out Boolean;
        Data : out Radio.Packet_Type);
   private
     Data_Available : Boolean := False;
     Data           : Radio.Packet_Type;
   end RX;

end Modem;
