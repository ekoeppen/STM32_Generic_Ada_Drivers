with System.Machine_Code; use System.Machine_Code;

package body STM32GD is

   procedure WFI is
   begin
      Asm ("WFI", Volatile => True);
   end WFI;

   procedure WFE is
   begin
      Asm ("SEV", Volatile => True);
      Asm ("WFE", Volatile => True);
      Asm ("WFE", Volatile => True);
   end WFE;

   procedure Reset is
   begin
      null;
   end Reset;

end STM32GD;
