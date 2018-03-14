with STM32GD.Board;

package body Last_Chance_Handler is

   -------------------------
   -- Last_Chance_Handler --
   -------------------------

   procedure Last_Chance_Handler (Msg : System.Address; Line : Integer) is
      pragma Unreferenced (Msg, Line);
   begin
      loop
         STM32GD.Board.LED_GREEN.Set;
      end loop;
   end Last_Chance_Handler;

end Last_Chance_Handler;

