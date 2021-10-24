pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32L0x3.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32_SVD.TSC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_TSCE_Field is STM32_SVD.Bit;
   subtype CR_START_Field is STM32_SVD.Bit;
   subtype CR_AM_Field is STM32_SVD.Bit;
   subtype CR_SYNCPOL_Field is STM32_SVD.Bit;
   subtype CR_IODEF_Field is STM32_SVD.Bit;
   subtype CR_MCV_Field is STM32_SVD.UInt3;
   subtype CR_PGPSC_Field is STM32_SVD.UInt3;
   subtype CR_SSPSC_Field is STM32_SVD.Bit;
   subtype CR_SSE_Field is STM32_SVD.Bit;
   subtype CR_SSD_Field is STM32_SVD.UInt7;
   subtype CR_CTPL_Field is STM32_SVD.UInt4;
   subtype CR_CTPH_Field is STM32_SVD.UInt4;

   --  control register
   type CR_Register is record
      --  Touch sensing controller enable
      TSCE          : CR_TSCE_Field := 16#0#;
      --  Start a new acquisition
      START         : CR_START_Field := 16#0#;
      --  Acquisition mode
      AM            : CR_AM_Field := 16#0#;
      --  Synchronization pin polarity
      SYNCPOL       : CR_SYNCPOL_Field := 16#0#;
      --  I/O Default mode
      IODEF         : CR_IODEF_Field := 16#0#;
      --  Max count value
      MCV           : CR_MCV_Field := 16#0#;
      --  unspecified
      Reserved_8_11 : STM32_SVD.UInt4 := 16#0#;
      --  pulse generator prescaler
      PGPSC         : CR_PGPSC_Field := 16#0#;
      --  Spread spectrum prescaler
      SSPSC         : CR_SSPSC_Field := 16#0#;
      --  Spread spectrum enable
      SSE           : CR_SSE_Field := 16#0#;
      --  Spread spectrum deviation
      SSD           : CR_SSD_Field := 16#0#;
      --  Charge transfer pulse low
      CTPL          : CR_CTPL_Field := 16#0#;
      --  Charge transfer pulse high
      CTPH          : CR_CTPH_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      TSCE          at 0 range 0 .. 0;
      START         at 0 range 1 .. 1;
      AM            at 0 range 2 .. 2;
      SYNCPOL       at 0 range 3 .. 3;
      IODEF         at 0 range 4 .. 4;
      MCV           at 0 range 5 .. 7;
      Reserved_8_11 at 0 range 8 .. 11;
      PGPSC         at 0 range 12 .. 14;
      SSPSC         at 0 range 15 .. 15;
      SSE           at 0 range 16 .. 16;
      SSD           at 0 range 17 .. 23;
      CTPL          at 0 range 24 .. 27;
      CTPH          at 0 range 28 .. 31;
   end record;

   subtype IER_EOAIE_Field is STM32_SVD.Bit;
   subtype IER_MCEIE_Field is STM32_SVD.Bit;

   --  interrupt enable register
   type IER_Register is record
      --  End of acquisition interrupt enable
      EOAIE         : IER_EOAIE_Field := 16#0#;
      --  Max count error interrupt enable
      MCEIE         : IER_MCEIE_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : STM32_SVD.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IER_Register use record
      EOAIE         at 0 range 0 .. 0;
      MCEIE         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype ICR_EOAIC_Field is STM32_SVD.Bit;
   subtype ICR_MCEIC_Field is STM32_SVD.Bit;

   --  interrupt clear register
   type ICR_Register is record
      --  End of acquisition interrupt clear
      EOAIC         : ICR_EOAIC_Field := 16#0#;
      --  Max count error interrupt clear
      MCEIC         : ICR_MCEIC_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : STM32_SVD.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      EOAIC         at 0 range 0 .. 0;
      MCEIC         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype ISR_EOAF_Field is STM32_SVD.Bit;
   subtype ISR_MCEF_Field is STM32_SVD.Bit;

   --  interrupt status register
   type ISR_Register is record
      --  End of acquisition flag
      EOAF          : ISR_EOAF_Field := 16#0#;
      --  Max count error flag
      MCEF          : ISR_MCEF_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : STM32_SVD.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      EOAF          at 0 range 0 .. 0;
      MCEF          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  IOHCR_G1_IO array element
   subtype IOHCR_G1_IO_Element is STM32_SVD.Bit;

   --  IOHCR_G1_IO array
   type IOHCR_G1_IO_Field_Array is array (1 .. 4) of IOHCR_G1_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOHCR_G1_IO
   type IOHCR_G1_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G1_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G1_IO as an array
            Arr : IOHCR_G1_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOHCR_G1_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOHCR_G2_IO array element
   subtype IOHCR_G2_IO_Element is STM32_SVD.Bit;

   --  IOHCR_G2_IO array
   type IOHCR_G2_IO_Field_Array is array (1 .. 4) of IOHCR_G2_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOHCR_G2_IO
   type IOHCR_G2_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G2_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G2_IO as an array
            Arr : IOHCR_G2_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOHCR_G2_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOHCR_G3_IO array element
   subtype IOHCR_G3_IO_Element is STM32_SVD.Bit;

   --  IOHCR_G3_IO array
   type IOHCR_G3_IO_Field_Array is array (1 .. 4) of IOHCR_G3_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOHCR_G3_IO
   type IOHCR_G3_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G3_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G3_IO as an array
            Arr : IOHCR_G3_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOHCR_G3_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOHCR_G4_IO array element
   subtype IOHCR_G4_IO_Element is STM32_SVD.Bit;

   --  IOHCR_G4_IO array
   type IOHCR_G4_IO_Field_Array is array (1 .. 4) of IOHCR_G4_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOHCR_G4_IO
   type IOHCR_G4_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G4_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G4_IO as an array
            Arr : IOHCR_G4_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOHCR_G4_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOHCR_G5_IO array element
   subtype IOHCR_G5_IO_Element is STM32_SVD.Bit;

   --  IOHCR_G5_IO array
   type IOHCR_G5_IO_Field_Array is array (1 .. 4) of IOHCR_G5_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOHCR_G5_IO
   type IOHCR_G5_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G5_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G5_IO as an array
            Arr : IOHCR_G5_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOHCR_G5_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOHCR_G6_IO array element
   subtype IOHCR_G6_IO_Element is STM32_SVD.Bit;

   --  IOHCR_G6_IO array
   type IOHCR_G6_IO_Field_Array is array (1 .. 4) of IOHCR_G6_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOHCR_G6_IO
   type IOHCR_G6_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G6_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G6_IO as an array
            Arr : IOHCR_G6_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOHCR_G6_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOHCR_G7_IO array element
   subtype IOHCR_G7_IO_Element is STM32_SVD.Bit;

   --  IOHCR_G7_IO array
   type IOHCR_G7_IO_Field_Array is array (1 .. 4) of IOHCR_G7_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOHCR_G7_IO
   type IOHCR_G7_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G7_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G7_IO as an array
            Arr : IOHCR_G7_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOHCR_G7_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOHCR_G8_IO array element
   subtype IOHCR_G8_IO_Element is STM32_SVD.Bit;

   --  IOHCR_G8_IO array
   type IOHCR_G8_IO_Field_Array is array (1 .. 4) of IOHCR_G8_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOHCR_G8_IO
   type IOHCR_G8_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G8_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G8_IO as an array
            Arr : IOHCR_G8_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOHCR_G8_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  I/O hysteresis control register
   type IOHCR_Register is record
      --  G1_IO1
      G1_IO : IOHCR_G1_IO_Field := (As_Array => False, Val => 16#1#);
      --  G2_IO1
      G2_IO : IOHCR_G2_IO_Field := (As_Array => False, Val => 16#1#);
      --  G3_IO1
      G3_IO : IOHCR_G3_IO_Field := (As_Array => False, Val => 16#1#);
      --  G4_IO1
      G4_IO : IOHCR_G4_IO_Field := (As_Array => False, Val => 16#1#);
      --  G5_IO1
      G5_IO : IOHCR_G5_IO_Field := (As_Array => False, Val => 16#1#);
      --  G6_IO1
      G6_IO : IOHCR_G6_IO_Field := (As_Array => False, Val => 16#1#);
      --  G7_IO1
      G7_IO : IOHCR_G7_IO_Field := (As_Array => False, Val => 16#1#);
      --  G8_IO1
      G8_IO : IOHCR_G8_IO_Field := (As_Array => False, Val => 16#1#);
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOHCR_Register use record
      G1_IO at 0 range 0 .. 3;
      G2_IO at 0 range 4 .. 7;
      G3_IO at 0 range 8 .. 11;
      G4_IO at 0 range 12 .. 15;
      G5_IO at 0 range 16 .. 19;
      G6_IO at 0 range 20 .. 23;
      G7_IO at 0 range 24 .. 27;
      G8_IO at 0 range 28 .. 31;
   end record;

   --  IOASCR_G1_IO array element
   subtype IOASCR_G1_IO_Element is STM32_SVD.Bit;

   --  IOASCR_G1_IO array
   type IOASCR_G1_IO_Field_Array is array (1 .. 4) of IOASCR_G1_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOASCR_G1_IO
   type IOASCR_G1_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G1_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G1_IO as an array
            Arr : IOASCR_G1_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOASCR_G1_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOASCR_G2_IO array element
   subtype IOASCR_G2_IO_Element is STM32_SVD.Bit;

   --  IOASCR_G2_IO array
   type IOASCR_G2_IO_Field_Array is array (1 .. 4) of IOASCR_G2_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOASCR_G2_IO
   type IOASCR_G2_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G2_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G2_IO as an array
            Arr : IOASCR_G2_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOASCR_G2_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOASCR_G3_IO array element
   subtype IOASCR_G3_IO_Element is STM32_SVD.Bit;

   --  IOASCR_G3_IO array
   type IOASCR_G3_IO_Field_Array is array (1 .. 4) of IOASCR_G3_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOASCR_G3_IO
   type IOASCR_G3_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G3_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G3_IO as an array
            Arr : IOASCR_G3_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOASCR_G3_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOASCR_G4_IO array element
   subtype IOASCR_G4_IO_Element is STM32_SVD.Bit;

   --  IOASCR_G4_IO array
   type IOASCR_G4_IO_Field_Array is array (1 .. 4) of IOASCR_G4_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOASCR_G4_IO
   type IOASCR_G4_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G4_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G4_IO as an array
            Arr : IOASCR_G4_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOASCR_G4_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOASCR_G5_IO array element
   subtype IOASCR_G5_IO_Element is STM32_SVD.Bit;

   --  IOASCR_G5_IO array
   type IOASCR_G5_IO_Field_Array is array (1 .. 4) of IOASCR_G5_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOASCR_G5_IO
   type IOASCR_G5_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G5_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G5_IO as an array
            Arr : IOASCR_G5_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOASCR_G5_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOASCR_G6_IO array element
   subtype IOASCR_G6_IO_Element is STM32_SVD.Bit;

   --  IOASCR_G6_IO array
   type IOASCR_G6_IO_Field_Array is array (1 .. 4) of IOASCR_G6_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOASCR_G6_IO
   type IOASCR_G6_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G6_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G6_IO as an array
            Arr : IOASCR_G6_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOASCR_G6_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOASCR_G7_IO array element
   subtype IOASCR_G7_IO_Element is STM32_SVD.Bit;

   --  IOASCR_G7_IO array
   type IOASCR_G7_IO_Field_Array is array (1 .. 4) of IOASCR_G7_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOASCR_G7_IO
   type IOASCR_G7_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G7_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G7_IO as an array
            Arr : IOASCR_G7_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOASCR_G7_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOASCR_G8_IO array element
   subtype IOASCR_G8_IO_Element is STM32_SVD.Bit;

   --  IOASCR_G8_IO array
   type IOASCR_G8_IO_Field_Array is array (1 .. 4) of IOASCR_G8_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOASCR_G8_IO
   type IOASCR_G8_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G8_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G8_IO as an array
            Arr : IOASCR_G8_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOASCR_G8_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  I/O analog switch control register
   type IOASCR_Register is record
      --  G1_IO1
      G1_IO : IOASCR_G1_IO_Field := (As_Array => False, Val => 16#0#);
      --  G2_IO1
      G2_IO : IOASCR_G2_IO_Field := (As_Array => False, Val => 16#0#);
      --  G3_IO1
      G3_IO : IOASCR_G3_IO_Field := (As_Array => False, Val => 16#0#);
      --  G4_IO1
      G4_IO : IOASCR_G4_IO_Field := (As_Array => False, Val => 16#0#);
      --  G5_IO1
      G5_IO : IOASCR_G5_IO_Field := (As_Array => False, Val => 16#0#);
      --  G6_IO1
      G6_IO : IOASCR_G6_IO_Field := (As_Array => False, Val => 16#0#);
      --  G7_IO1
      G7_IO : IOASCR_G7_IO_Field := (As_Array => False, Val => 16#0#);
      --  G8_IO1
      G8_IO : IOASCR_G8_IO_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOASCR_Register use record
      G1_IO at 0 range 0 .. 3;
      G2_IO at 0 range 4 .. 7;
      G3_IO at 0 range 8 .. 11;
      G4_IO at 0 range 12 .. 15;
      G5_IO at 0 range 16 .. 19;
      G6_IO at 0 range 20 .. 23;
      G7_IO at 0 range 24 .. 27;
      G8_IO at 0 range 28 .. 31;
   end record;

   --  IOSCR_G1_IO array element
   subtype IOSCR_G1_IO_Element is STM32_SVD.Bit;

   --  IOSCR_G1_IO array
   type IOSCR_G1_IO_Field_Array is array (1 .. 4) of IOSCR_G1_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOSCR_G1_IO
   type IOSCR_G1_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G1_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G1_IO as an array
            Arr : IOSCR_G1_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOSCR_G1_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOSCR_G2_IO array element
   subtype IOSCR_G2_IO_Element is STM32_SVD.Bit;

   --  IOSCR_G2_IO array
   type IOSCR_G2_IO_Field_Array is array (1 .. 4) of IOSCR_G2_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOSCR_G2_IO
   type IOSCR_G2_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G2_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G2_IO as an array
            Arr : IOSCR_G2_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOSCR_G2_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOSCR_G3_IO array element
   subtype IOSCR_G3_IO_Element is STM32_SVD.Bit;

   --  IOSCR_G3_IO array
   type IOSCR_G3_IO_Field_Array is array (1 .. 4) of IOSCR_G3_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOSCR_G3_IO
   type IOSCR_G3_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G3_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G3_IO as an array
            Arr : IOSCR_G3_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOSCR_G3_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOSCR_G4_IO array element
   subtype IOSCR_G4_IO_Element is STM32_SVD.Bit;

   --  IOSCR_G4_IO array
   type IOSCR_G4_IO_Field_Array is array (1 .. 4) of IOSCR_G4_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOSCR_G4_IO
   type IOSCR_G4_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G4_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G4_IO as an array
            Arr : IOSCR_G4_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOSCR_G4_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOSCR_G5_IO array element
   subtype IOSCR_G5_IO_Element is STM32_SVD.Bit;

   --  IOSCR_G5_IO array
   type IOSCR_G5_IO_Field_Array is array (1 .. 4) of IOSCR_G5_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOSCR_G5_IO
   type IOSCR_G5_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G5_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G5_IO as an array
            Arr : IOSCR_G5_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOSCR_G5_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOSCR_G6_IO array element
   subtype IOSCR_G6_IO_Element is STM32_SVD.Bit;

   --  IOSCR_G6_IO array
   type IOSCR_G6_IO_Field_Array is array (1 .. 4) of IOSCR_G6_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOSCR_G6_IO
   type IOSCR_G6_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G6_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G6_IO as an array
            Arr : IOSCR_G6_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOSCR_G6_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOSCR_G7_IO array element
   subtype IOSCR_G7_IO_Element is STM32_SVD.Bit;

   --  IOSCR_G7_IO array
   type IOSCR_G7_IO_Field_Array is array (1 .. 4) of IOSCR_G7_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOSCR_G7_IO
   type IOSCR_G7_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G7_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G7_IO as an array
            Arr : IOSCR_G7_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOSCR_G7_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOSCR_G8_IO array element
   subtype IOSCR_G8_IO_Element is STM32_SVD.Bit;

   --  IOSCR_G8_IO array
   type IOSCR_G8_IO_Field_Array is array (1 .. 4) of IOSCR_G8_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOSCR_G8_IO
   type IOSCR_G8_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G8_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G8_IO as an array
            Arr : IOSCR_G8_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOSCR_G8_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  I/O sampling control register
   type IOSCR_Register is record
      --  G1_IO1
      G1_IO : IOSCR_G1_IO_Field := (As_Array => False, Val => 16#0#);
      --  G2_IO1
      G2_IO : IOSCR_G2_IO_Field := (As_Array => False, Val => 16#0#);
      --  G3_IO1
      G3_IO : IOSCR_G3_IO_Field := (As_Array => False, Val => 16#0#);
      --  G4_IO1
      G4_IO : IOSCR_G4_IO_Field := (As_Array => False, Val => 16#0#);
      --  G5_IO1
      G5_IO : IOSCR_G5_IO_Field := (As_Array => False, Val => 16#0#);
      --  G6_IO1
      G6_IO : IOSCR_G6_IO_Field := (As_Array => False, Val => 16#0#);
      --  G7_IO1
      G7_IO : IOSCR_G7_IO_Field := (As_Array => False, Val => 16#0#);
      --  G8_IO1
      G8_IO : IOSCR_G8_IO_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOSCR_Register use record
      G1_IO at 0 range 0 .. 3;
      G2_IO at 0 range 4 .. 7;
      G3_IO at 0 range 8 .. 11;
      G4_IO at 0 range 12 .. 15;
      G5_IO at 0 range 16 .. 19;
      G6_IO at 0 range 20 .. 23;
      G7_IO at 0 range 24 .. 27;
      G8_IO at 0 range 28 .. 31;
   end record;

   --  IOCCR_G1_IO array element
   subtype IOCCR_G1_IO_Element is STM32_SVD.Bit;

   --  IOCCR_G1_IO array
   type IOCCR_G1_IO_Field_Array is array (1 .. 4) of IOCCR_G1_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOCCR_G1_IO
   type IOCCR_G1_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G1_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G1_IO as an array
            Arr : IOCCR_G1_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOCCR_G1_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOCCR_G2_IO array element
   subtype IOCCR_G2_IO_Element is STM32_SVD.Bit;

   --  IOCCR_G2_IO array
   type IOCCR_G2_IO_Field_Array is array (1 .. 4) of IOCCR_G2_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOCCR_G2_IO
   type IOCCR_G2_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G2_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G2_IO as an array
            Arr : IOCCR_G2_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOCCR_G2_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOCCR_G3_IO array element
   subtype IOCCR_G3_IO_Element is STM32_SVD.Bit;

   --  IOCCR_G3_IO array
   type IOCCR_G3_IO_Field_Array is array (1 .. 4) of IOCCR_G3_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOCCR_G3_IO
   type IOCCR_G3_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G3_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G3_IO as an array
            Arr : IOCCR_G3_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOCCR_G3_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOCCR_G4_IO array element
   subtype IOCCR_G4_IO_Element is STM32_SVD.Bit;

   --  IOCCR_G4_IO array
   type IOCCR_G4_IO_Field_Array is array (1 .. 4) of IOCCR_G4_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOCCR_G4_IO
   type IOCCR_G4_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G4_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G4_IO as an array
            Arr : IOCCR_G4_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOCCR_G4_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOCCR_G5_IO array element
   subtype IOCCR_G5_IO_Element is STM32_SVD.Bit;

   --  IOCCR_G5_IO array
   type IOCCR_G5_IO_Field_Array is array (1 .. 4) of IOCCR_G5_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOCCR_G5_IO
   type IOCCR_G5_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G5_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G5_IO as an array
            Arr : IOCCR_G5_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOCCR_G5_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOCCR_G6_IO array element
   subtype IOCCR_G6_IO_Element is STM32_SVD.Bit;

   --  IOCCR_G6_IO array
   type IOCCR_G6_IO_Field_Array is array (1 .. 4) of IOCCR_G6_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOCCR_G6_IO
   type IOCCR_G6_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G6_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G6_IO as an array
            Arr : IOCCR_G6_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOCCR_G6_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOCCR_G7_IO array element
   subtype IOCCR_G7_IO_Element is STM32_SVD.Bit;

   --  IOCCR_G7_IO array
   type IOCCR_G7_IO_Field_Array is array (1 .. 4) of IOCCR_G7_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOCCR_G7_IO
   type IOCCR_G7_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G7_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G7_IO as an array
            Arr : IOCCR_G7_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOCCR_G7_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  IOCCR_G8_IO array element
   subtype IOCCR_G8_IO_Element is STM32_SVD.Bit;

   --  IOCCR_G8_IO array
   type IOCCR_G8_IO_Field_Array is array (1 .. 4) of IOCCR_G8_IO_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for IOCCR_G8_IO
   type IOCCR_G8_IO_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  G8_IO as a value
            Val : STM32_SVD.UInt4;
         when True =>
            --  G8_IO as an array
            Arr : IOCCR_G8_IO_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for IOCCR_G8_IO_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  I/O channel control register
   type IOCCR_Register is record
      --  G1_IO1
      G1_IO : IOCCR_G1_IO_Field := (As_Array => False, Val => 16#0#);
      --  G2_IO1
      G2_IO : IOCCR_G2_IO_Field := (As_Array => False, Val => 16#0#);
      --  G3_IO1
      G3_IO : IOCCR_G3_IO_Field := (As_Array => False, Val => 16#0#);
      --  G4_IO1
      G4_IO : IOCCR_G4_IO_Field := (As_Array => False, Val => 16#0#);
      --  G5_IO1
      G5_IO : IOCCR_G5_IO_Field := (As_Array => False, Val => 16#0#);
      --  G6_IO1
      G6_IO : IOCCR_G6_IO_Field := (As_Array => False, Val => 16#0#);
      --  G7_IO1
      G7_IO : IOCCR_G7_IO_Field := (As_Array => False, Val => 16#0#);
      --  G8_IO1
      G8_IO : IOCCR_G8_IO_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOCCR_Register use record
      G1_IO at 0 range 0 .. 3;
      G2_IO at 0 range 4 .. 7;
      G3_IO at 0 range 8 .. 11;
      G4_IO at 0 range 12 .. 15;
      G5_IO at 0 range 16 .. 19;
      G6_IO at 0 range 20 .. 23;
      G7_IO at 0 range 24 .. 27;
      G8_IO at 0 range 28 .. 31;
   end record;

   subtype IOGCSR_G1E_Field is STM32_SVD.Bit;
   subtype IOGCSR_G2E_Field is STM32_SVD.Bit;
   subtype IOGCSR_G3E_Field is STM32_SVD.Bit;
   subtype IOGCSR_G4E_Field is STM32_SVD.Bit;
   subtype IOGCSR_G5E_Field is STM32_SVD.Bit;
   subtype IOGCSR_G6E_Field is STM32_SVD.Bit;
   subtype IOGCSR_G7E_Field is STM32_SVD.Bit;
   subtype IOGCSR_G8E_Field is STM32_SVD.Bit;
   subtype IOGCSR_G1S_Field is STM32_SVD.Bit;
   subtype IOGCSR_G2S_Field is STM32_SVD.Bit;
   subtype IOGCSR_G3S_Field is STM32_SVD.Bit;
   subtype IOGCSR_G4S_Field is STM32_SVD.Bit;
   subtype IOGCSR_G5S_Field is STM32_SVD.Bit;
   subtype IOGCSR_G6S_Field is STM32_SVD.Bit;
   subtype IOGCSR_G7S_Field is STM32_SVD.Bit;
   subtype IOGCSR_G8S_Field is STM32_SVD.Bit;

   --  I/O group control status register
   type IOGCSR_Register is record
      --  Analog I/O group x enable
      G1E            : IOGCSR_G1E_Field := 16#0#;
      --  Analog I/O group x enable
      G2E            : IOGCSR_G2E_Field := 16#0#;
      --  Analog I/O group x enable
      G3E            : IOGCSR_G3E_Field := 16#0#;
      --  Analog I/O group x enable
      G4E            : IOGCSR_G4E_Field := 16#0#;
      --  Analog I/O group x enable
      G5E            : IOGCSR_G5E_Field := 16#0#;
      --  Analog I/O group x enable
      G6E            : IOGCSR_G6E_Field := 16#0#;
      --  Analog I/O group x enable
      G7E            : IOGCSR_G7E_Field := 16#0#;
      --  Analog I/O group x enable
      G8E            : IOGCSR_G8E_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : STM32_SVD.Byte := 16#0#;
      --  Read-only. Analog I/O group x status
      G1S            : IOGCSR_G1S_Field := 16#0#;
      --  Read-only. Analog I/O group x status
      G2S            : IOGCSR_G2S_Field := 16#0#;
      --  Read-only. Analog I/O group x status
      G3S            : IOGCSR_G3S_Field := 16#0#;
      --  Read-only. Analog I/O group x status
      G4S            : IOGCSR_G4S_Field := 16#0#;
      --  Read-only. Analog I/O group x status
      G5S            : IOGCSR_G5S_Field := 16#0#;
      --  Read-only. Analog I/O group x status
      G6S            : IOGCSR_G6S_Field := 16#0#;
      --  Read-only. Analog I/O group x status
      G7S            : IOGCSR_G7S_Field := 16#0#;
      --  Read-only. Analog I/O group x status
      G8S            : IOGCSR_G8S_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : STM32_SVD.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOGCSR_Register use record
      G1E            at 0 range 0 .. 0;
      G2E            at 0 range 1 .. 1;
      G3E            at 0 range 2 .. 2;
      G4E            at 0 range 3 .. 3;
      G5E            at 0 range 4 .. 4;
      G6E            at 0 range 5 .. 5;
      G7E            at 0 range 6 .. 6;
      G8E            at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      G1S            at 0 range 16 .. 16;
      G2S            at 0 range 17 .. 17;
      G3S            at 0 range 18 .. 18;
      G4S            at 0 range 19 .. 19;
      G5S            at 0 range 20 .. 20;
      G6S            at 0 range 21 .. 21;
      G7S            at 0 range 22 .. 22;
      G8S            at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype IOG1CR_CNT_Field is STM32_SVD.UInt14;

   --  I/O group x counter register
   type IOG1CR_Register is record
      --  Read-only. Counter value
      CNT            : IOG1CR_CNT_Field;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOG1CR_Register use record
      CNT            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype IOG2CR_CNT_Field is STM32_SVD.UInt14;

   --  I/O group x counter register
   type IOG2CR_Register is record
      --  Read-only. Counter value
      CNT            : IOG2CR_CNT_Field;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOG2CR_Register use record
      CNT            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype IOG3CR_CNT_Field is STM32_SVD.UInt14;

   --  I/O group x counter register
   type IOG3CR_Register is record
      --  Read-only. Counter value
      CNT            : IOG3CR_CNT_Field;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOG3CR_Register use record
      CNT            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype IOG4CR_CNT_Field is STM32_SVD.UInt14;

   --  I/O group x counter register
   type IOG4CR_Register is record
      --  Read-only. Counter value
      CNT            : IOG4CR_CNT_Field;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOG4CR_Register use record
      CNT            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype IOG5CR_CNT_Field is STM32_SVD.UInt14;

   --  I/O group x counter register
   type IOG5CR_Register is record
      --  Read-only. Counter value
      CNT            : IOG5CR_CNT_Field;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOG5CR_Register use record
      CNT            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype IOG6CR_CNT_Field is STM32_SVD.UInt14;

   --  I/O group x counter register
   type IOG6CR_Register is record
      --  Read-only. Counter value
      CNT            : IOG6CR_CNT_Field;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOG6CR_Register use record
      CNT            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype IOG7CR_CNT_Field is STM32_SVD.UInt14;

   --  I/O group x counter register
   type IOG7CR_Register is record
      --  Read-only. Counter value
      CNT            : IOG7CR_CNT_Field;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOG7CR_Register use record
      CNT            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype IOG8CR_CNT_Field is STM32_SVD.UInt14;

   --  I/O group x counter register
   type IOG8CR_Register is record
      --  Read-only. Counter value
      CNT            : IOG8CR_CNT_Field;
      --  unspecified
      Reserved_14_31 : STM32_SVD.UInt18;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IOG8CR_Register use record
      CNT            at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Touch sensing controller
   type TSC_Peripheral is record
      --  control register
      CR     : aliased CR_Register;
      --  interrupt enable register
      IER    : aliased IER_Register;
      --  interrupt clear register
      ICR    : aliased ICR_Register;
      --  interrupt status register
      ISR    : aliased ISR_Register;
      --  I/O hysteresis control register
      IOHCR  : aliased IOHCR_Register;
      --  I/O analog switch control register
      IOASCR : aliased IOASCR_Register;
      --  I/O sampling control register
      IOSCR  : aliased IOSCR_Register;
      --  I/O channel control register
      IOCCR  : aliased IOCCR_Register;
      --  I/O group control status register
      IOGCSR : aliased IOGCSR_Register;
      --  I/O group x counter register
      IOG1CR : aliased IOG1CR_Register;
      --  I/O group x counter register
      IOG2CR : aliased IOG2CR_Register;
      --  I/O group x counter register
      IOG3CR : aliased IOG3CR_Register;
      --  I/O group x counter register
      IOG4CR : aliased IOG4CR_Register;
      --  I/O group x counter register
      IOG5CR : aliased IOG5CR_Register;
      --  I/O group x counter register
      IOG6CR : aliased IOG6CR_Register;
      --  I/O group x counter register
      IOG7CR : aliased IOG7CR_Register;
      --  I/O group x counter register
      IOG8CR : aliased IOG8CR_Register;
   end record
     with Volatile;

   for TSC_Peripheral use record
      CR     at 16#0# range 0 .. 31;
      IER    at 16#4# range 0 .. 31;
      ICR    at 16#8# range 0 .. 31;
      ISR    at 16#C# range 0 .. 31;
      IOHCR  at 16#10# range 0 .. 31;
      IOASCR at 16#18# range 0 .. 31;
      IOSCR  at 16#20# range 0 .. 31;
      IOCCR  at 16#28# range 0 .. 31;
      IOGCSR at 16#30# range 0 .. 31;
      IOG1CR at 16#34# range 0 .. 31;
      IOG2CR at 16#38# range 0 .. 31;
      IOG3CR at 16#3C# range 0 .. 31;
      IOG4CR at 16#40# range 0 .. 31;
      IOG5CR at 16#44# range 0 .. 31;
      IOG6CR at 16#48# range 0 .. 31;
      IOG7CR at 16#4C# range 0 .. 31;
      IOG8CR at 16#50# range 0 .. 31;
   end record;

   --  Touch sensing controller
   TSC_Periph : aliased TSC_Peripheral
     with Import, Address => TSC_Base;

end STM32_SVD.TSC;
