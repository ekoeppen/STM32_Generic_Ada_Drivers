#!/bin/bash

examples="empty delay blink"
examples="empty delay blink timer"
stm32f0_examples="stm32f0/dma stm32f0_spi"
boards="nucleo_f072rb nucleo_f103rb nucleo_f303re stm32f411e-disco"

for e in ${examples}; do
	cd "${ADA_STM32_GD}/examples/${e}"
	for b in ${boards}; do
		echo "#### Building ${e} for board ${b}"
		if ! gprbuild -q -p -P "${ADA_STM32_GD}/boards/${b}/board.gpr"; then
			echo "**** Compilation of ${e} for ${b} failed."
			exit 1
		fi
	done
done


for e in ${stm32f0_examples}; do
	cd "${ADA_STM32_GD}/examples/${e}"
	b="nucleo_f072rb"
	echo "#### Building ${e} for board ${b}"
	if ! gprbuild -q -p -P "${ADA_STM32_GD}/boards/${b}/board.gpr"; then
		echo "**** Compilation of ${e} for ${b} failed."
		exit 1
	fi
done
