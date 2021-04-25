with Ada.Real_Time; use Ada.Real_Time;
with STM32_SVD; use STM32_SVD;
with STM32_SVD.TIMS; use STM32_SVD.TIMS;
with STM32_SVD.RCC; use STM32_SVD.RCC;

package body STM32GD.Timer.Peripheral is

   Timer_Callback : Timer_Callback_Type := null;
   Frequency : constant Natural := 1_000;
   CK_INT : constant Natural := 8_000_000;
   Repeat : Boolean;
   First : Boolean;

   procedure Start (Time : Time_Span; Callback : Timer_Callback_Type);

   protected body IRQ_Handler is
      procedure Handler is
      begin
         if Timer = Timer_7 then
            TIM7_Periph.SR.UIF := 0;
         end if;
         if Timer_Callback /= null then
            if not First then
               if not Repeat then
                     Stop;
               end if;
               Timer_Callback.all;
            else
               First := False;
            end if;
         end if;
      end Handler;
   end IRQ_Handler;

   procedure Init is
   begin
      if Timer = Timer_7 then
         RCC_Periph.APB1ENR.TIM7EN := 1;
         TIM7_Periph.PSC.PSC := UInt16 (CK_INT / Frequency);
         TIM7_Periph.CR1.ARPE := 1;
      end if;
   end Init;

   procedure Start (Time : Time_Span; Callback : Timer_Callback_Type) is
      MS : UInt16;
   begin
      MS := UInt16 (To_Duration (Time) * 1_000);
      Timer_Callback := Callback;
      First := True;
      if Timer = Timer_7 then
         TIM7_Periph.CNT.CNT := 0;
         TIM7_Periph.ARR.ARR := MS;
         TIM7_Periph.CR1.CEN := 1;
         TIM7_Periph.DIER.UIE := 1;
      end if;
   end Start;

   procedure Stop is
   begin
      if Timer = Timer_7 then
         TIM7_Periph.CR1.CEN := 0;
         TIM7_Periph.DIER.UIE := 0;
      end if;
   end Stop;

   procedure After (Time : Time_Span; Callback : Timer_Callback_Type) is
   begin
      Repeat := False;
      Start (Time, Callback);
   end After;

   procedure Every (Interval : Time_Span; Callback : Timer_Callback_Type) is
   begin
      Repeat := True;
      Start (Interval, Callback);
   end Every;

end STM32GD.Timer.Peripheral;
