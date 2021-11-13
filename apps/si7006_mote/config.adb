with STM32GD;
with Interfaces; use Interfaces;
with Utils;

package body Config is

   type Mote_Config_Type is record
      Git_Short_Hash    : String (1 ..12);
      TX_Power          : Integer_8;
      Transmit_Interval : Unsigned_16;
    end record;

   Mote_Config : Mote_Config_Type := (
      Git_Short_Hash => "$Id$        ",
      TX_Power => -1,
      Transmit_Interval => 900);
      --  pragma Linker_Section (Mote_Config, ".config");

   function TX_Power return Integer is
   begin
      return Integer (Mote_Config.TX_Power);
   end TX_Power;

   function Transmit_Interval return Natural is
   begin
      return Natural (Mote_Config.Transmit_Interval);
   end Transmit_Interval;

   procedure Get_Git_Short_Hash (Hash : out String) is
   begin
      Hash := Mote_Config.Git_Short_Hash (6 .. 12);
   end Get_Git_Short_Hash;

   procedure Get_Node_Name (Name: out String) is
      HW_ID : Unsigned_32;
      UID : STM32GD.UID_Type := STM32GD.UID;
   begin
      HW_ID := UID (1) xor UID (2) xor UID (3);
      Name := Utils.To_Hex_String (HW_ID);
   end Get_Node_Name;

end Config;
