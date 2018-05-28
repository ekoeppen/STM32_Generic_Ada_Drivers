with Ada.Real_Time; use Ada.Real_Time;

package Blink is

   Period         : constant Time_Span := Milliseconds (2500);
   Blink_Duration : constant Time_Span := Milliseconds (100);
   subtype Blink_Count_Type is Positive;

   type LED_Type is (Green, Yellow, Red);
   type Mode_Type is (Off, Once, Repeat);

   type LED_Blink_Type is array (LED_Type) of Blink_Count_Type;
   type LED_Toggle_Type is array (LED_Type) of Natural;
   type LED_Mode_Type is array (LED_Type) of Mode_Type;

   protected Blink_Parameters is
      procedure Start (LED: LED_Type ; M : Mode_Type; C : Blink_Count_Type);

      function Get_Mode (LED: LED_Type) return Mode_Type;
      function Get_Blink_Count (LED: LED_Type) return Blink_Count_Type;
      procedure Toggle (LED : LED_Type ; Toggled : out Boolean);

   private
      Blink_Count       : LED_Blink_Type;
      Mode              : LED_Mode_Type := (Off, Off, Off);
      Remaining_Toggles : LED_Toggle_Type := (0, 0, 0);
   end Blink_Parameters;

end Blink;
