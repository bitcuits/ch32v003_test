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

RISCVTYPELD=-march=rv32ecxw -mabi=ilp32e 
ifdef LLVM 
RISCVTYPE=--target=riscv32 -march=rv32e -mabi=ilp32e
INC+=$(REPOROOT)/toolchain-riscv-linux/riscv-none-embed/include
else
RISCVTYPE=$(RISCVTYPELD) 
endif

