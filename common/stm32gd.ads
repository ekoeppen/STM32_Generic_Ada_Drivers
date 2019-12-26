pragma Warnings (Off);
with Interfaces; use Interfaces;
pragma Warnings (On);

package STM32GD is

   pragma Preelaborate;

   procedure WFI with Inline_Always;
   procedure WFE with Inline_Always;
   procedure Reset;

end STM32GD;

