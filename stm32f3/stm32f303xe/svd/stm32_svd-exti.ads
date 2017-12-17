--  This spec has been automatically generated from STM32F303xE.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.EXTI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  IMR1_MR array element
   subtype IMR1_MR_Element is STM32_SVD.Bit;

   --  IMR1_MR array
   type IMR1_MR_Field_Array is array (0 .. 31) of IMR1_MR_Element
     with Component_Size => 1, Size => 32;

   --  Interrupt mask register
   type IMR1_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MR as a value
            Val : STM32_SVD.UInt32;
         when True =>
            --  MR as an array
            Arr : IMR1_MR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for IMR1_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  EMR1_MR array element
   subtype EMR1_MR_Element is STM32_SVD.Bit;

   --  EMR1_MR array
   type EMR1_MR_Field_Array is array (0 .. 31) of EMR1_MR_Element
     with Component_Size => 1, Size => 32;

   --  Event mask register
   type EMR1_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MR as a value
            Val : STM32_SVD.UInt32;
         when True =>
            --  MR as an array
            Arr : EMR1_MR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for EMR1_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  RTSR1_TR array element
   subtype RTSR1_TR_Element is STM32_SVD.Bit;

   --  RTSR1_TR array
   type RTSR1_TR_Field_Array is array (0 .. 22) of RTSR1_TR_Element
     with Component_Size => 1, Size => 23;

   --  Type definition for RTSR1_TR
   type RTSR1_TR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TR as a value
            Val : STM32_SVD.UInt23;
         when True =>
            --  TR as an array
            Arr : RTSR1_TR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 23;

   for RTSR1_TR_Field use record
      Val at 0 range 0 .. 22;
      Arr at 0 range 0 .. 22;
   end record;

   --  RTSR1_TR array
   type RTSR1_TR_Field_Array_1 is array (29 .. 31) of RTSR1_TR_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for RTSR1_TR
   type RTSR1_TR_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TR as a value
            Val : STM32_SVD.UInt3;
         when True =>
            --  TR as an array
            Arr : RTSR1_TR_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for RTSR1_TR_Field_1 use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  Rising Trigger selection register
   type RTSR1_Register is record
      --  Rising trigger event configuration of line 0
      TR             : RTSR1_TR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_23_28 : STM32_SVD.UInt6 := 16#0#;
      --  Rising trigger event configuration of line 29
      TR_1           : RTSR1_TR_Field_1 := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTSR1_Register use record
      TR             at 0 range 0 .. 22;
      Reserved_23_28 at 0 range 23 .. 28;
      TR_1           at 0 range 29 .. 31;
   end record;

   --  FTSR1_TR array element
   subtype FTSR1_TR_Element is STM32_SVD.Bit;

   --  FTSR1_TR array
   type FTSR1_TR_Field_Array is array (0 .. 22) of FTSR1_TR_Element
     with Component_Size => 1, Size => 23;

   --  Type definition for FTSR1_TR
   type FTSR1_TR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TR as a value
            Val : STM32_SVD.UInt23;
         when True =>
            --  TR as an array
            Arr : FTSR1_TR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 23;

   for FTSR1_TR_Field use record
      Val at 0 range 0 .. 22;
      Arr at 0 range 0 .. 22;
   end record;

   --  FTSR1_TR array
   type FTSR1_TR_Field_Array_1 is array (29 .. 31) of FTSR1_TR_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for FTSR1_TR
   type FTSR1_TR_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TR as a value
            Val : STM32_SVD.UInt3;
         when True =>
            --  TR as an array
            Arr : FTSR1_TR_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for FTSR1_TR_Field_1 use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  Falling Trigger selection register
   type FTSR1_Register is record
      --  Falling trigger event configuration of line 0
      TR             : FTSR1_TR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_23_28 : STM32_SVD.UInt6 := 16#0#;
      --  Falling trigger event configuration of line 29
      TR_1           : FTSR1_TR_Field_1 := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FTSR1_Register use record
      TR             at 0 range 0 .. 22;
      Reserved_23_28 at 0 range 23 .. 28;
      TR_1           at 0 range 29 .. 31;
   end record;

   --  SWIER1_SWIER array element
   subtype SWIER1_SWIER_Element is STM32_SVD.Bit;

   --  SWIER1_SWIER array
   type SWIER1_SWIER_Field_Array is array (0 .. 22) of SWIER1_SWIER_Element
     with Component_Size => 1, Size => 23;

   --  Type definition for SWIER1_SWIER
   type SWIER1_SWIER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SWIER as a value
            Val : STM32_SVD.UInt23;
         when True =>
            --  SWIER as an array
            Arr : SWIER1_SWIER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 23;

   for SWIER1_SWIER_Field use record
      Val at 0 range 0 .. 22;
      Arr at 0 range 0 .. 22;
   end record;

   --  SWIER1_SWIER array
   type SWIER1_SWIER_Field_Array_1 is array (29 .. 31)
     of SWIER1_SWIER_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for SWIER1_SWIER
   type SWIER1_SWIER_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SWIER as a value
            Val : STM32_SVD.UInt3;
         when True =>
            --  SWIER as an array
            Arr : SWIER1_SWIER_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for SWIER1_SWIER_Field_1 use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  Software interrupt event register
   type SWIER1_Register is record
      --  Software Interrupt on line 0
      SWIER          : SWIER1_SWIER_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_23_28 : STM32_SVD.UInt6 := 16#0#;
      --  Software Interrupt on line 29
      SWIER_1        : SWIER1_SWIER_Field_1 :=
                        (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SWIER1_Register use record
      SWIER          at 0 range 0 .. 22;
      Reserved_23_28 at 0 range 23 .. 28;
      SWIER_1        at 0 range 29 .. 31;
   end record;

   --  PR1_PR array element
   subtype PR1_PR_Element is STM32_SVD.Bit;

   --  PR1_PR array
   type PR1_PR_Field_Array is array (0 .. 22) of PR1_PR_Element
     with Component_Size => 1, Size => 23;

   --  Type definition for PR1_PR
   type PR1_PR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PR as a value
            Val : STM32_SVD.UInt23;
         when True =>
            --  PR as an array
            Arr : PR1_PR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 23;

   for PR1_PR_Field use record
      Val at 0 range 0 .. 22;
      Arr at 0 range 0 .. 22;
   end record;

   --  PR1_PR array
   type PR1_PR_Field_Array_1 is array (29 .. 31) of PR1_PR_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for PR1_PR
   type PR1_PR_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PR as a value
            Val : STM32_SVD.UInt3;
         when True =>
            --  PR as an array
            Arr : PR1_PR_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for PR1_PR_Field_1 use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   --  Pending register
   type PR1_Register is record
      --  Pending bit 0
      PR             : PR1_PR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_23_28 : STM32_SVD.UInt6 := 16#0#;
      --  Pending bit 29
      PR_1           : PR1_PR_Field_1 := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PR1_Register use record
      PR             at 0 range 0 .. 22;
      Reserved_23_28 at 0 range 23 .. 28;
      PR_1           at 0 range 29 .. 31;
   end record;

   --  IMR2_MR array element
   subtype IMR2_MR_Element is STM32_SVD.Bit;

   --  IMR2_MR array
   type IMR2_MR_Field_Array is array (32 .. 35) of IMR2_MR_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IMR2_MR
   type IMR2_MR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MR as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  MR as an array
            Arr : IMR2_MR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IMR2_MR_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Interrupt mask register
   type IMR2_Register is record
      --  Interrupt Mask on external/internal line 32
      MR            : IMR2_MR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_31 : STM32_SVD.UInt28 := 16#FFFFFFF#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IMR2_Register use record
      MR            at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  EMR2_MR array element
   subtype EMR2_MR_Element is STM32_SVD.Bit;

   --  EMR2_MR array
   type EMR2_MR_Field_Array is array (32 .. 35) of EMR2_MR_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for EMR2_MR
   type EMR2_MR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MR as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  MR as an array
            Arr : EMR2_MR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for EMR2_MR_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Event mask register
   type EMR2_Register is record
      --  Event mask on external/internal line 32
      MR            : EMR2_MR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_31 : STM32_SVD.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EMR2_Register use record
      MR            at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  RTSR2_TR array element
   subtype RTSR2_TR_Element is STM32_SVD.Bit;

   --  RTSR2_TR array
   type RTSR2_TR_Field_Array is array (32 .. 33) of RTSR2_TR_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RTSR2_TR
   type RTSR2_TR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TR as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  TR as an array
            Arr : RTSR2_TR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RTSR2_TR_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Rising Trigger selection register
   type RTSR2_Register is record
      --  Rising trigger event configuration bit of line 32
      TR            : RTSR2_TR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : STM32_SVD.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTSR2_Register use record
      TR            at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  FTSR2_TR array element
   subtype FTSR2_TR_Element is STM32_SVD.Bit;

   --  FTSR2_TR array
   type FTSR2_TR_Field_Array is array (32 .. 33) of FTSR2_TR_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for FTSR2_TR
   type FTSR2_TR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  TR as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  TR as an array
            Arr : FTSR2_TR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for FTSR2_TR_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Falling Trigger selection register
   type FTSR2_Register is record
      --  Falling trigger event configuration bit of line 32
      TR            : FTSR2_TR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : STM32_SVD.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FTSR2_Register use record
      TR            at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  SWIER2_SWIER array element
   subtype SWIER2_SWIER_Element is STM32_SVD.Bit;

   --  SWIER2_SWIER array
   type SWIER2_SWIER_Field_Array is array (32 .. 33) of SWIER2_SWIER_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SWIER2_SWIER
   type SWIER2_SWIER_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SWIER as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  SWIER as an array
            Arr : SWIER2_SWIER_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SWIER2_SWIER_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Software interrupt event register
   type SWIER2_Register is record
      --  Software interrupt on line 32
      SWIER         : SWIER2_SWIER_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : STM32_SVD.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SWIER2_Register use record
      SWIER         at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  PR2_PR array element
   subtype PR2_PR_Element is STM32_SVD.Bit;

   --  PR2_PR array
   type PR2_PR_Field_Array is array (32 .. 33) of PR2_PR_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for PR2_PR
   type PR2_PR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PR as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  PR as an array
            Arr : PR2_PR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PR2_PR_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Pending register
   type PR2_Register is record
      --  Pending bit on line 32
      PR            : PR2_PR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_31 : STM32_SVD.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PR2_Register use record
      PR            at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  External interrupt/event controller
   type EXTI_Peripheral is record
      --  Interrupt mask register
      IMR1   : aliased IMR1_Register;
      --  Event mask register
      EMR1   : aliased EMR1_Register;
      --  Rising Trigger selection register
      RTSR1  : aliased RTSR1_Register;
      --  Falling Trigger selection register
      FTSR1  : aliased FTSR1_Register;
      --  Software interrupt event register
      SWIER1 : aliased SWIER1_Register;
      --  Pending register
      PR1    : aliased PR1_Register;
      --  Interrupt mask register
      IMR2   : aliased IMR2_Register;
      --  Event mask register
      EMR2   : aliased EMR2_Register;
      --  Rising Trigger selection register
      RTSR2  : aliased RTSR2_Register;
      --  Falling Trigger selection register
      FTSR2  : aliased FTSR2_Register;
      --  Software interrupt event register
      SWIER2 : aliased SWIER2_Register;
      --  Pending register
      PR2    : aliased PR2_Register;
   end record
     with Volatile;

   for EXTI_Peripheral use record
      IMR1   at 16#0# range 0 .. 31;
      EMR1   at 16#4# range 0 .. 31;
      RTSR1  at 16#8# range 0 .. 31;
      FTSR1  at 16#C# range 0 .. 31;
      SWIER1 at 16#10# range 0 .. 31;
      PR1    at 16#14# range 0 .. 31;
      IMR2   at 16#18# range 0 .. 31;
      EMR2   at 16#1C# range 0 .. 31;
      RTSR2  at 16#20# range 0 .. 31;
      FTSR2  at 16#24# range 0 .. 31;
      SWIER2 at 16#28# range 0 .. 31;
      PR2    at 16#2C# range 0 .. 31;
   end record;

   --  External interrupt/event controller
   EXTI_Periph : aliased EXTI_Peripheral
     with Import, Address => System'To_Address (16#40010400#);

end STM32_SVD.EXTI;
