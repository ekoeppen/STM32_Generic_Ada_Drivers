with STM32GD.Clock;
with STM32GD.Clock.Tree;

generic

   Input : Clock_Type;
   with package Clock_Tree is new STM32GD.Clock.Tree (<>);

package STM32GD.Clock.Timer is

   pragma Preelaborate;

   procedure Init;
   procedure Delay_us (us : Natural);
   procedure Delay_ms (ms : Natural);
   procedure Delay_s (s : Natural);

end STM32GD.Clock.Timer;
