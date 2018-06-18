with Peripherals; use Peripherals;

package Modem is

   protected TX is
     entry Send (Data : in Radio.Packet_Type; Repeat : in Boolean := False);
     procedure Cancel_Send_Repeatedly;
     procedure Get_Data (Data_Available : out Boolean;
        Data : out Radio.Packet_Type);
   private
     Repeat    : Boolean := False;
     No_Data   : Boolean := True;
     Data      : Radio.Packet_Type;
   end TX;

end Modem;
