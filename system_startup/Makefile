.SUFFIXES:
.ONESHELL:
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
export REPOROOT ::= $(dir $(mkfile_path))
#export PATHvw vwww/home/carsten/./packages/toolchain-riscv/bin/:$(PATH)
TOOLS?=/home/carsten/.platformio/packages/toolchain-riscv/bin
WCHTOOLS?=/home/carsten/.platformio/packages/tool-openocd-riscv-wch/bin

CROSSCC?=$(TOOLS)/riscv-none-embed-gcc
CROSSAR?=$(TOOLS)/riscv-none-embed-gcc-ar
RANLIB?=$(TOOLS)/riscv-none-embed-gcc-ranlib
OPENOCD?=$(WCHTOOLS)/openocd 
BUILD?=build

FIRMWARE:=$(BUILD)/firmware.elf
LINKFILE:=.pio/build/ch32v003f4p6_evt_r0/Link.ld 
#FIRMWARE:=/home/carsten/work/ch32v003_test/system_startup/.pio/build/ch32v003f4p6_evt_r0/Link.ld

#riscv-none-embed-gcc -o .pio/build/ch32v003f4p6_evt_r0/FrameworkNoneOSCore/core_riscv.o -c -std=gnu99 -Os -g -Wall -msmall-data-limit=0 -msave-restore -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -Wno-comment -march=rv32ecxw -mabi=ilp32e -DPLATFORMIO=60116 -DCH32V003F4 -DCH32V00X -DCH32V00x -DCH32V003 -Isrc/include -I/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Core/ch32v00x -I/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Peripheral/ch32v00x/inc -I/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Peripheral/ch32v00x/src -I/home/carsten/.platformio/packages/framework-wch-noneos-sdk/Startup -I/home/carsten/.platformio/packages/framework-wch-noneos-sdk/System/ch32v00x /home/carsten/.platformio/packages/framework-wch-noneos-sdk/Core/ch32v00x/core_riscv.c
CFILES+=src/debug.c
CFILES+=src/main.c
INC+=src/include
OBJ:=$(CFILES:.c=.o)
OBJ:=$(notdir $(OBJ))
OBJ:=$(addprefix $(BUILD)/,$(OBJ)) 


LIBROOT?=framework-wch-noneos-sdk/
#System/ch32v00x/system_ch32v00x.c

LIBSRC+=System/ch32v00x/system_ch32v00x.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_adc.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_dbgmcu.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_dma.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_exti.c
LIBSRC+=Peripheral/ch32v00x/src/ch32v00x_flash.c
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
LIBSRC+=Core/ch32v00x/core_riscv.c
LIBASM+=Startup/startup_ch32v00x.S


LIBOBJ:=$(LIBSRC:.c=.o)
LIBOBJ+=$(LIBASM:.S=.o)
LIBOBJ:=$(addprefix $(BUILD)/,$(LIBOBJ))
#LIBSRC:=$(addprefix $(LIBROOT)/,$(LIBSRC))

LIBFILE:=$(BUILD)/libch32v00x.a

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
INC+=framework-wch-noneos-sdk/Core/ch32v00x 
INC+=framework-wch-noneos-sdk/Peripheral/ch32v00x/inc 
INC+=framework-wch-noneos-sdk/Peripheral/ch32v00x/src 
INC+=framework-wch-noneos-sdk/Startup 
INC+=framework-wch-noneos-sdk/System/ch32v00x

#riscv-none-embed-gcc -o .pio/build/ch32v003f4p6_evt_r0/firmware.elf -T /home/carsten/work/ch32v003_test/system_startup/.pio/build/ch32v003f4p6_evt_r0/Link.ld -Os -march=rv32ecxw -mabi=ilp32e -ffunction-sections -fdata-sections -Wl,-gc-sections --specs=nano.specs --specs=nosys.specs -nostartfiles -Wl,-Map="/home/carsten/work/ch32v003_test/system_startup/.pio/build/ch32v003f4p6_evt_r0/system_startup.map" .pio/build/ch32v003f4p6_evt_r0/FrameworkNoneOSCore/core_riscv.o .pio/build/ch32v003f4p6_evt_r0/FrameworkNoneOSStartup/startup_ch32v00x.o .pio/build/ch32v003f4p6_evt_r0/FrameworkNoneOSSSystem/system_ch32v00x.o .pio/build/ch32v003f4p6_evt_r0/src/debug.o .pio/build/ch32v003f4p6_evt_r0/src/main.o -L.pio/build/ch32v003f4p6_evt_r0 -Wl,--start-group -lm .pio/build/ch32v003f4p6_evt_r0/libFrameworkNoneOSVariant.a -Wl,--end-group

