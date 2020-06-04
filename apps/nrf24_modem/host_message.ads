with Interfaces; use Interfaces;
with STM32GD.Board; use STM32GD.Board;

package Host_Message is

   type Packet_Type is array (Positive range <>) of Unsigned_8;

   procedure Send_Hello;
   procedure Send_Packet (Packet: Packet_Type; Length: Positive);
   procedure Send_Heartbeat;
   procedure Send_Error_Message (M : String);

end Host_Message;
