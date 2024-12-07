.SUFFIXES:
.ONESHELL:
export REPOROOT ::= $(shell git rev-parse --show-toplevel)

include config.tools.mk

BUILD?=build

FIRMWARE:=$(BUILD)/firmware.elf
MAPFILE:=$(BUILD)/system_startup.map

CFILES+=src/debug.c
CFILES+=src/main.c
INC+=src/include
OBJ:=$(CFILES:.c=.o)
OBJ:=$(notdir $(OBJ))
OBJ:=$(addprefix $(BUILD)/,$(OBJ)) 

include config.system.mk

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

#
# Link firmware
#
LDFLAGS+=-Wl,-gc-sections 
LDFLAGS+=--specs=nano.specs
LDFLAGS+=--specs=nosys.specs
LDFLAGS+=-nostartfiles
LDFLAGS+=-Wl,-Map="$(MAPFILE)" 

LDSTART_GROUP:=-Wl,--start-group 
LDSTART_END:=-Wl,--end-group


RISCVTYPE=-march=rv32ecxw -mabi=ilp32e 


INC+=src/include 


WAYS+=$(sort $(dir $(LIBOBJ)))

all: firmware 
	

%/.way: 
	@mkdir -p $*
	touch $@

objs: ways
objs: $(OBJ) $(LIBOBJ)

ways: $(addsuffix .way,$(WAYS))

$(BUILD)/%.o: $(LIBROOT)/%.c
	$(CROSSCC) $(CFLAGS) $(RISCVTYPE) $(MODULES) $(addprefix -I,$(INC)) -o $@ -c $<

$(BUILD)/%.o: $(LIBROOT)/%.S
	$(CROSSCC) $(CFLAGS) $(RISCVTYPE) $(MODULES) $(addprefix -I,$(INC)) -o $@ -c $<

$(BUILD)/%.o: src/%.c
	$(CROSSCC) $(CFLAGS) $(RISCVTYPE) $(MODULES) $(addprefix -I,$(INC)) -o $@ -c $<

$(LIBFILE): $(LIBOBJ)
	$(CROSSAR) rc $@ $?
	$(RANLIB) $@

$(FIRMWARE): lib objs 
	$(CROSSCC) -o $@ -T $(LINKASM) -Os $(RISCVTYPE) -ffunction-sections -fdata-sections $(LDFLAGS) $(OBJ) -Lbuild $(LDSTART_GROUP) -lm $(LIBFILE) $(LDEND_GROUP) 

lib: ways
lib: $(LIBFILE)

.PHONY: lib

openocd: $(FIRMWARE) 
	$(OPENOCD) -c "debug_level 2" -s $(WCHTOOLS) -s $(OPENOCD_SCRIPT) -f wch-riscv.cfg -c "gdb_port 3333; tcl_port disabled; telnet_port disabled" -c init -c halt -c "program {$<} verify reset" -c shutdown

.PHONY: openocd

firmware: $(FIRMWARE)
.PHONY: firmware 

env:
	@echo LIBOBJ=$(LIBOBJ)
	@echo OBJ=$(OBJ)
	@echo SRC=$(CFILES)
	@echo INC=$(INC)
	@echo WAYS=$(WAYS)
	@echo LIBROOT=$(LIBROOT)

env-dir:
	@echo $(dir $(LIBOBJ))

clean:
	@rm -fR $(BUILD)


