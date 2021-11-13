with STM32_SVD.EXTI;

package STM32GD.EXTI is

   pragma Preelaborate;

   subtype External_Line_Number is Integer range 0 .. 63;

   type External_Triggers is
     (Interrupt_Rising_Edge,
      Interrupt_Falling_Edge,
      Interrupt_Rising_Falling_Edge,
      Event_Rising_Edge,
      Event_Falling_Edge,
      Event_Rising_Falling_Edge);

   subtype Interrupt_Triggers is External_Triggers
      range Interrupt_Rising_Edge .. Interrupt_Rising_Falling_Edge;

   subtype Event_Triggers is External_Triggers
      range Event_Rising_Edge .. Event_Rising_Falling_Edge;

   procedure Connect_External_Interrupt (Pin: UInt4; Port_Index: UInt4);

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
