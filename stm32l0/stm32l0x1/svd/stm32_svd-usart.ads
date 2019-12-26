--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.USART is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  CR1_DEDT array
   type CR1_DEDT_Field_Array is array (0 .. 4) of STM32_SVD.Bit
     with Component_Size => 1, Size => 5;

   --  Type definition for CR1_DEDT
   type CR1_DEDT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DEDT as a value
            Val : STM32_SVD.UInt5;
         when True =>
            --  DEDT as an array
            Arr : CR1_DEDT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for CR1_DEDT_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  CR1_DEAT array
   type CR1_DEAT_Field_Array is array (0 .. 4) of STM32_SVD.Bit
     with Component_Size => 1, Size => 5;

   --  Type definition for CR1_DEAT
   type CR1_DEAT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  DEAT as a value
            Val : STM32_SVD.UInt5;
         when True =>
            --  DEAT as an array
            Arr : CR1_DEAT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for CR1_DEAT_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   --  Control register 1
   type CR1_Register is record
      --  USART enable
      UE             : STM32_SVD.Bit;
      --  USART enable in Stop mode
      UESM           : STM32_SVD.Bit;
      --  Receiver enable
      RE             : STM32_SVD.Bit;
      --  Transmitter enable
      TE             : STM32_SVD.Bit;
      --  IDLE interrupt enable
      IDLEIE         : STM32_SVD.Bit;
      --  RXNE interrupt enable
      RXNEIE         : STM32_SVD.Bit;
      --  Transmission complete interrupt enable
      TCIE           : STM32_SVD.Bit;
      --  interrupt enable
      TXEIE          : STM32_SVD.Bit;
      --  PE interrupt enable
      PEIE           : STM32_SVD.Bit;
      --  Parity selection
      PS             : STM32_SVD.Bit;
      --  Parity control enable
      PCE            : STM32_SVD.Bit;
      --  Receiver wakeup method
      WAKE           : STM32_SVD.Bit;
      --  Word length
      M0             : STM32_SVD.Bit;
      --  Mute mode enable
      MME            : STM32_SVD.Bit;
      --  Character match interrupt enable
      CMIE           : STM32_SVD.Bit;
      --  unspecified
      Reserved_15_15 : STM32_SVD.Bit;
      --  DEDT0
      DEDT           : CR1_DEDT_Field;
      --  DEAT0
      DEAT           : CR1_DEAT_Field;
      --  unspecified
      Reserved_26_27 : STM32_SVD.UInt2;
      --  Word length
      M1             : STM32_SVD.Bit;
      --  unspecified
      Reserved_29_31 : STM32_SVD.UInt3;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      UE             at 0 range 0 .. 0;
      UESM           at 0 range 1 .. 1;
      RE             at 0 range 2 .. 2;
      TE             at 0 range 3 .. 3;
      IDLEIE         at 0 range 4 .. 4;
      RXNEIE         at 0 range 5 .. 5;
      TCIE           at 0 range 6 .. 6;
      TXEIE          at 0 range 7 .. 7;
      PEIE           at 0 range 8 .. 8;
      PS             at 0 range 9 .. 9;
      PCE            at 0 range 10 .. 10;
      WAKE           at 0 range 11 .. 11;
      M0             at 0 range 12 .. 12;
      MME            at 0 range 13 .. 13;
      CMIE           at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      DEDT           at 0 range 16 .. 20;
      DEAT           at 0 range 21 .. 25;
      Reserved_26_27 at 0 range 26 .. 27;
      M1             at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  Control register 2
   type CR2_Register is record
      --  unspecified
      Reserved_0_3   : STM32_SVD.UInt4;
      --  7-bit Address Detection/4-bit Address Detection
      ADDM7          : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_10  : STM32_SVD.UInt6;
      --  Clock enable
      CLKEN          : STM32_SVD.Bit;
      --  STOP bits
      STOP           : STM32_SVD.UInt2;
      --  unspecified
      Reserved_14_14 : STM32_SVD.Bit;
      --  Swap TX/RX pins
      SWAP           : STM32_SVD.Bit;
      --  RX pin active level inversion
      RXINV          : STM32_SVD.Bit;
      --  TX pin active level inversion
      TXINV          : STM32_SVD.Bit;
      --  Binary data inversion
      TAINV          : STM32_SVD.Bit;
      --  Most significant bit first
      MSBFIRST       : STM32_SVD.Bit;
      --  unspecified
      Reserved_20_23 : STM32_SVD.UInt4;
      --  Address of the USART node
      ADD0_3         : STM32_SVD.UInt4;
      --  Address of the USART node
      ADD4_7         : STM32_SVD.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      ADDM7          at 0 range 4 .. 4;
      Reserved_5_10  at 0 range 5 .. 10;
      CLKEN          at 0 range 11 .. 11;
      STOP           at 0 range 12 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      SWAP           at 0 range 15 .. 15;
      RXINV          at 0 range 16 .. 16;
      TXINV          at 0 range 17 .. 17;
      TAINV          at 0 range 18 .. 18;
      MSBFIRST       at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      ADD0_3         at 0 range 24 .. 27;
      ADD4_7         at 0 range 28 .. 31;
   end record;

   --  Control register 3
   type CR3_Register is record
      --  Error interrupt enable
      EIE            : STM32_SVD.Bit;
      --  unspecified
      Reserved_1_2   : STM32_SVD.UInt2;
      --  Half-duplex selection
      HDSEL          : STM32_SVD.Bit;
      --  unspecified
      Reserved_4_5   : STM32_SVD.UInt2;
      --  DMA enable receiver
      DMAR           : STM32_SVD.Bit;
      --  DMA enable transmitter
      DMAT           : STM32_SVD.Bit;
      --  RTS enable
      RTSE           : STM32_SVD.Bit;
      --  CTS enable
      CTSE           : STM32_SVD.Bit;
      --  CTS interrupt enable
      CTSIE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_11_11 : STM32_SVD.Bit;
      --  Overrun Disable
      OVRDIS         : STM32_SVD.Bit;
      --  DMA Disable on Reception Error
      DDRE           : STM32_SVD.Bit;
      --  Driver enable mode
      DEM            : STM32_SVD.Bit;
      --  Driver enable polarity selection
      DEP            : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_19 : STM32_SVD.UInt4;
      --  Wakeup from Stop mode interrupt flag selection
      WUS            : STM32_SVD.UInt2;
      --  Wakeup from Stop mode interrupt enable
      WUFIE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR3_Register use record
      EIE            at 0 range 0 .. 0;
      Reserved_1_2   at 0 range 1 .. 2;
      HDSEL          at 0 range 3 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      DMAR           at 0 range 6 .. 6;
      DMAT           at 0 range 7 .. 7;
      RTSE           at 0 range 8 .. 8;
      CTSE           at 0 range 9 .. 9;
      CTSIE          at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      OVRDIS         at 0 range 12 .. 12;
      DDRE           at 0 range 13 .. 13;
      DEM            at 0 range 14 .. 14;
      DEP            at 0 range 15 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      WUS            at 0 range 20 .. 21;
      WUFIE          at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  Baud rate register
   type BRR_Register is record
      --  BRR
      BRR            : STM32_SVD.UInt20;
      --  unspecified
      Reserved_20_31 : STM32_SVD.UInt12;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BRR_Register use record
      BRR            at 0 range 0 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  Request register
   type RQR_Register is record
      --  unspecified
      Reserved_0_0  : STM32_SVD.Bit;
      --  Write-only. Send break request
      SBKRQ         : STM32_SVD.Bit;
      --  Write-only. Mute mode request
      MMRQ          : STM32_SVD.Bit;
      --  Write-only. Receive data flush request
      RXFRQ         : STM32_SVD.Bit;
      --  unspecified
      Reserved_4_31 : STM32_SVD.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RQR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      SBKRQ         at 0 range 1 .. 1;
      MMRQ          at 0 range 2 .. 2;
      RXFRQ         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  Interrupt & status register
   type ISR_Register is record
      --  Read-only. PE
      PE             : STM32_SVD.Bit;
      --  Read-only. FE
      FE             : STM32_SVD.Bit;
      --  Read-only. NF
      NF             : STM32_SVD.Bit;
      --  Read-only. ORE
      ORE            : STM32_SVD.Bit;
      --  Read-only. IDLE
      IDLE           : STM32_SVD.Bit;
      --  Read-only. RXNE
      RXNE           : STM32_SVD.Bit;
      --  Read-only. TC
      TC             : STM32_SVD.Bit;
      --  Read-only. TXE
      TXE            : STM32_SVD.Bit;
      --  unspecified
      Reserved_8_8   : STM32_SVD.Bit;
      --  Read-only. CTSIF
      CTSIF          : STM32_SVD.Bit;
      --  Read-only. CTS
      CTS            : STM32_SVD.Bit;
      --  unspecified
      Reserved_11_15 : STM32_SVD.UInt5;
      --  Read-only. BUSY
      BUSY           : STM32_SVD.Bit;
      --  Read-only. CMF
      CMF            : STM32_SVD.Bit;
      --  Read-only. SBKF
      SBKF           : STM32_SVD.Bit;
      --  Read-only. RWU
      RWU            : STM32_SVD.Bit;
      --  Read-only. WUF
      WUF            : STM32_SVD.Bit;
      --  Read-only. TEACK
      TEACK          : STM32_SVD.Bit;
      --  Read-only. REACK
      REACK          : STM32_SVD.Bit;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      PE             at 0 range 0 .. 0;
      FE             at 0 range 1 .. 1;
      NF             at 0 range 2 .. 2;
      ORE            at 0 range 3 .. 3;
      IDLE           at 0 range 4 .. 4;
      RXNE           at 0 range 5 .. 5;
      TC             at 0 range 6 .. 6;
      TXE            at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      CTSIF          at 0 range 9 .. 9;
      CTS            at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      BUSY           at 0 range 16 .. 16;
      CMF            at 0 range 17 .. 17;
      SBKF           at 0 range 18 .. 18;
      RWU            at 0 range 19 .. 19;
      WUF            at 0 range 20 .. 20;
      TEACK          at 0 range 21 .. 21;
      REACK          at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  Interrupt flag clear register
   type ICR_Register is record
      --  Write-only. Parity error clear flag
      PECF           : STM32_SVD.Bit;
      --  Write-only. Framing error clear flag
      FECF           : STM32_SVD.Bit;
      --  Write-only. Noise detected clear flag
      NCF            : STM32_SVD.Bit;
      --  Write-only. Overrun error clear flag
      ORECF          : STM32_SVD.Bit;
      --  Write-only. Idle line detected clear flag
      IDLECF         : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_5   : STM32_SVD.Bit;
      --  Write-only. Transmission complete clear flag
      TCCF           : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_8   : STM32_SVD.UInt2;
      --  Write-only. CTS clear flag
      CTSCF          : STM32_SVD.Bit;
      --  unspecified
      Reserved_10_16 : STM32_SVD.UInt7;
      --  Write-only. Character match clear flag
      CMCF           : STM32_SVD.Bit;
      --  unspecified
      Reserved_18_19 : STM32_SVD.UInt2;
      --  Write-only. Wakeup from Stop mode clear flag
      WUCF           : STM32_SVD.Bit;
      --  unspecified
      Reserved_21_31 : STM32_SVD.UInt11;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      PECF           at 0 range 0 .. 0;
      FECF           at 0 range 1 .. 1;
      NCF            at 0 range 2 .. 2;
      ORECF          at 0 range 3 .. 3;
      IDLECF         at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TCCF           at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      CTSCF          at 0 range 9 .. 9;
      Reserved_10_16 at 0 range 10 .. 16;
      CMCF           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      WUCF           at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   --  Receive data register
   type RDR_Register is record
      --  Read-only. Receive data value
      RDR           : STM32_SVD.UInt9;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RDR_Register use record
      RDR           at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Transmit data register
   type TDR_Register is record
      --  Transmit data value
      TDR           : STM32_SVD.UInt9;
      --  unspecified
      Reserved_9_31 : STM32_SVD.UInt23;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TDR_Register use record
      TDR           at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  Control register 1
   type CR1_Register_1 is record
      --  USART enable
      UE             : STM32_SVD.Bit;
      --  USART enable in Stop mode
      UESM           : STM32_SVD.Bit;
      --  Receiver enable
      RE             : STM32_SVD.Bit;
      --  Transmitter enable
      TE             : STM32_SVD.Bit;
      --  IDLE interrupt enable
      IDLEIE         : STM32_SVD.Bit;
      --  RXNE interrupt enable
      RXNEIE         : STM32_SVD.Bit;
      --  Transmission complete interrupt enable
      TCIE           : STM32_SVD.Bit;
      --  interrupt enable
      TXEIE          : STM32_SVD.Bit;
      --  PE interrupt enable
      PEIE           : STM32_SVD.Bit;
      --  Parity selection
      PS             : STM32_SVD.Bit;
      --  Parity control enable
      PCE            : STM32_SVD.Bit;
      --  Receiver wakeup method
      WAKE           : STM32_SVD.Bit;
      --  Word length
      M0             : STM32_SVD.Bit;
      --  Mute mode enable
      MME            : STM32_SVD.Bit;
      --  Character match interrupt enable
      CMIE           : STM32_SVD.Bit;
      --  Oversampling mode
      OVER8          : STM32_SVD.Bit;
      --  DEDT0
      DEDT           : CR1_DEDT_Field;
      --  DEAT0
      DEAT           : CR1_DEAT_Field;
      --  Receiver timeout interrupt enable
      RTOIE          : STM32_SVD.Bit;
      --  End of Block interrupt enable
      EOBIE          : STM32_SVD.Bit;
      --  Word length
      M1             : STM32_SVD.Bit;
      --  unspecified
      Reserved_29_31 : STM32_SVD.UInt3;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register_1 use record
      UE             at 0 range 0 .. 0;
      UESM           at 0 range 1 .. 1;
      RE             at 0 range 2 .. 2;
      TE             at 0 range 3 .. 3;
      IDLEIE         at 0 range 4 .. 4;
      RXNEIE         at 0 range 5 .. 5;
      TCIE           at 0 range 6 .. 6;
      TXEIE          at 0 range 7 .. 7;
      PEIE           at 0 range 8 .. 8;
      PS             at 0 range 9 .. 9;
      PCE            at 0 range 10 .. 10;
      WAKE           at 0 range 11 .. 11;
      M0             at 0 range 12 .. 12;
      MME            at 0 range 13 .. 13;
      CMIE           at 0 range 14 .. 14;
      OVER8          at 0 range 15 .. 15;
      DEDT           at 0 range 16 .. 20;
      DEAT           at 0 range 21 .. 25;
      RTOIE          at 0 range 26 .. 26;
      EOBIE          at 0 range 27 .. 27;
      M1             at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  CR2_ABRMOD array
   type CR2_ABRMOD_Field_Array is array (0 .. 1) of STM32_SVD.Bit
     with Component_Size => 1, Size => 2;

   --  Type definition for CR2_ABRMOD
   type CR2_ABRMOD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ABRMOD as a value
            Val : STM32_SVD.UInt2;
         when True =>
            --  ABRMOD as an array
            Arr : CR2_ABRMOD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CR2_ABRMOD_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Control register 2
   type CR2_Register_1 is record
      --  unspecified
      Reserved_0_3 : STM32_SVD.UInt4;
      --  7-bit Address Detection/4-bit Address Detection
      ADDM7        : STM32_SVD.Bit;
      --  LIN break detection length
      LBDL         : STM32_SVD.Bit;
      --  LIN break detection interrupt enable
      LBDIE        : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_7 : STM32_SVD.Bit;
      --  Last bit clock pulse
      LBCL         : STM32_SVD.Bit;
      --  Clock phase
      CPHA         : STM32_SVD.Bit;
      --  Clock polarity
      CPOL         : STM32_SVD.Bit;
      --  Clock enable
      CLKEN        : STM32_SVD.Bit;
      --  STOP bits
      STOP         : STM32_SVD.UInt2;
      --  LIN mode enable
      LINEN        : STM32_SVD.Bit;
      --  Swap TX/RX pins
      SWAP         : STM32_SVD.Bit;
      --  RX pin active level inversion
      RXINV        : STM32_SVD.Bit;
      --  TX pin active level inversion
      TXINV        : STM32_SVD.Bit;
      --  Binary data inversion
      TAINV        : STM32_SVD.Bit;
      --  Most significant bit first
      MSBFIRST     : STM32_SVD.Bit;
      --  Auto baud rate enable
      ABREN        : STM32_SVD.Bit;
      --  ABRMOD0
      ABRMOD       : CR2_ABRMOD_Field;
      --  Receiver timeout enable
      RTOEN        : STM32_SVD.Bit;
      --  Address of the USART node
      ADD0_3       : STM32_SVD.UInt4;
      --  Address of the USART node
      ADD4_7       : STM32_SVD.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_1 use record
      Reserved_0_3 at 0 range 0 .. 3;
      ADDM7        at 0 range 4 .. 4;
      LBDL         at 0 range 5 .. 5;
      LBDIE        at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
      LBCL         at 0 range 8 .. 8;
      CPHA         at 0 range 9 .. 9;
      CPOL         at 0 range 10 .. 10;
      CLKEN        at 0 range 11 .. 11;
      STOP         at 0 range 12 .. 13;
      LINEN        at 0 range 14 .. 14;
      SWAP         at 0 range 15 .. 15;
      RXINV        at 0 range 16 .. 16;
      TXINV        at 0 range 17 .. 17;
      TAINV        at 0 range 18 .. 18;
      MSBFIRST     at 0 range 19 .. 19;
      ABREN        at 0 range 20 .. 20;
      ABRMOD       at 0 range 21 .. 22;
      RTOEN        at 0 range 23 .. 23;
      ADD0_3       at 0 range 24 .. 27;
      ADD4_7       at 0 range 28 .. 31;
   end record;

   --  Control register 3
   type CR3_Register_1 is record
      --  Error interrupt enable
      EIE            : STM32_SVD.Bit;
      --  Ir mode enable
      IREN           : STM32_SVD.Bit;
      --  Ir low-power
      IRLP           : STM32_SVD.Bit;
      --  Half-duplex selection
      HDSEL          : STM32_SVD.Bit;
      --  Smartcard NACK enable
      NACK           : STM32_SVD.Bit;
      --  Smartcard mode enable
      SCEN           : STM32_SVD.Bit;
      --  DMA enable receiver
      DMAR           : STM32_SVD.Bit;
      --  DMA enable transmitter
      DMAT           : STM32_SVD.Bit;
      --  RTS enable
      RTSE           : STM32_SVD.Bit;
      --  CTS enable
      CTSE           : STM32_SVD.Bit;
      --  CTS interrupt enable
      CTSIE          : STM32_SVD.Bit;
      --  One sample bit method enable
      ONEBIT         : STM32_SVD.Bit;
      --  Overrun Disable
      OVRDIS         : STM32_SVD.Bit;
      --  DMA Disable on Reception Error
      DDRE           : STM32_SVD.Bit;
      --  Driver enable mode
      DEM            : STM32_SVD.Bit;
      --  Driver enable polarity selection
      DEP            : STM32_SVD.Bit;
      --  unspecified
      Reserved_16_16 : STM32_SVD.Bit;
      --  Smartcard auto-retry count
      SCARCNT        : STM32_SVD.UInt3;
      --  Wakeup from Stop mode interrupt flag selection
      WUS            : STM32_SVD.UInt2;
      --  Wakeup from Stop mode interrupt enable
      WUFIE          : STM32_SVD.Bit;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR3_Register_1 use record
      EIE            at 0 range 0 .. 0;
      IREN           at 0 range 1 .. 1;
      IRLP           at 0 range 2 .. 2;
      HDSEL          at 0 range 3 .. 3;
      NACK           at 0 range 4 .. 4;
      SCEN           at 0 range 5 .. 5;
      DMAR           at 0 range 6 .. 6;
      DMAT           at 0 range 7 .. 7;
      RTSE           at 0 range 8 .. 8;
      CTSE           at 0 range 9 .. 9;
      CTSIE          at 0 range 10 .. 10;
      ONEBIT         at 0 range 11 .. 11;
      OVRDIS         at 0 range 12 .. 12;
      DDRE           at 0 range 13 .. 13;
      DEM            at 0 range 14 .. 14;
      DEP            at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      SCARCNT        at 0 range 17 .. 19;
      WUS            at 0 range 20 .. 21;
      WUFIE          at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  Baud rate register
   type BRR_Register_1 is record
      --  DIV_Fraction
      DIV_Fraction   : STM32_SVD.UInt4;
      --  DIV_Mantissa
      DIV_Mantissa   : STM32_SVD.UInt12;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BRR_Register_1 use record
      DIV_Fraction   at 0 range 0 .. 3;
      DIV_Mantissa   at 0 range 4 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Guard time and prescaler register
   type GTPR_Register is record
      --  Prescaler value
      PSC            : STM32_SVD.Byte;
      --  Guard time value
      GT             : STM32_SVD.Byte;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GTPR_Register use record
      PSC            at 0 range 0 .. 7;
      GT             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Receiver timeout register
   type RTOR_Register is record
      --  Receiver timeout value
      RTO  : STM32_SVD.UInt24;
      --  Block Length
      BLEN : STM32_SVD.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTOR_Register use record
      RTO  at 0 range 0 .. 23;
      BLEN at 0 range 24 .. 31;
   end record;

   --  Request register
   type RQR_Register_1 is record
      --  Write-only. Auto baud rate request
      ABRRQ         : STM32_SVD.Bit;
      --  Write-only. Send break request
      SBKRQ         : STM32_SVD.Bit;
      --  Write-only. Mute mode request
      MMRQ          : STM32_SVD.Bit;
      --  Write-only. Receive data flush request
      RXFRQ         : STM32_SVD.Bit;
      --  Write-only. Transmit data flush request
      TXFRQ         : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_31 : STM32_SVD.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RQR_Register_1 use record
      ABRRQ         at 0 range 0 .. 0;
      SBKRQ         at 0 range 1 .. 1;
      MMRQ          at 0 range 2 .. 2;
      RXFRQ         at 0 range 3 .. 3;
      TXFRQ         at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  Interrupt & status register
   type ISR_Register_1 is record
      --  Read-only. PE
      PE             : STM32_SVD.Bit;
      --  Read-only. FE
      FE             : STM32_SVD.Bit;
      --  Read-only. NF
      NF             : STM32_SVD.Bit;
      --  Read-only. ORE
      ORE            : STM32_SVD.Bit;
      --  Read-only. IDLE
      IDLE           : STM32_SVD.Bit;
      --  Read-only. RXNE
      RXNE           : STM32_SVD.Bit;
      --  Read-only. TC
      TC             : STM32_SVD.Bit;
      --  Read-only. TXE
      TXE            : STM32_SVD.Bit;
      --  Read-only. LBDF
      LBDF           : STM32_SVD.Bit;
      --  Read-only. CTSIF
      CTSIF          : STM32_SVD.Bit;
      --  Read-only. CTS
      CTS            : STM32_SVD.Bit;
      --  Read-only. RTOF
      RTOF           : STM32_SVD.Bit;
      --  Read-only. EOBF
      EOBF           : STM32_SVD.Bit;
      --  unspecified
      Reserved_13_13 : STM32_SVD.Bit;
      --  Read-only. ABRE
      ABRE           : STM32_SVD.Bit;
      --  Read-only. ABRF
      ABRF           : STM32_SVD.Bit;
      --  Read-only. BUSY
      BUSY           : STM32_SVD.Bit;
      --  Read-only. CMF
      CMF            : STM32_SVD.Bit;
      --  Read-only. SBKF
      SBKF           : STM32_SVD.Bit;
      --  Read-only. RWU
      RWU            : STM32_SVD.Bit;
      --  Read-only. WUF
      WUF            : STM32_SVD.Bit;
      --  Read-only. TEACK
      TEACK          : STM32_SVD.Bit;
      --  Read-only. REACK
      REACK          : STM32_SVD.Bit;
      --  unspecified
      Reserved_23_31 : STM32_SVD.UInt9;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register_1 use record
      PE             at 0 range 0 .. 0;
      FE             at 0 range 1 .. 1;
      NF             at 0 range 2 .. 2;
      ORE            at 0 range 3 .. 3;
      IDLE           at 0 range 4 .. 4;
      RXNE           at 0 range 5 .. 5;
      TC             at 0 range 6 .. 6;
      TXE            at 0 range 7 .. 7;
      LBDF           at 0 range 8 .. 8;
      CTSIF          at 0 range 9 .. 9;
      CTS            at 0 range 10 .. 10;
      RTOF           at 0 range 11 .. 11;
      EOBF           at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      ABRE           at 0 range 14 .. 14;
      ABRF           at 0 range 15 .. 15;
      BUSY           at 0 range 16 .. 16;
      CMF            at 0 range 17 .. 17;
      SBKF           at 0 range 18 .. 18;
      RWU            at 0 range 19 .. 19;
      WUF            at 0 range 20 .. 20;
      TEACK          at 0 range 21 .. 21;
      REACK          at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  Interrupt flag clear register
   type ICR_Register_1 is record
      --  Write-only. Parity error clear flag
      PECF           : STM32_SVD.Bit;
      --  Write-only. Framing error clear flag
      FECF           : STM32_SVD.Bit;
      --  Write-only. Noise detected clear flag
      NCF            : STM32_SVD.Bit;
      --  Write-only. Overrun error clear flag
      ORECF          : STM32_SVD.Bit;
      --  Write-only. Idle line detected clear flag
      IDLECF         : STM32_SVD.Bit;
      --  unspecified
      Reserved_5_5   : STM32_SVD.Bit;
      --  Write-only. Transmission complete clear flag
      TCCF           : STM32_SVD.Bit;
      --  unspecified
      Reserved_7_7   : STM32_SVD.Bit;
      --  Write-only. LIN break detection clear flag
      LBDCF          : STM32_SVD.Bit;
      --  Write-only. CTS clear flag
      CTSCF          : STM32_SVD.Bit;
      --  unspecified
      Reserved_10_10 : STM32_SVD.Bit;
      --  Write-only. Receiver timeout clear flag
      RTOCF          : STM32_SVD.Bit;
      --  Write-only. End of block clear flag
      EOBCF          : STM32_SVD.Bit;
      --  unspecified
      Reserved_13_16 : STM32_SVD.UInt4;
      --  Write-only. Character match clear flag
      CMCF           : STM32_SVD.Bit;
      --  unspecified
      Reserved_18_19 : STM32_SVD.UInt2;
      --  Write-only. Wakeup from Stop mode clear flag
      WUCF           : STM32_SVD.Bit;
      --  unspecified
      Reserved_21_31 : STM32_SVD.UInt11;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register_1 use record
      PECF           at 0 range 0 .. 0;
      FECF           at 0 range 1 .. 1;
      NCF            at 0 range 2 .. 2;
      ORECF          at 0 range 3 .. 3;
      IDLECF         at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TCCF           at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      LBDCF          at 0 range 8 .. 8;
      CTSCF          at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      RTOCF          at 0 range 11 .. 11;
      EOBCF          at 0 range 12 .. 12;
      Reserved_13_16 at 0 range 13 .. 16;
      CMCF           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      WUCF           at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Lower power Universal asynchronous receiver transmitter
   type LPUART1_Peripheral is record
      --  Control register 1
      CR1 : aliased CR1_Register;
      --  Control register 2
      CR2 : aliased CR2_Register;
      --  Control register 3
      CR3 : aliased CR3_Register;
      --  Baud rate register
      BRR : aliased BRR_Register;
      --  Request register
      RQR : aliased RQR_Register;
      --  Interrupt & status register
      ISR : aliased ISR_Register;
      --  Interrupt flag clear register
      ICR : aliased ICR_Register;
      --  Receive data register
      RDR : aliased RDR_Register;
      --  Transmit data register
      TDR : aliased TDR_Register;
   end record
     with Volatile;

   for LPUART1_Peripheral use record
      CR1 at 16#0# range 0 .. 31;
      CR2 at 16#4# range 0 .. 31;
      CR3 at 16#8# range 0 .. 31;
      BRR at 16#C# range 0 .. 31;
      RQR at 16#18# range 0 .. 31;
      ISR at 16#1C# range 0 .. 31;
      ICR at 16#20# range 0 .. 31;
      RDR at 16#24# range 0 .. 31;
      TDR at 16#28# range 0 .. 31;
   end record;

   --  Lower power Universal asynchronous receiver transmitter
   LPUART1_Periph : aliased LPUART1_Peripheral
     with Import, Address => LPUART1_Base;

   --  Universal synchronous asynchronous receiver transmitter
   type USART_Peripheral is record
      --  Control register 1
      CR1  : aliased CR1_Register_1;
      --  Control register 2
      CR2  : aliased CR2_Register_1;
      --  Control register 3
      CR3  : aliased CR3_Register_1;
      --  Baud rate register
      BRR  : aliased BRR_Register_1;
      --  Guard time and prescaler register
      GTPR : aliased GTPR_Register;
      --  Receiver timeout register
      RTOR : aliased RTOR_Register;
      --  Request register
      RQR  : aliased RQR_Register_1;
      --  Interrupt & status register
      ISR  : aliased ISR_Register_1;
      --  Interrupt flag clear register
      ICR  : aliased ICR_Register_1;
      --  Receive data register
      RDR  : aliased RDR_Register;
      --  Transmit data register
      TDR  : aliased TDR_Register;
   end record
     with Volatile;

   for USART_Peripheral use record
      CR1  at 16#0# range 0 .. 31;
      CR2  at 16#4# range 0 .. 31;
      CR3  at 16#8# range 0 .. 31;
      BRR  at 16#C# range 0 .. 31;
      GTPR at 16#10# range 0 .. 31;
      RTOR at 16#14# range 0 .. 31;
      RQR  at 16#18# range 0 .. 31;
      ISR  at 16#1C# range 0 .. 31;
      ICR  at 16#20# range 0 .. 31;
      RDR  at 16#24# range 0 .. 31;
      TDR  at 16#28# range 0 .. 31;
   end record;

   --  Universal synchronous asynchronous receiver transmitter
   USART1_Periph : aliased USART_Peripheral
     with Import, Address => USART1_Base;

   --  Universal synchronous asynchronous receiver transmitter
   USART2_Periph : aliased USART_Peripheral
     with Import, Address => USART2_Base;

   --  Universal synchronous asynchronous receiver transmitter
   USART4_Periph : aliased USART_Peripheral
     with Import, Address => USART4_Base;

   --  Universal synchronous asynchronous receiver transmitter
   USART5_Periph : aliased USART_Peripheral
     with Import, Address => USART5_Base;

end STM32_SVD.USART;
