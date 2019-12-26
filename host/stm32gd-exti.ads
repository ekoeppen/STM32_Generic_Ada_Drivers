package STM32GD.EXTI is

   pragma Preelaborate;

   type External_Line_Number is
     (EXTI_Line_0,
      EXTI_Line_1,
      EXTI_Line_2,
      EXTI_Line_3,
      EXTI_Line_4,
      EXTI_Line_5,
      EXTI_Line_6,
      EXTI_Line_7,
      EXTI_Line_8,
      EXTI_Line_9,
      EXTI_Line_10,
      EXTI_Line_11,
      EXTI_Line_12,
      EXTI_Line_13,
      EXTI_Line_14,
      EXTI_Line_15,
      EXTI_Line_16,
      EXTI_Line_17,
      EXTI_Line_18,
      EXTI_Line_19,
      EXTI_Line_20,
      EXTI_Line_21,
      EXTI_Line_22);

   for External_Line_Number use
     (EXTI_Line_0 => 0,
      EXTI_Line_1 => 1,
      EXTI_Line_2 => 2,
      EXTI_Line_3 => 3,
      EXTI_Line_4 => 4,
      EXTI_Line_5 => 5,
      EXTI_Line_6 => 6,
      EXTI_Line_7 => 7,
      EXTI_Line_8 => 8,
      EXTI_Line_9 => 9,
      EXTI_Line_10 => 10,
      EXTI_Line_11 => 11,
      EXTI_Line_12 => 12,
      EXTI_Line_13 => 13,
      EXTI_Line_14 => 14,
      EXTI_Line_15 => 15,
      EXTI_Line_16 => 16,
      EXTI_Line_17 => 17,
      EXTI_Line_18 => 18,
      EXTI_Line_19 => 19,
      EXTI_Line_20 => 20,
      EXTI_Line_21 => 21,
      EXTI_Line_22 => 22);

   subtype EXTI_Line_Type is Integer range 0 .. 22;

   type External_Triggers is
     (Interrupt_Rising_Edge,
      Interrupt_Falling_Edge,
      Interrupt_Rising_Falling_Edge,
      Event_Rising_Edge,
      Event_Falling_Edge,
      Event_Rising_Falling_Edge);

   type EXTI_IRQ_Status is array (0 .. 22) of Boolean;

   subtype Interrupt_Triggers is External_Triggers
      range Interrupt_Rising_Edge .. Interrupt_Rising_Falling_Edge;

   subtype Event_Triggers is External_Triggers
      range Event_Rising_Edge .. Event_Rising_Falling_Edge;

   procedure Enable_External_Interrupt
     (Line    : External_Line_Number;
      Trigger : Interrupt_Triggers)
     with Inline;

   procedure Disable_External_Interrupt (Line : External_Line_Number)
     with Inline;

   procedure Enable_External_Event
     (Line    : External_Line_Number;
      Trigger : Event_Triggers)
     with Inline;

   procedure Disable_External_Event (Line : External_Line_Number)
     with Inline;


   procedure Generate_SWI (Line : External_Line_Number)
     with Inline;

   function External_Interrupt_Pending (Line : External_Line_Number)
     return Boolean
     with Inline;

   procedure Clear_External_Interrupt (Line : External_Line_Number)
     with Inline;

end STM32GD.EXTI;
