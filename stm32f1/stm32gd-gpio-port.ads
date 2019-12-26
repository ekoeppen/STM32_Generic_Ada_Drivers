with STM32_SVD.GPIO;

package STM32GD.GPIO.Port is

   pragma Preelaborate;

   function GPIO_Port_Representation (Port : STM32_SVD.GPIO.GPIO_Peripheral) return UInt4
     with Inline;

end STM32GD.GPIO.Port;
