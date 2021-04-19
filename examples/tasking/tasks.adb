with STM32GD.Board; use STM32GD.Board;

package body Tasks is

    protected body Protect is
       procedure Go is
       begin
          Active := True;
       end Go;

       entry Wait when Active is
       begin
          Active := False;
       end Wait;
    end Protect;

    task body T is
    begin
       loop
          Protect.Wait;
          Text_IO.Put_Line ("Subtask T running");
       end loop;
    end T;

end Tasks;
