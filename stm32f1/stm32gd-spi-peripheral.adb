package body STM32GD.SPI.Peripheral is

   procedure Init is
   begin
      null;
   end Init;

   procedure Transfer (Data : in out SPI_Data_8b) is
   begin
      while SPI.SR.TXE = 0 loop
         null;
      end loop;
      SPI.DR.DR := UInt16 (Data (0));
      while SPI.SR.RXNE = 0 loop
         null;
      end loop;
      Data (0) := Byte (SPI.DR.DR);
   end Transfer;

end STM32GD.SPI.Peripheral;
