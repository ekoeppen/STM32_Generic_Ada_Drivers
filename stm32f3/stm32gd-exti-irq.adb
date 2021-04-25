------------------------------------------------------------------------------
--                                                                          --
--                    Copyright (C) 2015, AdaCore                           --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of STMicroelectronics nor the names of its       --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
--                                                                          --
--  This file is based on:                                                  --
--                                                                          --
--   @file    stm32f407xx.h   et al.                                        --
--   @author  MCD Application Team                                          --
--   @version V1.1.0                                                        --
--   @date    19-June-2014                                                  --
--   @brief   CMSIS STM32F407xx Device Peripheral Access Layer Header File. --
--                                                                          --
--   COPYRIGHT(c) 2014 STMicroelectronics                                   --
------------------------------------------------------------------------------

--  This file provides register definitions for the STM32F4 (ARM Cortex M4F)
--  microcontrollers from ST Microelectronics.

with STM32_SVD; use STM32_SVD;
with STM32_SVD.EXTI; use STM32_SVD.EXTI;

package body STM32GD.EXTI.IRQ is

   protected body IRQ_Handler is

      entry Wait when Triggered is
      begin
         Triggered := False;
      end Wait;

      procedure Cancel is
      begin
         Triggered := True;
      end Cancel;

      function Status (Line : External_Line_Number) return Boolean is
      begin
         case Line is
            when EXTI_Line_0 .. EXTI_Line_22 =>
               return EXTI_Status_1.PR.Arr (Line'Enum_Rep) = 1;
            when EXTI_Line_29 .. EXTI_Line_31 =>
               return EXTI_Status_1.PR_1.Arr (Line'Enum_Rep - 29) = 1;
            when EXTI_Line_32 .. EXTI_Line_35 =>
               return EXTI_Status_2.PR.Arr (Line'Enum_Rep - 16) = 1;
         end case;
      end Status;

      procedure Reset_Status (Line : External_Line_Number) is
      begin
         case Line is
            when EXTI_Line_0 .. EXTI_Line_22 =>
               EXTI_Status_1.PR.Arr (Line'Enum_Rep) := 0;
            when EXTI_Line_29 .. EXTI_Line_31 =>
               EXTI_Status_1.PR_1.Arr (Line'Enum_Rep - 29) := 0;
            when EXTI_Line_32 .. EXTI_Line_35 =>
               EXTI_Status_2.PR.Arr (Line'Enum_Rep - 16) := 0;
         end case;
      end Reset_Status;

      procedure Handler is
      begin
         EXTI_Status_1 := EXTI_Periph.PR1;
         EXTI_Periph.PR1.PR.Val := 2#111_1111_1111_1111_1111_1111#;
         EXTI_Periph.PR1.PR_1.Val := 2#111#;
         EXTI_Status_2 := EXTI_Periph.PR2;
         EXTI_Periph.PR2.PR.Val := 2#11#;
         Triggered := True;
      end Handler;

   end IRQ_Handler;


end STM32GD.EXTI.IRQ;
