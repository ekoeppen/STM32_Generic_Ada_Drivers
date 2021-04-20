#!/bin/bash

examples="empty delay blink"
boards="nucleo_f072rb nucleo_f103rb nucleo_f303re stm32f411e-disco"

for e in ${examples}; do
	cd "${ADA_STM32_GD}/examples/${e}"
	for b in ${boards}; do
		echo "#### Building ${e} for board ${b}"
		if ! gprbuild -p  -P "${ADA_STM32_GD}/boards/${b}/board.gpr"; then
			echo "**** Compilation of ${e} for ${b} failed."
			exit 1
		fi
	done
done
