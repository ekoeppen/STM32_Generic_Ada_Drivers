with STM32_SVD; use STM32_SVD;
with STM32_SVD.GPIO;

package STM32GD.GPIO is

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

   type Pin_In_Conf is (In_Analog, In_Floating, In_PullUpDown)
     with Size => 2;

   for Pin_In_Conf use
     (In_Analog      => 2#00#,
      In_Floating    => 2#01#,
      In_PullUpDown  => 2#10#);

   type Pin_Out_Conf is (
      Out_PushPull, Out_OpenDrain, Alt_PushPull, Alt_OpenDrain)
     with Size => 2;

   for Pin_Out_Conf use
     (Out_PushPull   => 2#00#,
      Out_OpenDrain  => 2#01#,
      Alt_PushPull   => 2#10#,
      Alt_OpenDrain  => 2#11#);

   type Pin_IO_Modes is (Input, Speed_10MHz, Speed_2MHz, Speed_50MHz)
     with Size => 2;

   for Pin_IO_Modes use
     (Input       => 2#00#,
      Speed_10MHz => 2#01#,
      Speed_2MHz  => 2#10#,
      Speed_50MHz => 2#11#);

end STM32GD.GPIO;
