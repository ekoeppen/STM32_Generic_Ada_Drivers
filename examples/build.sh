#!/bin/bash

examples="empty delay blink"
boards="nucleo_f072rb nucleo_f103rb nucleo_f303re"

for e in ${examples}; do
	cd "${ADA_STM32_GD}/examples/${e}"
	for b in ${boards}; do
		echo "#### Building ${e} for board ${b}"
		gprbuild -p  -P "${ADA_STM32_GD}/boards/${b}/board.gpr"
	done
done
