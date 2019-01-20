with HAL;

generic

   with package USART is new HAL.USART (<>);

package Drivers.Text_IO is

   procedure Put (S : String);
   procedure Put_Line (S : String);
   procedure New_Line;

end Drivers.Text_IO;
