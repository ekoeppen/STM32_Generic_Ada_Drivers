MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 64K
  RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 16K
}

ENTRY(Reset_Handler)

SECTIONS
{
    .text :
    {
        LONG(0x20004000)
        KEEP(*(.isr_vector))
        *(.text*)

        *(.rodata*)
    } > FLASH

    __etext = .;

    .data : AT (__etext)
    {
        __data_start__ = .;
        *(.data*)
        . = ALIGN(4);
        __data_end__ = .;

    } > RAM

    .bss :
    {
        . = ALIGN(4);
        __bss_start__ = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        __bss_end__ = .;
    } > RAM
}
