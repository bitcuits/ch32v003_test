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



#$(call FRAMEWORK_DSTEP,ch32v00x)
#$(call FRAMEWORK_DSTEP,ch32v10x)

#DFILES:=$(DFILES:.h=.d)

DFILES:=wch/ch32v00x/ch32v00x_tim.d 

%/.way: 
	@mkdir -p $*
	touch $@



include dstep.dep.mk
include dstep.files.mk
WAYS+=$(sort $(dir $(DSTEP_FILES)))

wch/%.d:
	@echo "$< --> $@"

ways: $(addsuffix .way,$(WAYS))

dstep: ways
dstep:$(DSTEP_FILES)

proper-ways:
	$(PRECMD)
	rm -fR wch

