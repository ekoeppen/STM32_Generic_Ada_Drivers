pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x3.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.EXTI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  IMR_IM array element
   subtype IMR_IM_Element is STM32_SVD.Bit;

   --  IMR_IM array
   type IMR_IM_Field_Array is array (0 .. 26) of IMR_IM_Element
     with Component_Size => 1, Size => 27;

   --  Type definition for IMR_IM
   type IMR_IM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IM as a value
            Val : STM32_SVD.UInt27;
         when True =>
            --  IM as an array
            Arr : IMR_IM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 27;

   for IMR_IM_Field use record
      Val at 0 range 0 .. 26;
      Arr at 0 range 0 .. 26;
   end record;

   --  IMR_IM array
   type IMR_IM_Field_Array_1 is array (28 .. 29) of IMR_IM_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for IMR_IM
   type IMR_IM_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IM as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  IM as an array
            Arr : IMR_IM_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for IMR_IM_Field_1 use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Interrupt mask register (EXTI_IMR)
   type IMR_Register is record
      --  Interrupt Mask on line 0
      IM             : IMR_IM_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_27_27 : STM32_SVD.Bit := 16#1#;
      --  Interrupt Mask on line 27
      IM_1           : IMR_IM_Field_1 := (As_Array => False, Val => 16#1#);
      --  unspecified
      Reserved_30_31 : STM32_SVD.UInt2 := 16#3#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IMR_Register use record
      IM             at 0 range 0 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      IM_1           at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  EMR_EM array element
   subtype EMR_EM_Element is STM32_SVD.Bit;

   --  EMR_EM array
   type EMR_EM_Field_Array is array (0 .. 26) of EMR_EM_Element
     with Component_Size => 1, Size => 27;

   --  Type definition for EMR_EM
   type EMR_EM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EM as a value
            Val : STM32_SVD.UInt27;
         when True =>
            --  EM as an array
            Arr : EMR_EM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 27;

   for EMR_EM_Field use record
      Val at 0 range 0 .. 26;
      Arr at 0 range 0 .. 26;
   end record;

   --  EMR_EM array
   type EMR_EM_Field_Array_1 is array (28 .. 29) of EMR_EM_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for EMR_EM
   type EMR_EM_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EM as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  EM as an array
            Arr : EMR_EM_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for EMR_EM_Field_1 use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Event mask register (EXTI_EMR)
   type EMR_Register is record
      --  Event Mask on line 0
      EM             : EMR_EM_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_27_27 : STM32_SVD.Bit := 16#0#;
      --  Event Mask on line 28
      EM_1           : EMR_EM_Field_1 := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : STM32_SVD.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EMR_Register use record
      EM             at 0 range 0 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      EM_1           at 0 range 28 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  RTSR_RT array element
   subtype RTSR_RT_Element is STM32_SVD.Bit;

   --  RTSR_RT array
   type RTSR_RT_Field_Array is array (0 .. 17) of RTSR_RT_Element
     with Component_Size => 1, Size => 18;

   --  Type definition for RTSR_RT
   type RTSR_RT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RT as a value
            Val : STM32_SVD.UInt18;
         when True =>
            --  RT as an array
            Arr : RTSR_RT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 18;

   for RTSR_RT_Field use record
      Val at 0 range 0 .. 17;
      Arr at 0 range 0 .. 17;
   end record;

   --  RTSR_RT array
   type RTSR_RT_Field_Array_1 is array (19 .. 22) of RTSR_RT_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for RTSR_RT
   type RTSR_RT_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  RT as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  RT as an array
            Arr : RTSR_RT_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for RTSR_RT_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Rising Trigger selection register (EXTI_RTSR)
   type RTSR_Register is record
      --  Rising trigger event configuration of line 0
      RT             : RTSR_RT_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_18_18 : STM32_SVD.Bit := 16#0#;
      --  Rising trigger event configuration of line 19
      RT_1           : RTSR_RT_Field_1 := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTSR_Register use record
      RT             at 0 range 0 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      RT_1           at 0 range 19 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  FTSR_FT array element
   subtype FTSR_FT_Element is STM32_SVD.Bit;

   --  FTSR_FT array
   type FTSR_FT_Field_Array is array (0 .. 17) of FTSR_FT_Element
     with Component_Size => 1, Size => 18;

   --  Type definition for FTSR_FT
   type FTSR_FT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FT as a value
            Val : STM32_SVD.UInt18;
         when True =>
            --  FT as an array
            Arr : FTSR_FT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 18;

   for FTSR_FT_Field use record
      Val at 0 range 0 .. 17;
      Arr at 0 range 0 .. 17;
   end record;

   --  FTSR_FT array
   type FTSR_FT_Field_Array_1 is array (19 .. 22) of FTSR_FT_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for FTSR_FT
   type FTSR_FT_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  FT as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  FT as an array
            Arr : FTSR_FT_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for FTSR_FT_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Falling Trigger selection register (EXTI_FTSR)
   type FTSR_Register is record
      --  Falling trigger event configuration of line 0
      FT             : FTSR_FT_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_18_18 : STM32_SVD.Bit := 16#0#;
      --  Falling trigger event configuration of line 19
      FT_1           : FTSR_FT_Field_1 := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FTSR_Register use record
      FT             at 0 range 0 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      FT_1           at 0 range 19 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  SWIER_SWI array element
   subtype SWIER_SWI_Element is STM32_SVD.Bit;

   --  SWIER_SWI array
   type SWIER_SWI_Field_Array is array (0 .. 17) of SWIER_SWI_Element
     with Component_Size => 1, Size => 18;

   --  Type definition for SWIER_SWI
   type SWIER_SWI_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SWI as a value
            Val : STM32_SVD.UInt18;
         when True =>
            --  SWI as an array
            Arr : SWIER_SWI_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 18;

   for SWIER_SWI_Field use record
      Val at 0 range 0 .. 17;
      Arr at 0 range 0 .. 17;
   end record;

   --  SWIER_SWI array
   type SWIER_SWI_Field_Array_1 is array (19 .. 22) of SWIER_SWI_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for SWIER_SWI
   type SWIER_SWI_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SWI as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  SWI as an array
            Arr : SWIER_SWI_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for SWIER_SWI_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Software interrupt event register (EXTI_SWIER)
   type SWIER_Register is record
      --  Software Interrupt on line 0
      SWI            : SWIER_SWI_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_18_18 : STM32_SVD.Bit := 16#0#;
      --  Software Interrupt on line 19
      SWI_1          : SWIER_SWI_Field_1 := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SWIER_Register use record
      SWI            at 0 range 0 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      SWI_1          at 0 range 19 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  PR_PIF array element
   subtype PR_PIF_Element is STM32_SVD.Bit;

   --  PR_PIF array
   type PR_PIF_Field_Array is array (0 .. 17) of PR_PIF_Element
     with Component_Size => 1, Size => 18;

   --  Type definition for PR_PIF
   type PR_PIF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIF as a value
            Val : STM32_SVD.UInt18;
         when True =>
            --  PIF as an array
            Arr : PR_PIF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 18;

   for PR_PIF_Field use record
      Val at 0 range 0 .. 17;
      Arr at 0 range 0 .. 17;
   end record;

   --  PR_PIF array
   type PR_PIF_Field_Array_1 is array (19 .. 22) of PR_PIF_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for PR_PIF
   type PR_PIF_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PIF as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  PIF as an array
            Arr : PR_PIF_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for PR_PIF_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Pending register (EXTI_PR)
   type PR_Register is record
      --  Pending bit 0
      PIF            : PR_PIF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_18_18 : STM32_SVD.Bit := 16#0#;
      --  Pending bit 19
      PIF_1          : PR_PIF_Field_1 := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PR_Register use record
      PIF            at 0 range 0 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      PIF_1          at 0 range 19 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  External interrupt/event controller
   type EXTI_Peripheral is record
      --  Interrupt mask register (EXTI_IMR)
      IMR   : aliased IMR_Register;
      --  Event mask register (EXTI_EMR)
      EMR   : aliased EMR_Register;
      --  Rising Trigger selection register (EXTI_RTSR)
      RTSR  : aliased RTSR_Register;
      --  Falling Trigger selection register (EXTI_FTSR)
      FTSR  : aliased FTSR_Register;
      --  Software interrupt event register (EXTI_SWIER)
      SWIER : aliased SWIER_Register;
      --  Pending register (EXTI_PR)
      PR    : aliased PR_Register;
   end record
     with Volatile;

   for EXTI_Peripheral use record
      IMR   at 16#0# range 0 .. 31;
      EMR   at 16#4# range 0 .. 31;
      RTSR  at 16#8# range 0 .. 31;
      FTSR  at 16#C# range 0 .. 31;
      SWIER at 16#10# range 0 .. 31;
      PR    at 16#14# range 0 .. 31;
   end record;

   --  External interrupt/event controller
   EXTI_Periph : aliased EXTI_Peripheral
     with Import, Address => EXTI_Base;

end STM32_SVD.EXTI;
