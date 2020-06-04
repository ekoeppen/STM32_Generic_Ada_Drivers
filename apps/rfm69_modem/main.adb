with Modem;

procedure Main is
begin
   if Modem.Init then
      Modem.Run;
   else
      Modem.Error;
   end if;
end Main;