LDFLAGS+=-Wl,-gc-sections 
LDFLAGS+=--specs=nano.specs
LDFLAGS+=--specs=nosys.specs
LDFLAGS+=-nostartfiles
LDFLAGS+=-Wl,-Map="build/system_startup.map" 
LDSTART_GROUP:=-Wl,--start-group 
LDSTART_END:=-Wl,--end-group


WAYS+=$(sort $(dir $(LIBOBJ)))

lib: ways
lib: $(LIBFILE)
.PHONY: lib

%/.way: 
	@mkdir -p $*
	touch $@

objs: ways
objs: $(OBJ) $(LIBOBJ)

ways: $(addsuffix .way,$(WAYS))


link: ways
link: $(OBJ) $(LIBFILE)
	$(CROSSCC) -o $(FIRMWARE) -T $(LINKFILE) $(LDFLAGS) $(OBJ) $(LDSTART_GROUP) -lm $(LIBFILE) $(LDSTART_END)  

$(BUILD)/%.o: $(LIBROOT)/%.c
	$(CROSSCC) $(CFLAGS) $(RISCVTYPE) $(MODULES) $(addprefix -I,$(INC)) -o $@ -c $<

$(BUILD)/%.o: $(LIBROOT)/%.S
	$(CROSSCC) $(CFLAGS) $(RISCVTYPE) $(MODULES) $(addprefix -I,$(INC)) -o $@ -c $<

$(BUILD)/%.o: src/%.c
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

env-objs:
	@echo $(OBJ)

clean:
	@rm -fR $(BUILD)

link1: objs lib
	$(CROSSAR) rc build/libch32v00x.a build/Peripheral/ch32v00x/src/ch32v00x_adc.o build/Peripheral/ch32v00x/src/ch32v00x_dbgmcu.o build/Peripheral/ch32v00x/src/ch32v00x_dma.o build/Peripheral/ch32v00x/src/ch32v00x_exti.o build/Peripheral/ch32v00x/src/ch32v00x_flash.o build/Peripheral/ch32v00x/src/ch32v00x_gpio.o build/Peripheral/ch32v00x/src/ch32v00x_i2c.o build/Peripheral/ch32v00x/src/ch32v00x_iwdg.o build/Peripheral/ch32v00x/src/ch32v00x_misc.o build/Peripheral/ch32v00x/src/ch32v00x_opa.o build/Peripheral/ch32v00x/src/ch32v00x_pwr.o build/Peripheral/ch32v00x/src/ch32v00x_rcc.o build/Peripheral/ch32v00x/src/ch32v00x_spi.o build/Peripheral/ch32v00x/src/ch32v00x_tim.o build/Peripheral/ch32v00x/src/ch32v00x_usart.o build/Peripheral/ch32v00x/src/ch32v00x_wwdg.o


ranlib1: link1
	$(RANLIB) build/libch32v00x.a



doit1: ranlib1
	$(CROSSCC) -o build/firmware.elf -T /home/carsten/work/ch32v003_test/system_startup/.pio.parked/build/ch32v003f4p6_evt_r0/Link.ld -Os -march=rv32ecxw -mabi=ilp32e -ffunction-sections -fdata-sections -Wl,-gc-sections --specs=nano.specs --specs=nosys.specs -nostartfiles -Wl,-Map="build/system_startup.map" build/Core/ch32v00x/core_riscv.o build/Startup/startup_ch32v00x.o build/System/ch32v00x/system_ch32v00x.o build/debug.o build/main.o -Lbuild -Wl,--start-group -lm build/libch32v00x.a -Wl,--end-group


doit22:
	$(CROSSCC) -o build/firmware.elf -T /home/carsten/work/ch32v003_test/system_startup/.pio/build/ch32v003f4p6_evt_r0/Link.ld -Os -march=rv32ecxw -mabi=ilp32e -ffunction-sections -fdata-sections -Wl,-gc-sections --specs=nano.specs --specs=nosys.specs -nostartfiles -Wl,-Map="/home/carsten/work/ch32v003_test/system_startup/.pio/build/ch32v003f4p6_evt_r0/system_startup.map" .pio/build/ch32v003f4p6_evt_r0/FrameworkNoneOSCore/core_riscv.o .pio/build/ch32v003f4p6_evt_r0/FrameworkNoneOSStartup/startup_ch32v00x.o .pio/build/ch32v003f4p6_evt_r0/FrameworkNoneOSSSystem/system_ch32v00x.o build/debug.o build/main.o -Lbuild -Wl,--start-group -lm $(LIBFILE) -Wl,--end-group

openocd: doit1
	$(OPENOCD) -c "debug_level 2" -s /home/carsten/.platformio/packages/tool-openocd-riscv-wch/bin -s /home/carsten/.platformio/packages/tool-openocd-riscv-wch/scripts -f wch-riscv.cfg -c "gdb_port 3333; tcl_port disabled; telnet_port disabled" -c init -c halt -c "program {build/firmware.elf} verify reset" -c shutdown

