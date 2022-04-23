with Interfaces;

package Config is

   pragma Preelaborate;

   function TX_Power return Integer;
   function Transmit_Interval return Natural;
   procedure Get_Git_Short_Hash (Hash : out String);
   procedure Get_Node_Name (Name: out String);

end Config;
