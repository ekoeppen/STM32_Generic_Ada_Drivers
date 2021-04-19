with Ada.Real_Time; use Ada.Real_Time;

package Tasks is

    protected Protect is
       procedure Go;
       entry Wait;
    private
       Active : Boolean := False;
    end Protect;

    task T with Storage_Size => 512;

end Tasks;
