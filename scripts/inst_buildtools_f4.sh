#!/bin/bash

#   Copyright (C) 2017 by Andy Uribe CA6JAU

#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

cd ~
sudo mount -o remount,rw /
sudo mount -o remount,rw /boot

# Install the necessary software tools
sudo apt-get update
sudo apt-get install git gcc-arm-none-eabi gdb-arm-none-eabi autoconf libtool pkg-config libusb-1.0-0 libusb-1.0-0-dev libstdc++-arm-none-eabi-newlib﻿-y

# Install OpenOCD
cd ~
git clone https://github.com/ntfreak/openocd
cd openocd
./bootstrap
./configure
make
sudo make install

# Remove libi2c-dev package for stm32flash installation
sudo apt-get remove libi2c-dev -y

# Remove old stm32flash
sudo apt-get remove stm32flash -y

# Download and compile serial flashing utilities
cd ~
git clone https://github.com/jsnyder/stm32ld
cd stm32ld
make
sudo cp stm32ld /usr/local/bin

# Install the latest stm32flash
cd ~
git clone https://git.code.sf.net/p/stm32flash/code stm32flash
cd stm32flash
make
sudo make install

# Remove downloaded programs
cd ~
rm -rf stm32flash
rm -rf stm32ld
rm -rf openocd

# Download the firmware sources
cd ~
git clone https://github.com/g4klx/MMDVM
cd MMDVM
git clone https://github.com/juribeparada/STM32F4XX_Lib

