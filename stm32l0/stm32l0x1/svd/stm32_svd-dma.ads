--  This spec has been automatically generated from STM32L0x1.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with System;

package STM32_SVD.DMA is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  interrupt status register
   type ISR_Register is record
      --  Read-only. Channel x global interrupt flag (x = 1 ..7)
      GIF1           : STM32_SVD.Bit;
      --  Read-only. Channel x transfer complete flag (x = 1 ..7)
      TCIF1          : STM32_SVD.Bit;
      --  Read-only. Channel x half transfer flag (x = 1 ..7)
      HTIF1          : STM32_SVD.Bit;
      --  Read-only. Channel x transfer error flag (x = 1 ..7)
      TEIF1          : STM32_SVD.Bit;
      --  Read-only. Channel x global interrupt flag (x = 1 ..7)
      GIF2           : STM32_SVD.Bit;
      --  Read-only. Channel x transfer complete flag (x = 1 ..7)
      TCIF2          : STM32_SVD.Bit;
      --  Read-only. Channel x half transfer flag (x = 1 ..7)
      HTIF2          : STM32_SVD.Bit;
      --  Read-only. Channel x transfer error flag (x = 1 ..7)
      TEIF2          : STM32_SVD.Bit;
      --  Read-only. Channel x global interrupt flag (x = 1 ..7)
      GIF3           : STM32_SVD.Bit;
      --  Read-only. Channel x transfer complete flag (x = 1 ..7)
      TCIF3          : STM32_SVD.Bit;
      --  Read-only. Channel x half transfer flag (x = 1 ..7)
      HTIF3          : STM32_SVD.Bit;
      --  Read-only. Channel x transfer error flag (x = 1 ..7)
      TEIF3          : STM32_SVD.Bit;
      --  Read-only. Channel x global interrupt flag (x = 1 ..7)
      GIF4           : STM32_SVD.Bit;
      --  Read-only. Channel x transfer complete flag (x = 1 ..7)
      TCIF4          : STM32_SVD.Bit;
      --  Read-only. Channel x half transfer flag (x = 1 ..7)
      HTIF4          : STM32_SVD.Bit;
      --  Read-only. Channel x transfer error flag (x = 1 ..7)
      TEIF4          : STM32_SVD.Bit;
      --  Read-only. Channel x global interrupt flag (x = 1 ..7)
      GIF5           : STM32_SVD.Bit;
      --  Read-only. Channel x transfer complete flag (x = 1 ..7)
      TCIF5          : STM32_SVD.Bit;
      --  Read-only. Channel x half transfer flag (x = 1 ..7)
      HTIF5          : STM32_SVD.Bit;
      --  Read-only. Channel x transfer error flag (x = 1 ..7)
      TEIF5          : STM32_SVD.Bit;
      --  Read-only. Channel x global interrupt flag (x = 1 ..7)
      GIF6           : STM32_SVD.Bit;
      --  Read-only. Channel x transfer complete flag (x = 1 ..7)
      TCIF6          : STM32_SVD.Bit;
      --  Read-only. Channel x half transfer flag (x = 1 ..7)
      HTIF6          : STM32_SVD.Bit;
      --  Read-only. Channel x transfer error flag (x = 1 ..7)
      TEIF6          : STM32_SVD.Bit;
      --  Read-only. Channel x global interrupt flag (x = 1 ..7)
      GIF7           : STM32_SVD.Bit;
      --  Read-only. Channel x transfer complete flag (x = 1 ..7)
      TCIF7          : STM32_SVD.Bit;
      --  Read-only. Channel x half transfer flag (x = 1 ..7)
      HTIF7          : STM32_SVD.Bit;
      --  Read-only. Channel x transfer error flag (x = 1 ..7)
      TEIF7          : STM32_SVD.Bit;
      --  unspecified
      Reserved_28_31 : STM32_SVD.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      GIF1           at 0 range 0 .. 0;
      TCIF1          at 0 range 1 .. 1;
      HTIF1          at 0 range 2 .. 2;
      TEIF1          at 0 range 3 .. 3;
      GIF2           at 0 range 4 .. 4;
      TCIF2          at 0 range 5 .. 5;
      HTIF2          at 0 range 6 .. 6;
      TEIF2          at 0 range 7 .. 7;
      GIF3           at 0 range 8 .. 8;
      TCIF3          at 0 range 9 .. 9;
      HTIF3          at 0 range 10 .. 10;
      TEIF3          at 0 range 11 .. 11;
      GIF4           at 0 range 12 .. 12;
      TCIF4          at 0 range 13 .. 13;
      HTIF4          at 0 range 14 .. 14;
      TEIF4          at 0 range 15 .. 15;
      GIF5           at 0 range 16 .. 16;
      TCIF5          at 0 range 17 .. 17;
      HTIF5          at 0 range 18 .. 18;
      TEIF5          at 0 range 19 .. 19;
      GIF6           at 0 range 20 .. 20;
      TCIF6          at 0 range 21 .. 21;
      HTIF6          at 0 range 22 .. 22;
      TEIF6          at 0 range 23 .. 23;
      GIF7           at 0 range 24 .. 24;
      TCIF7          at 0 range 25 .. 25;
      HTIF7          at 0 range 26 .. 26;
      TEIF7          at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  interrupt flag clear register
   type IFCR_Register is record
      --  Write-only. Channel x global interrupt clear (x = 1 ..7)
      CGIF1          : STM32_SVD.Bit;
      --  Write-only. Channel x transfer complete clear (x = 1 ..7)
      CTCIF1         : STM32_SVD.Bit;
      --  Write-only. Channel x half transfer clear (x = 1 ..7)
      CHTIF1         : STM32_SVD.Bit;
      --  Write-only. Channel x transfer error clear (x = 1 ..7)
      CTEIF1         : STM32_SVD.Bit;
      --  Write-only. Channel x global interrupt clear (x = 1 ..7)
      CGIF2          : STM32_SVD.Bit;
      --  Write-only. Channel x transfer complete clear (x = 1 ..7)
      CTCIF2         : STM32_SVD.Bit;
      --  Write-only. Channel x half transfer clear (x = 1 ..7)
      CHTIF2         : STM32_SVD.Bit;
      --  Write-only. Channel x transfer error clear (x = 1 ..7)
      CTEIF2         : STM32_SVD.Bit;
      --  Write-only. Channel x global interrupt clear (x = 1 ..7)
      CGIF3          : STM32_SVD.Bit;
      --  Write-only. Channel x transfer complete clear (x = 1 ..7)
      CTCIF3         : STM32_SVD.Bit;
      --  Write-only. Channel x half transfer clear (x = 1 ..7)
      CHTIF3         : STM32_SVD.Bit;
      --  Write-only. Channel x transfer error clear (x = 1 ..7)
      CTEIF3         : STM32_SVD.Bit;
      --  Write-only. Channel x global interrupt clear (x = 1 ..7)
      CGIF4          : STM32_SVD.Bit;
      --  Write-only. Channel x transfer complete clear (x = 1 ..7)
      CTCIF4         : STM32_SVD.Bit;
      --  Write-only. Channel x half transfer clear (x = 1 ..7)
      CHTIF4         : STM32_SVD.Bit;
      --  Write-only. Channel x transfer error clear (x = 1 ..7)
      CTEIF4         : STM32_SVD.Bit;
      --  Write-only. Channel x global interrupt clear (x = 1 ..7)
      CGIF5          : STM32_SVD.Bit;
      --  Write-only. Channel x transfer complete clear (x = 1 ..7)
      CTCIF5         : STM32_SVD.Bit;
      --  Write-only. Channel x half transfer clear (x = 1 ..7)
      CHTIF5         : STM32_SVD.Bit;
      --  Write-only. Channel x transfer error clear (x = 1 ..7)
      CTEIF5         : STM32_SVD.Bit;
      --  Write-only. Channel x global interrupt clear (x = 1 ..7)
      CGIF6          : STM32_SVD.Bit;
      --  Write-only. Channel x transfer complete clear (x = 1 ..7)
      CTCIF6         : STM32_SVD.Bit;
      --  Write-only. Channel x half transfer clear (x = 1 ..7)
      CHTIF6         : STM32_SVD.Bit;
      --  Write-only. Channel x transfer error clear (x = 1 ..7)
      CTEIF6         : STM32_SVD.Bit;
      --  Write-only. Channel x global interrupt clear (x = 1 ..7)
      CGIF7          : STM32_SVD.Bit;
      --  Write-only. Channel x transfer complete clear (x = 1 ..7)
      CTCIF7         : STM32_SVD.Bit;
      --  Write-only. Channel x half transfer clear (x = 1 ..7)
      CHTIF7         : STM32_SVD.Bit;
      --  Write-only. Channel x transfer error clear (x = 1 ..7)
      CTEIF7         : STM32_SVD.Bit;
      --  unspecified
      Reserved_28_31 : STM32_SVD.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IFCR_Register use record
      CGIF1          at 0 range 0 .. 0;
      CTCIF1         at 0 range 1 .. 1;
      CHTIF1         at 0 range 2 .. 2;
      CTEIF1         at 0 range 3 .. 3;
      CGIF2          at 0 range 4 .. 4;
      CTCIF2         at 0 range 5 .. 5;
      CHTIF2         at 0 range 6 .. 6;
      CTEIF2         at 0 range 7 .. 7;
      CGIF3          at 0 range 8 .. 8;
      CTCIF3         at 0 range 9 .. 9;
      CHTIF3         at 0 range 10 .. 10;
      CTEIF3         at 0 range 11 .. 11;
      CGIF4          at 0 range 12 .. 12;
      CTCIF4         at 0 range 13 .. 13;
      CHTIF4         at 0 range 14 .. 14;
      CTEIF4         at 0 range 15 .. 15;
      CGIF5          at 0 range 16 .. 16;
      CTCIF5         at 0 range 17 .. 17;
      CHTIF5         at 0 range 18 .. 18;
      CTEIF5         at 0 range 19 .. 19;
      CGIF6          at 0 range 20 .. 20;
      CTCIF6         at 0 range 21 .. 21;
      CHTIF6         at 0 range 22 .. 22;
      CTEIF6         at 0 range 23 .. 23;
      CGIF7          at 0 range 24 .. 24;
      CTCIF7         at 0 range 25 .. 25;
      CHTIF7         at 0 range 26 .. 26;
      CTEIF7         at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  channel x configuration register
   type CCR_Register is record
      --  Channel enable
      EN             : STM32_SVD.Bit;
      --  Transfer complete interrupt enable
      TCIE           : STM32_SVD.Bit;
      --  Half transfer interrupt enable
      HTIE           : STM32_SVD.Bit;
      --  Transfer error interrupt enable
      TEIE           : STM32_SVD.Bit;
      --  Data transfer direction
      DIR            : STM32_SVD.Bit;
      --  Circular mode
      CIRC           : STM32_SVD.Bit;
      --  Peripheral increment mode
      PINC           : STM32_SVD.Bit;
      --  Memory increment mode
      MINC           : STM32_SVD.Bit;
      --  Peripheral size
      PSIZE          : STM32_SVD.UInt2;
      --  Memory size
      MSIZE          : STM32_SVD.UInt2;
      --  Channel priority level
      PL             : STM32_SVD.UInt2;
      --  Memory to memory mode
      MEM2MEM        : STM32_SVD.Bit;
      --  unspecified
      Reserved_15_31 : STM32_SVD.UInt17;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      EN             at 0 range 0 .. 0;
      TCIE           at 0 range 1 .. 1;
      HTIE           at 0 range 2 .. 2;
      TEIE           at 0 range 3 .. 3;
      DIR            at 0 range 4 .. 4;
      CIRC           at 0 range 5 .. 5;
      PINC           at 0 range 6 .. 6;
      MINC           at 0 range 7 .. 7;
      PSIZE          at 0 range 8 .. 9;
      MSIZE          at 0 range 10 .. 11;
      PL             at 0 range 12 .. 13;
      MEM2MEM        at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  channel x number of data register
   type CNDTR_Register is record
      --  Number of data to transfer
      NDT            : STM32_SVD.UInt16;
      --  unspecified
      Reserved_16_31 : STM32_SVD.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNDTR_Register use record
      NDT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  channel selection register
   type CSELR_Register is record
      --  DMA channel 1 selection
      C1S            : STM32_SVD.UInt4;
      --  DMA channel 2 selection
      C2S            : STM32_SVD.UInt4;
      --  DMA channel 3 selection
      C3S            : STM32_SVD.UInt4;
      --  DMA channel 4 selection
      C4S            : STM32_SVD.UInt4;
      --  DMA channel 5 selection
      C5S            : STM32_SVD.UInt4;
      --  DMA channel 6 selection
      C6S            : STM32_SVD.UInt4;
      --  DMA channel 7 selection
      C7S            : STM32_SVD.UInt4;
      --  unspecified
      Reserved_28_31 : STM32_SVD.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSELR_Register use record
      C1S            at 0 range 0 .. 3;
      C2S            at 0 range 4 .. 7;
      C3S            at 0 range 8 .. 11;
      C4S            at 0 range 12 .. 15;
      C5S            at 0 range 16 .. 19;
      C6S            at 0 range 20 .. 23;
      C7S            at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Direct memory access controller
   type DMA1_Peripheral is record
      --  interrupt status register
      ISR    : aliased ISR_Register;
      --  interrupt flag clear register
      IFCR   : aliased IFCR_Register;
      --  channel x configuration register
      CCR1   : aliased CCR_Register;
      --  channel x number of data register
      CNDTR1 : aliased CNDTR_Register;
      --  channel x peripheral address register
      CPAR1  : aliased STM32_SVD.UInt32;
      --  channel x memory address register
      CMAR1  : aliased STM32_SVD.UInt32;
      --  channel x configuration register
      CCR2   : aliased CCR_Register;
      --  channel x number of data register
      CNDTR2 : aliased CNDTR_Register;
      --  channel x peripheral address register
      CPAR2  : aliased STM32_SVD.UInt32;
      --  channel x memory address register
      CMAR2  : aliased STM32_SVD.UInt32;
      --  channel x configuration register
      CCR3   : aliased CCR_Register;
      --  channel x number of data register
      CNDTR3 : aliased CNDTR_Register;
      --  channel x peripheral address register
      CPAR3  : aliased STM32_SVD.UInt32;
      --  channel x memory address register
      CMAR3  : aliased STM32_SVD.UInt32;
      --  channel x configuration register
      CCR4   : aliased CCR_Register;
      --  channel x number of data register
      CNDTR4 : aliased CNDTR_Register;
      --  channel x peripheral address register
      CPAR4  : aliased STM32_SVD.UInt32;
      --  channel x memory address register
      CMAR4  : aliased STM32_SVD.UInt32;
      --  channel x configuration register
      CCR5   : aliased CCR_Register;
      --  channel x number of data register
      CNDTR5 : aliased CNDTR_Register;
      --  channel x peripheral address register
      CPAR5  : aliased STM32_SVD.UInt32;
      --  channel x memory address register
      CMAR5  : aliased STM32_SVD.UInt32;
      --  channel x configuration register
      CCR6   : aliased CCR_Register;
      --  channel x number of data register
      CNDTR6 : aliased CNDTR_Register;
      --  channel x peripheral address register
      CPAR6  : aliased STM32_SVD.UInt32;
      --  channel x memory address register
      CMAR6  : aliased STM32_SVD.UInt32;
      --  channel x configuration register
      CCR7   : aliased CCR_Register;
      --  channel x number of data register
      CNDTR7 : aliased CNDTR_Register;
      --  channel x peripheral address register
      CPAR7  : aliased STM32_SVD.UInt32;
      --  channel x memory address register
      CMAR7  : aliased STM32_SVD.UInt32;
      --  channel selection register
      CSELR  : aliased CSELR_Register;
   end record
     with Volatile;

   for DMA1_Peripheral use record
      ISR    at 16#0# range 0 .. 31;
      IFCR   at 16#4# range 0 .. 31;
      CCR1   at 16#8# range 0 .. 31;
      CNDTR1 at 16#C# range 0 .. 31;
      CPAR1  at 16#10# range 0 .. 31;
      CMAR1  at 16#14# range 0 .. 31;
      CCR2   at 16#1C# range 0 .. 31;
      CNDTR2 at 16#20# range 0 .. 31;
      CPAR2  at 16#24# range 0 .. 31;
      CMAR2  at 16#28# range 0 .. 31;
      CCR3   at 16#30# range 0 .. 31;
      CNDTR3 at 16#34# range 0 .. 31;
      CPAR3  at 16#38# range 0 .. 31;
      CMAR3  at 16#3C# range 0 .. 31;
      CCR4   at 16#44# range 0 .. 31;
      CNDTR4 at 16#48# range 0 .. 31;
      CPAR4  at 16#4C# range 0 .. 31;
      CMAR4  at 16#50# range 0 .. 31;
      CCR5   at 16#58# range 0 .. 31;
      CNDTR5 at 16#5C# range 0 .. 31;
      CPAR5  at 16#60# range 0 .. 31;
      CMAR5  at 16#64# range 0 .. 31;
      CCR6   at 16#6C# range 0 .. 31;
      CNDTR6 at 16#70# range 0 .. 31;
      CPAR6  at 16#74# range 0 .. 31;
      CMAR6  at 16#78# range 0 .. 31;
      CCR7   at 16#80# range 0 .. 31;
      CNDTR7 at 16#84# range 0 .. 31;
      CPAR7  at 16#88# range 0 .. 31;
      CMAR7  at 16#8C# range 0 .. 31;
      CSELR  at 16#A8# range 0 .. 31;
   end record;

   --  Direct memory access controller
   DMA1_Periph : aliased DMA1_Peripheral
     with Import, Address => DMA1_Base;

end STM32_SVD.DMA;
