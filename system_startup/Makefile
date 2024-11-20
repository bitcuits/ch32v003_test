.SUFFIXES:
.ONESHELL:
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
export REPOROOT ::= $(dir $(mkfile_path))
#export PATHvw vwww/home/carsten/./packages/toolchain-riscv/bin/:$(PATH)
TOOLS?=/home/carsten/.platformio/packages/toolchain-riscv/bin

CROSSCC?=$(TOOLS)/riscv-none-embed-gcc
CROSSAR?=$(TOOLS)/riscv-none-embed-gcc-ar
RANLIB?=$(TOOLS)/riscv-none-embed-gcc-ranlib

BUILD?=build


#riscv-none-embed-gcc -o .pio/build/ch32v003f4p6_evt_r0/FrameworkNoneOSCore/core_riscv.o -c -std=gnu99 -Os -g -Wall -msmall-data-limit=0 -msave-restore -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -Wno-comment -march=rv32ecxw -mabi=ilp32e -DPLATFORMIO=60116 -DCH32V003F4 -DCH32V00X -DCH32V00x -DCH32V003 -Isrc/include -I/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Core/ch32v00x -I/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Peripheral/ch32v00x/inc -I/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Peripheral/ch32v00x/src -I/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Startup -I/home/carsten/.platformio/packages/framework-wch-noneos-sdk/System/ch32v00x /home/carsten/.platformio/packages/framework-wch-noneos-sdk/Core/ch32v00x/core_riscv.c

CFILES+=src/debug.c
CFILES+=src/main.c

LIBROOT?=/home/carsten/.platformio/packages/framework-wch-noneos-sdk/
#System/ch32v00x/system_ch32v00x.c

LIBSRC+=System/ch32v00x/system_ch32v00x.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_adc.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_dbgmcu.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_dma.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_exti.c
rIBSRC+=Peripheral/ch32v00x/src/ch32v00x_flash.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_gpio.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_i2c.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_iwdg.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_misc.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_opa.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_pwr.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_rcc.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_spi.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_tim.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_usart.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_wwdg.c


LIBOBJ:=$(LIBSRC:.c=.o)
LIBOBJ:=$(addprefix $(BUILD)/,$(LIBOBJ))
#LIBSRC:=$(addprefix $(LIBROOT)/,$(LIBSRC))

LIBFILE:=$(BUILD)/libc32v00x.a

CFLAGS+=-std=gnu99 
CFLAGS+=-Os 
CFLAGS+=-g 
CFLAGS+=-Wall 
CFLAGS+=-msmall-data-limit=0 
CFLAGS+=-msave-restore 
CFLAGS+=-fmessage-length=0 
CFLAGS+=-fsigned-char 
CFLAGS+=-ffunction-sections 
CFLAGS+=-fdata-sections 
CFLAGS+=-fno-common 
CFLAGS+=-Wunused 
CFLAGS+=-Wuninitialized 
CFLAGS+=-Wno-comment 

BLDSTARTGROUP+=-Wl,--start-group -lm
LDENDGROUP+=-Wl,--end-group

LDPATH+=$(BUILD)/ch32v003f4p6_evt_r0 
RISCVTYPE=-march=rv32ecxw -mabi=ilp32e 

MODULES+=-DCH32V003F4 
MODULES+=-DCH32V00X 
MODULES+=-DCH32V00x 
MODULES+=-DCH32V003 

INC+=src/include 
INC+=/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Core/ch32v00x 
INC+=/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Peripheral/ch32v00x/inc 
INC+=/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Peripheral/ch32v00x/src 
INC+=/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Startup 
INC+=/home/carsten/.platformio/packages/framework-wch-noneos-sdk/System/ch32v00x

WAYS+=$(sort $(dir $(LIBOBJ)))

lib: ways
lib: $(LIBFILE)
.PHONY: lib

%/.way: 
	@mkdir -p $*
	touch $@

ways: $(addsuffix .way,$(WAYS))

$(BUILD)/%.o: $(LIBROOT)/%.c
	$(CROSSCC) $(CFLAGS) $(RISCVTYPE) $(MODULES) $(addprefix -I,$(INC)) -o $@ -c $<


$(BUILD)/%.o: %.c
	$(CROSSCC) $(CFLAGS) $(RISCVTYPE) $(MODULES) $(addprefix -I,$(INC)) -o $@ -c $<


$(LIBFILE): $(LIBOBJ)
	$(CROSSAR) rc $@ $<
	$(RANLIB) $@

env:
	@echo $(LIBOBJ)

env-src:
	@echo $(LIBSRC)

env-dir:
	@echo $(dir $(LIBOBJ))

env-ways:
	@echo $(WAYS)

env-wayss:
	@echo $(addsuffix .way,$(WAYS))

clean:
	@rm -fR $(BUILD)


