with STM32GD.Board;
with Serial;

package body Blink is

   Next_Release : Time := Clock;
   Period       : constant Time_Span := Milliseconds (500);

   task Blink_Task with Storage_Size => 384;

   protected body Blink_Parameters is
      procedure Set_Rate (R : Time_Span) is
      begin
         Rate := R;
      end Set_Rate;

      procedure Set_Blinks (C : Natural) is
      begin
         Count := C;
      end Set_Blinks;

      function Get_Rate return Time_Span is
      begin
         return Rate;
      end Get_Rate;

      function Get_Blinks return Natural is
      begin
         return Count;
      end Get_Blinks;

   end Blink_Parameters;

   task body Blink_Task is
   begin
      Serial.Output.Write_Line ("Blink task starting");
      loop
         STM32GD.Board.LED_GREEN.Toggle;
         Next_Release := Next_Release + Blink_Parameters.Get_Rate;
         delay until Next_Release;
      end loop;
   end Blink_Task;

end Blink;
