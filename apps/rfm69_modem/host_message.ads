with Interfaces; use Interfaces;
with STM32GD.Board; use STM32GD.Board;
with Drivers.RFM69;

generic

   with package Radio is new Drivers.RFM69 (<>);

package Host_Message is

   type Packet_Type is array (Unsigned_8 range <>) of Unsigned_8;

   procedure Send_Hello;
   procedure Send_Packet (Packet: Packet_Type; Length: Unsigned_8);
   procedure Send_Heartbeat;
   procedure Send_Status (Radio_Registers: Radio.Raw_Register_Array);
   procedure Send_Error_Message (M : String);

end Host_Message;
