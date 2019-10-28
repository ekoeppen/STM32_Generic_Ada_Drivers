with STM32_SVD.GPIO;
with STM32_SVD; use STM32_SVD;

package STM32GD.GPIO is

   pragma Preelaborate;

   Port_A : STM32_SVD.GPIO.GPIO_Peripheral renames STM32_SVD.GPIO.GPIOA_Periph;
   Port_B : STM32_SVD.GPIO.GPIO_Peripheral renames STM32_SVD.GPIO.GPIOB_Periph;
   Port_C : STM32_SVD.GPIO.GPIO_Peripheral renames STM32_SVD.GPIO.GPIOC_Periph;
   Port_D : STM32_SVD.GPIO.GPIO_Peripheral renames STM32_SVD.GPIO.GPIOD_Periph;
   Port_F : STM32_SVD.GPIO.GPIO_Peripheral renames STM32_SVD.GPIO.GPIOF_Periph;

   type GPIO_Pin is
     (Pin_0, Pin_1, Pin_2,  Pin_3,  Pin_4,  Pin_5,  Pin_6,  Pin_7,
      Pin_8, Pin_9, Pin_10, Pin_11, Pin_12, Pin_13, Pin_14, Pin_15);

   for GPIO_Pin use
     (Pin_0  => 16#0001#,
      Pin_1  => 16#0002#,
      Pin_2  => 16#0004#,
      Pin_3  => 16#0008#,
      Pin_4  => 16#0010#,
      Pin_5  => 16#0020#,
      Pin_6  => 16#0040#,
      Pin_7  => 16#0080#,
      Pin_8  => 16#0100#,
      Pin_9  => 16#0200#,
      Pin_10 => 16#0400#,
      Pin_11 => 16#0800#,
      Pin_12 => 16#1000#,
      Pin_13 => 16#2000#,
      Pin_14 => 16#4000#,
      Pin_15 => 16#8000#);

   for GPIO_Pin'Size use 16;
   --  for compatibility with hardware registers

   type GPIO_Pins is array (Positive range <>) of GPIO_Pin;
   --  Note that, in addition to aggregates, the language-defined catenation
   --  operator "&" is available for types GPIO_Pin and GPIO_Pins, allowing one
   --  to construct GPIO_Pins values conveniently

   All_Pins : constant GPIO_Pins :=
                (Pin_0, Pin_1, Pin_2, Pin_3, Pin_4, Pin_5, Pin_6, Pin_7,
                 Pin_8, Pin_9, Pin_10, Pin_11, Pin_12, Pin_13, Pin_14, Pin_15);

   type Pin_IO_Modes is (Mode_In, Mode_Out, Mode_AF, Mode_Analog)
     with Size => 2;

   for Pin_IO_Modes use
     (Mode_In     => 0,
      Mode_Out    => 1,
      Mode_AF     => 2,
      Mode_Analog => 3);

   type Pin_Output_Types is (Push_Pull, Open_Drain)
     with Size => 1;

   for Pin_Output_Types use (Push_Pull => 0, Open_Drain => 1);

   type Pin_Output_Speeds is (Speed_2MHz,  Speed_25MHz, Speed_50MHz, Speed_100MHz)
     with Size => 2;

   for Pin_Output_Speeds use
     (Speed_2MHz   => 0,  -- low
      Speed_25MHz  => 1,  -- medium
      Speed_50MHz  => 2,  -- high
      Speed_100MHz => 3); -- very high

   Speed_Low       : Pin_Output_Speeds renames Speed_2MHz;
   Speed_Medium    : Pin_Output_Speeds renames Speed_25MHz;
   Speed_High      : Pin_Output_Speeds renames Speed_50MHz;
   Speed_Very_High : Pin_Output_Speeds renames Speed_100MHz;

   type Internal_Pin_Resistors is (Floating, Pull_Up, Pull_Down)
     with Size => 2;

   for Internal_Pin_Resistors use (Floating  => 0,
                                   Pull_Up   => 1,
                                   Pull_Down => 2);


   type GPIO_Alternate_Function is new UInt4;

end STM32GD.GPIO;

