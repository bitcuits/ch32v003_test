
TOOLS?=$(REPOROOT)/toolchain-riscv-linux/bin
WCHTOOLS?=/home/carsten/.platformio/packages/tool-openocd-riscv-wch/bin
LINKASM?=/home/carsten/work/ch32v003_test/system_startup/.pio.parked/build/ch32v003f4p6_evt_r0/Link.ld 

ifdef LLVM
CROSSCC?=clang
else
CROSSCC?=$(TOOLS)/riscv-none-embed-gcc
endif
CROSSLD?=$(TOOLS)/riscv-none-embed-gcc
CROSSAR?=$(TOOLS)/riscv-none-embed-gcc-ar
RANLIB?=$(TOOLS)/riscv-none-embed-gcc-ranlib
OPENOCD?=$(WCHTOOLS)/openocd 
OPENOCD_SCRIPT:=/home/carsten/.platformio/packages/tool-openocd-riscv-wch/scripts 

DC?=ldc2
