with STM32GD.Clock.Tree;

generic

   with package Clock_Tree is new STM32GD.Clock.Tree (<>);

package STM32GD.Timeout is

   type Microseconds is new Natural;
   type Milliseconds is new Natural;
   type Seconds is new Natural;

   procedure Set (T : Microseconds);
   procedure Set (T : Milliseconds);
   procedure Set (T : Seconds);
   procedure Await;
   function Expired return Boolean;

end STM32GD.Timeout;
