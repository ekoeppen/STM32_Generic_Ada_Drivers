with IRQ;
with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package Peripherals is

   Handler : IRQ.Controller (USART1_Interrupt);

end Peripherals;
