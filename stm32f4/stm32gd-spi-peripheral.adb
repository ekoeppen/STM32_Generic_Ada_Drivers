package body STM32GD.SPI.Peripheral is

   procedure Init is
   begin
      null;
   end Init;

   procedure Transfer (Data : in out SPI_Data_8b) is
   begin
      while not SPI.SR.TXE loop
         null;
      end loop;
      SPI.DR.DR := UInt16 (Data (0));
      while not SPI.SR.RXNE loop
         null;
      end loop;
      Data (0) := UInt8 (SPI.DR.DR);
   end Transfer;

end STM32GD.SPI.Peripheral;
