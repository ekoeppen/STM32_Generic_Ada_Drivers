/****************************************************************************
 *                                                                          *
 *                         GNAT COMPILER COMPONENTS                         *
 *                                                                          *
 *                                  A R M                                   *
 *                                                                          *
 *                            Linker Script File                            *
 *                                                                          *
 *      Copyright (C) 1999-2002 Universidad Politecnica de Madrid           *
 *             Copyright (C) 2003-2006 The European Space Agency            *
 *                   Copyright (C) 2003-2018 AdaCore                        *
 *                                                                          *
 * GNAT is free software;  you can  redistribute it  and/or modify it under *
 * terms of the  GNU General Public License as published  by the Free Soft- *
 * ware  Foundation;  either version 2,  or (at your option) any later ver- *
 * sion.  GNAT is distributed in the hope that it will be useful, but WITH- *
 * OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY *
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License *
 * for  more details.  You should have  received  a copy of the GNU General *
 * Public License  distributed with GNAT;  see file COPYING.  If not, write *
 * to  the  Free Software Foundation,  51  Franklin  Street,  Fifth  Floor, *
 * Boston, MA 02110-1301, USA.                                              *
 *                                                                          *
 * As a  special  exception,  if you  link  this file  with other  files to *
 * produce an executable,  this file does not by itself cause the resulting *
 * executable to be covered by the GNU General Public License. This except- *
 * ion does not  however invalidate  any other reasons  why the  executable *
 * file might be covered by the  GNU Public License.                        *
 *                                                                          *
 * GNARL was developed by the GNARL team at Florida State University.       *
 * Extensive contributions were provided by Ada Core Technologies, Inc.     *
 * The  executive  was developed  by the  Real-Time  Systems  Group  at the *
 * Technical University of Madrid.                                          *
 *                                                                          *
 ****************************************************************************/

MEMORY
{
  reset           (rx) :  ORIGIN = 0x08000000,                     LENGTH = 8
  vectors         (rx) :  ORIGIN = 0x08000008,                     LENGTH = 192 - 8
  user            (rx) :  ORIGIN = 0x08000000 + 192,               LENGTH = 65536 - 192 - 2048 - 32
  bootloader_data (rx) :  ORIGIN = 0x08000000 + 65536 - 2048 - 32, LENGTH = 32
  bootloader      (rx) :  ORIGIN = 0x08000000 + 65536 - 2048,      LENGTH = 2048
  ram             (rwx) : ORIGIN = 0x20000000, LENGTH = 8192
}

REGION_ALIAS("sram_tx", ram)
REGION_ALIAS("sram_ro", ram)
REGION_ALIAS("sram_bs", ram)
REGION_ALIAS("sram_da", ram)

REGION_ALIAS("flash", bootloader)

__bootloader_data = ORIGIN(bootloader_data);
__bootloader = ORIGIN(flash);
__page_size = 1024;
