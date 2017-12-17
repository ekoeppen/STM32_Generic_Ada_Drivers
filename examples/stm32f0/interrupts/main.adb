with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with STM32GD.GPIO;
with STM32GD.GPIO.Pin;
with STM32GD.EXTI;
with STM32_SVD.RCC;
with IRQ;

procedure Main is

   package GPIO renames STM32GD.GPIO;

   package LED is new GPIO.Pin (Pin => GPIO.Pin_5, Port => GPIO.Port_A, Mode => GPIO.Mode_Out);
   package Button is new GPIO.Pin (Pin => GPIO.Pin_13, Port => GPIO.Port_C);


begin
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPAEN := True;
   STM32_SVD.RCC.RCC_Periph.AHBENR.IOPCEN := True;
   STM32_SVD.RCC.RCC_Periph.APB2ENR.SYSCFGEN := True;
   Button.Init;
   Button.Configure_Trigger (STM32GD.EXTI.Interrupt_Falling_Edge);
   LED.Init;
   LED.Set;
   loop
      if IRQ.Status = True then
         LED.Toggle;
      end if;
   end loop;
end Main;

