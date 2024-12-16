.SUFFIXES:
.ONESHELL:

FRAMEWORK_WCH:=framework-wch-noneos-sdk/Peripheral
DSTEP_LIST+=$(shell find framework-wch-noneos-sdk/Peripheral/$1/inc -name "*.h" -printf "%P\n")


MODULES+=ch32v00x
MODULES+=ch32v10x
MODULES+=ch32v20x
MODULES+=ch32v30x
MODULES+=ch57x
MODULES+=ch58x
MODULES+=ch58x

X:=$(foreach file,$(MODULES), $(call DSTEP_LIST,$(file)))

test33:
	@echo X=$(X)


define FRAMEWORK_DSTEP
${eval
HFILES+=$(shell find $(realpath $(FRAMEWORK_WCH)/$1/inc) -name "*.h" -printf "%p ")
_dfiles+=$(shell find $(realpath $(FRAMEWORK_WCH)/$1/inc) -name "*.h" -printf "%P ")
DFILES+=$(addprefix wch/$1/,$(_dfiles))

DST:=wch/$1 
SRC:=$(FRAMEWORK_WCH)/$1/inc

wch/$1/%.d:  
	@echo $(realpath $(FRAMEWORK_WCH)/$1/inc) 
	@echo SRC=$(SRC)
	@echo DST=$(DST)
	@echo $$@ $$< 
}
endef

define DSTEP 
$(eval
HFILES+=$(shell find $(realpath $(FRAMEWORK_WCH)/$1/inc) -name "*.h" -printf "%p ")
_dfiles+=$(shell find $(realpath $(FRAMEWORK_WCH)/$1/inc) -name "*.h" -printf "%P ")
DFILES+=$(addprefix wch/$1/,$(_dfiles))
$1/%.d: $2/%.h 
	@echo 2 $2
	@echo $$(DST)
	@echo $$@ $$<
)
endef


#$(call FRAMEWORK_DSTEP,ch32v00x)
#$(call FRAMEWORK_DSTEP,ch32v10x)

#DFILES:=$(DFILES:.h=.d)

DFILES:=wch/ch32v00x/ch32v00x_tim.d 

#$(call DSTEP,wch/ch32v00x,$(FRAMEWORK_WCH)/ch32v00x/inc)

#$(call DSTEP,wch/ch32v00x,$(FRAMEWORK_WCH)/ch32v00x/inc)

test34:
	@echo HFILES=$(HFILES)

test35:
	@echo DFILES=$(DFILES)


test36: $(DFILES)

test37: dstep.dep.mk
	
#X:=$(foreach mod,$(MODULES),$(shell find $(FRAMEWORK_WCH)/$(mod)/inc -name "*.h" -printf "wch/$(mod)/%P:%p")) 


include dstep.dep.mk
include dstep.files.mk

wch/%.d:
	@echo "$< --> $@"

test38:$(DSTEP_FILES)


