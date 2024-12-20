LIBROOT?=$(abspath $(REPOROOT)/framework-wch-noneos-sdk/)

MODULES+=-DCH32V003F4 
MODULES+=-DCH32V00X 
MODULES+=-DCH32V00x 
MODULES+=-DCH32V003 

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
LIBSRC+=System/ch32v00x/system_ch32v00x.c
LIBASM+=Startup/startup_ch32v00x.S

LIBOBJ:=$(LIBSRC:.c=.o)
LIBOBJ+=$(LIBASM:.S=.o)
LIBOBJ:=$(addprefix $(BUILD)/,$(LIBOBJ))
#LIBSRC:=$(addprefix $(LIBROOT)/,$(LIBSRC))

LIBFILE:=$(BUILD)/libch32v00x.a

INC+=$(LIBROOT)/Core/ch32v00x 
INC+=$(LIBROOT)/Peripheral/ch32v00x/inc 
INC+=$(LIBROOT)/Startup 
INC+=$(LIBROOT)/System/ch32v00x

test33:
	@echo $(LIBROOT)
