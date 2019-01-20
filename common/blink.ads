with Ada.Real_Time; use Ada.Real_Time;

package Blink is

   Period         : constant Time_Span := Milliseconds (2500);
   Blink_Duration : constant Time_Span := Milliseconds (100);

   type LED_Type is (Green, Yellow, Red);
   type Mode_Type is (Off, Once, Repeat);

   type LED_Blink_Map is array (LED_Type) of Positive;
   type LED_Toggle_Map is array (LED_Type) of Natural;
   type LED_Mode_Map is array (LED_Type) of Mode_Type;

   protected Blink_Parameters is
      procedure Start (LED: LED_Type ; M : Mode_Type; C : Positive);
      procedure Increase_Blink_Count (LED : LED_Type);
      procedure Decrease_Blink_Count (LED : LED_Type);

      function Get_Mode (LED: LED_Type) return Mode_Type;
      function Get_Blink_Count (LED: LED_Type) return Positive;
      procedure Toggle (LED : LED_Type ; Toggled : out Boolean);

   private
      Blink_Count       : LED_Blink_Map;
      Mode              : LED_Mode_Map := (Off, Off, Off);
      Remaining_Toggles : LED_Toggle_Map := (0, 0, 0);
   end Blink_Parameters;

end Blink;
