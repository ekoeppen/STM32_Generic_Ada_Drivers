with STM32_SVD; use STM32_SVD;

package STM32GD.GPIO is

   type GPIO_Pin is
     (Pin_0, Pin_1, Pin_2,  Pin_3,  Pin_4,  Pin_5,  Pin_6,  Pin_7,
      Pin_8, Pin_9, Pin_10, Pin_11, Pin_12, Pin_13, Pin_14, Pin_15);

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

