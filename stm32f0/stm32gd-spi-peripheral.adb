package body STM32GD.SPI.Peripheral is

   procedure Init is
      CR1 : STM32_SVD.SPI.CR1_Register;
   begin
      SPI.CR1 := (MSTR => 1, SSI => 1, SSM => 1, BR => 0,
         Reserved_16_31 => 0, others => 0);
      SPI.CR2 := (DS => 7, FRXTH => 1, Reserved_15_31 => 0,  others => 0);
      SPI.CR1.SPE := 1;
   end Init;

   procedure Send (Data : in Byte) is
   begin
      while SPI.SR.TXE = 0 loop
         null;
      end loop;
      SPI.DR.DR := Byte (Data);
      while SPI.SR.RXNE = 0 loop
         null;
      end loop;
   end Send;

   procedure Send (Data : in SPI_Data_8b) is
   begin
      for D of Data loop
         Send (D);
      end loop;
   end Send;

   procedure Receive (Data : out Byte) is
   begin
      while SPI.SR.TXE = 0 loop
         null;
      end loop;
      SPI.DR.DR := Byte (0);
      while SPI.SR.RXNE = 0 loop
         null;
      end loop;
      Data := Byte (SPI.DR.DR);
   end Receive;

   procedure Receive (Data : out SPI_Data_8b) is
   begin
      for I in Data'Range loop
         while SPI.SR.TXE = 0 loop
            null;
         end loop;
         SPI.DR.DR := Byte (16#FF#);
         while SPI.SR.RXNE = 0 loop
            null;
         end loop;
         Data (I) := Byte (SPI.DR.DR);
      end loop;
   end Receive;

   procedure Transfer (Data : in out SPI_Data_8b) is
   begin
      for I in Data'Range loop
         while SPI.SR.TXE = 0 loop
            null;
         end loop;
         SPI.DR.DR := Byte (Data (I));
         while SPI.SR.RXNE = 0 loop
            null;
         end loop;
         Data (I) := Byte (SPI.DR.DR);
      end loop;
   end Transfer;

end STM32GD.SPI.Peripheral;
