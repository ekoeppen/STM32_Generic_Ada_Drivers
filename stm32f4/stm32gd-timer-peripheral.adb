with Ada.Real_Time; use Ada.Real_Time;
with STM32_SVD; use STM32_SVD;
with STM32_SVD.TIM; use STM32_SVD.TIM;
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
         if Timer = Timer_3 then
            TIM3_Periph.SR.UIF := 0;
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
      if Timer = Timer_3 then
         RCC_Periph.APB1ENR.TIM3EN := 1;
         TIM3_Periph.PSC.PSC := UInt16 (CK_INT / Frequency);
         TIM3_Periph.CR1.ARPE := 1;
      end if;
   end Init;

   procedure Start (Time : Time_Span; Callback : Timer_Callback_Type) is
      MS : UInt16;
   begin
      MS := UInt16 (To_Duration (Time) * 1_000);
      Timer_Callback := Callback;
      First := True;
      if Timer = Timer_3 then
         TIM3_Periph.CNT.CNT_L := 0;
         TIM3_Periph.ARR.ARR_L := MS;
         TIM3_Periph.CR1.CEN := 1;
         TIM3_Periph.DIER.UIE := 1;
      end if;
   end Start;

   procedure Stop is
   begin
      if Timer = Timer_3 then
         TIM3_Periph.CR1.CEN := 0;
         TIM3_Periph.DIER.UIE := 0;
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
