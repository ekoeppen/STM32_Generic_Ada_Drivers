with STM32_SVD; use STM32_SVD;

package body Drivers.Text_IO is

   procedure Put (S : String) is
   begin
      for C of S loop
         USART.Transmit (Character'Pos (C));
      end loop;
   end Put;

   procedure Put_Line (S : String) is
   begin
      Put (S);
      New_Line;
   end Put_Line;

   procedure New_Line is
   begin
      USART.Transmit (10);  
   end New_Line;

end Drivers.Text_IO;
