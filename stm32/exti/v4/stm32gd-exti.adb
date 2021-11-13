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
with STM32_SVD.EXTI;
with STM32_SVD.SYSCFG; use STM32_SVD.SYSCFG;

package body STM32GD.EXTI is

   type Untyped_Register is array (0 .. 31) of Bit
      with
         Component_Size => 1;

   --  External interrupt/event controller
   type EXTI_Peripheral is record
      IMR1   : aliased Untyped_Register;
      EMR1   : aliased Untyped_Register;
      RTSR1  : aliased Untyped_Register;
      FTSR1  : aliased Untyped_Register;
      SWIER1 : aliased Untyped_Register;
      PR1    : aliased Untyped_Register;
      IMR2   : aliased Untyped_Register;
      EMR2   : aliased Untyped_Register;
      RTSR2  : aliased Untyped_Register;
      FTSR2  : aliased Untyped_Register;
      SWIER2 : aliased Untyped_Register;
      PR2    : aliased Untyped_Register;
   end record
     with Volatile;

   for EXTI_Peripheral use record
      IMR1   at 16#0# range 0 .. 31;
      EMR1   at 16#4# range 0 .. 31;
      RTSR1  at 16#8# range 0 .. 31;
      FTSR1  at 16#C# range 0 .. 31;
      SWIER1 at 16#10# range 0 .. 31;
      PR1    at 16#14# range 0 .. 31;
      IMR2   at 16#18# range 0 .. 31;
      EMR2   at 16#1C# range 0 .. 31;
      RTSR2  at 16#20# range 0 .. 31;
      FTSR2  at 16#24# range 0 .. 31;
      SWIER2 at 16#28# range 0 .. 31;
      PR2    at 16#2C# range 0 .. 31;
   end record;

   EXTI_Periph : aliased EXTI_Peripheral
      with Import, Address => STM32_SVD.EXTI.EXTI_Periph'Address;

   procedure Connect_External_Interrupt (Pin: UInt4; Port_Index: UInt4) is
      subtype Pin_0_3 is Integer range 0 .. 3;
      subtype Pin_4_7 is Integer range 4 .. 7;
      subtype Pin_8_11 is Integer range 8 .. 11;
      subtype Pin_12_15 is Integer range 12 .. 15;
   begin
      case Pin is
         when 0 .. 3 =>
            SYSCFG_Periph.EXTICR1.EXTI.Arr (Pin_0_3 (Pin)) := Port_Index;
         when 4 .. 7 =>
            SYSCFG_Periph.EXTICR2.EXTI.Arr (Pin_4_7 (Pin)) := Port_Index;
         when 8 .. 11 =>
            SYSCFG_Periph.EXTICR3.EXTI.Arr (Pin_8_11 (Pin)) := Port_Index;
         when 12 .. 15 =>
            SYSCFG_Periph.EXTICR4.EXTI.Arr (Pin_12_15 (Pin)) := Port_Index;
         when others =>
            raise Program_Error;
      end case;
   end Connect_External_Interrupt;

   -------------------------------
   -- Enable_External_Interrupt --
   -------------------------------

   procedure Enable_External_Interrupt
     (Line    : External_Line_Number;
      Trigger : Interrupt_Triggers)
   is
   begin
      EXTI_Periph.IMR1 (Line) := 1;
      EXTI_Periph.RTSR1 (Line) :=
        (if Trigger in Interrupt_Rising_Edge  | Interrupt_Rising_Falling_Edge then 1 else 0);
      EXTI_Periph.FTSR1 (Line) :=
        (if Trigger in Interrupt_Falling_Edge | Interrupt_Rising_Falling_Edge then 1 else 0);
   end Enable_External_Interrupt;

   --------------------------------
   -- Disable_External_Interrupt --
   --------------------------------

   procedure Disable_External_Interrupt (Line : External_Line_Number) is
      Index : constant Natural := External_Line_Number'Pos (Line);
   begin
      EXTI_Periph.IMR1 (Line)  := 0;
      EXTI_Periph.RTSR1 (Line) := 0;
      EXTI_Periph.FTSR1 (Line) := 0;
   end Disable_External_Interrupt;

   ---------------------------
   -- Enable_External_Event --
   ---------------------------

   procedure Enable_External_Event
     (Line    : External_Line_Number;
      Trigger : Event_Triggers)
   is
      Index : constant Natural := External_Line_Number'Pos (Line);
   begin
      EXTI_Periph.EMR1 (Line)  := 1;
      EXTI_Periph.RTSR1 (Line) :=
        (if Trigger in Interrupt_Rising_Edge  | Interrupt_Rising_Falling_Edge then 1 else 0);
      EXTI_Periph.FTSR1 (Line) :=
        (if Trigger in Interrupt_Falling_Edge | Interrupt_Rising_Falling_Edge then 1 else 0);
   end Enable_External_Event;

   ----------------------------
   -- Disable_External_Event --
   ----------------------------

   procedure Disable_External_Event (Line : External_Line_Number) is
      Index : constant Natural := External_Line_Number'Pos (Line);
   begin
      EXTI_Periph.EMR1 (Line)  := 0;
      EXTI_Periph.RTSR1 (Line) := 0;
      EXTI_Periph.FTSR1 (Line) := 0;
   end Disable_External_Event;

   ------------------
   -- Generate_SWI --
   ------------------

   procedure Generate_SWI (Line : External_Line_Number) is
   begin
      EXTI_Periph.SWIER1 (Line) := 1;
   end Generate_SWI;

   --------------------------------
   -- External_Interrupt_Pending --
   --------------------------------

   function External_Interrupt_Pending (Line : External_Line_Number)
     return Boolean is
   begin
      if Line'Enum_Rep < 32 then
         return EXTI_Periph.PR1 (Line) = 1;
      end if;
      return EXTI_Periph.PR2 (Line - 32) = 1;
   end External_Interrupt_Pending;

   ------------------------------
   -- Clear_External_Interrupt --
   ------------------------------

   procedure Clear_External_Interrupt (Line : External_Line_Number) is
   begin
      if Line < 32 then
         EXTI_Periph.PR1 (Line) := 1;
      else
         EXTI_Periph.PR2 (Line - 32) := 1;
      end if;
   end Clear_External_Interrupt;

end STM32GD.EXTI;
