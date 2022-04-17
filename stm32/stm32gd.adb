with STM32_SVD; use STM32_SVD;
with STM32_SVD.SCB; use STM32_SVD.SCB;
with System.Machine_Code; use System.Machine_Code;

package body STM32GD is

   procedure Wait_For_Interrupt is
   begin
      Asm ("WFI", Volatile => True);
   end Wait_For_Interrupt;

   procedure Clear_Event is
   begin
      Asm ("SEV", Volatile => True);
      Asm ("WFE", Volatile => True);
   end Clear_Event;

   procedure Wait_For_Event is
   begin
      SCB_Periph.SCR.SEVEONPEND := 1;
      Asm ("WFE", Volatile => True);
   end Wait_For_Event;

   function UID return UID_Type is
      UID_F3 : aliased UID_Type with Import, Address => System'To_Address (16#1FFFF7E8#);
      UID_Fx : aliased UID_Type with Import, Address => System'To_Address (16#1FFFF7AC#);
      UID_Lx : aliased UID_Type with Import, Address => System'To_Address (16#1FF80050#);
   begin
      if SCB_Periph.CPUID.PartNo = 16#C23# then
         return UID_F3;
      elsif SCB_Periph.CPUID.PartNo = 16#C60# then
         return UID_Lx;
      else
         return UID_Fx;
      end if;
   end UID;

end STM32GD;
