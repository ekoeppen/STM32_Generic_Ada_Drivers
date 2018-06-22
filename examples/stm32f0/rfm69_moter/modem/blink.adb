with STM32GD.Board;

package body Blink is

   Next_Release : Time := Clock;
   Period_On    : constant Time_Span := Milliseconds (200);
   Period_Off   : constant Time_Span := Milliseconds (200);
   Period_Pause : constant Time_Span := Milliseconds (2500);


   task Blink_Task with Storage_Size => 384;

   protected body Blink_Parameters is
      procedure Start (LED : LED_Type ; M : Mode_Type ; C : Positive) is
      begin
         Mode (LED) := M;
         Blink_Count (LED) := C;
         Remaining_Toggles (LED) := C * 2;
      end Start;

      procedure Increase_Blink_Count (LED : LED_Type) is
      begin
         Blink_Count (LED) := Blink_Count (LED) + 1;
      end Increase_Blink_Count;

      procedure Decrease_Blink_Count (LED : LED_Type) is
      begin
         if Blink_Count (LED) > 2 then
            Blink_Count (LED) := Blink_Count (LED) - 1;
         end if;
      end Decrease_Blink_Count;

      function Get_Mode (LED : LED_Type) return Mode_Type is
      begin
         return Mode (LED);
      end Get_Mode;

      function Get_Blink_Count (LED : LED_Type) return Positive is
      begin
         return Blink_Count (LED);
      end Get_Blink_Count;

      procedure Toggle (LED : LED_Type; Toggled : out Boolean) is
      begin
         Toggled := False;
         if Mode (LED) /= Off then
            case LED is
               when Green => STM32GD.Board.LED_GREEN.Toggle;
               when Yellow => STM32GD.Board.LED_Yellow.Toggle;
               when Red => STM32GD.Board.LED_RED.Toggle;
            end case;
            Remaining_Toggles (LED) := Remaining_Toggles (LED) - 1;
            if Remaining_Toggles (LED) = 0 then
               if Mode (LED) = Repeat then
                  Remaining_Toggles (LED) := Blink_Count (LED) * 2;
               else
                  Mode (LED) := Off;
               end if;
            else
               Toggled := True;
            end if;
         end if;
      end Toggle;

   end Blink_Parameters;

   task body Blink_Task is
      Skip           : Time_Span;
      Pause          : Time_Span := Period_Pause;
      Green_Toggled  : Boolean;
      Red_Toggled    : Boolean;
      Yellow_Toggled : Boolean;
   begin
      loop
         Blink_Parameters.Toggle (Green, Green_Toggled);
         Blink_Parameters.Toggle (Red, Red_Toggled);
         Blink_Parameters.Toggle (Yellow, Yellow_Toggled);
         if Green_Toggled or Red_Toggled or Yellow_Toggled then
            Skip := Period_On;
         else
            Skip := Pause;
         end if;
         Next_Release := Next_Release + Skip;
         delay until Next_Release;
      end loop;
   end Blink_Task;

end Blink;
