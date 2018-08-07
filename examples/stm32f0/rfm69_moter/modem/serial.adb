with STM32_SVD;                    use STM32_SVD;
with STM32_SVD.USART;              use STM32_SVD.USART;
with STM32GD.USART;                use STM32GD.USART;
with STM32GD.Board;
with Peripherals;
with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Interrupts;
with Ada.Interrupts.Names;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Blink;

package body Serial is

   task Serial_Task with Storage_Size => 384;

   ----------------------------------------------------------------------------

   protected body Input is
      entry Read (Data : out Serial_Data) when Ready is
      begin
         Data.Data := Buffer.Data;
         Data.Length := Buffer.Length - 1;
         Ready := False;
      end Read;

      function Is_Ready return Boolean is
      begin
         return Ready;
      end Is_Ready;

      procedure Set_Ready (Line : Serial_Data) is
      begin
         Buffer := Line;
         Ready := True;
      end Set_Ready;
   end Input;

   package body Output is
      procedure Write (Data : in USART_Data; Length : in Natural) is
      begin
         Peripherals.USART.DMA_Transmit (Data, Length);
      end Write;

      procedure Write (Character : in Byte) is
      begin
         Peripherals.USART.Transmit (Character);
      end Write;
   end Output;

   ----------------------------------------------------------------------------

   task body Serial_Task is
      Buffer : Serial_Data;

      procedure Wait_For_Packet is
         C1 : Byte;
         C2 : Byte;
      begin
         loop
            C1 := Peripherals.USART.DMA_Receive;
            C2 := Peripherals.USART.DMA_Receive;
            exit when C1 = 16#10# and C2 = 16#02#;
         end loop;
      end Wait_For_Packet;

      procedure Read_Packet is
         C : Byte;
      begin
         loop
            C := Peripherals.USART.DMA_Receive;
            if C /= 16#10# then
               Buffer.Data (Buffer.Length) := C;
               Buffer.Length := Buffer.Length + 1;
            else
               C := Peripherals.USART.DMA_Receive;
               if C = 16#10# then
                  Buffer.Data (Buffer.Length) := C;
                  Buffer.Length := Buffer.Length + 1;
               else
                  exit when C = 16#03#;
               end if;
            end if;
         end loop;
      end Read_Packet;

   begin
      Blink.Blink_Parameters.Increase_Blink_Count (Blink.Green);
      loop
         Buffer.Length := Buffer.Data'First;
         Wait_For_Packet;
         Read_Packet;
         Input.Set_Ready (Buffer);
      end loop;
   end Serial_Task;

end Serial;
