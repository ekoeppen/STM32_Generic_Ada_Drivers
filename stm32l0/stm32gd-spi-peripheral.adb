package body STM32GD.SPI.Peripheral is

   procedure Init is
   begin
      SPI.CR1 := (MSTR => 1, SSI => 1, SSM => 1, BR => 0,
         Reserved_16_31 => 0, others => 0);
      SPI.CR1.SPE := 1;
   end Init;

   procedure Wait_For_TXE is
   begin
      while SPI.SR.TXE = 0 loop
         null;
      end loop;
   end Wait_For_TXE;

   procedure Wait_For_RXNE is
   begin
      while SPI.SR.RXNE = 0 loop
         null;
      end loop;
   end Wait_For_RXNE;

   procedure Send (Data : in Byte) is
   begin
      Wait_For_TXE;
      SPI.DR.DR := Byte (Data);
      Wait_For_RXNE;
   end Send;

   procedure Send (Data : in SPI_Data_8b) is
   begin
      for D of Data loop
         Send (D);
      end loop;
   end Send;

   procedure Receive (Data : out Byte) is
   begin
      Wait_For_TXE;
      SPI.DR.DR := Byte (0);
      Wait_For_RXNE;
      Data := Byte (SPI.DR.DR);
   end Receive;

   procedure Receive (Data : out SPI_Data_8b) is
   begin
      for I in Data'Range loop
         Wait_For_TXE;
         SPI.DR.DR := Byte (16#FF#);
         Wait_For_RXNE;
         Data (I) := Byte (SPI.DR.DR);
      end loop;
   end Receive;

   procedure Transfer (Data : in out SPI_Data_8b) is
   begin
      for I in Data'Range loop
         Wait_For_TXE;
         SPI.DR.DR := Byte (Data (I));
         Wait_For_RXNE;
         Data (I) := Byte (SPI.DR.DR);
      end loop;
   end Transfer;

end STM32GD.SPI.Peripheral;
