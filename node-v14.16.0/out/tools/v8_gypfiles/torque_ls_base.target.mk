# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := torque_ls_base
DEFS_Debug := \
	'-DV8_GYP_BUILD' \
	'-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=64' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DV8_TARGET_ARCH_IA32' \
	'-DV8_EMBEDDER_STRING="-node.18"' \
	'-DENABLE_DISASSEMBLER' \
	'-DV8_PROMISE_INTERNAL_FIELD_COUNT=1' \
	'-DENABLE_MINOR_MC' \
	'-DOBJECT_PRINT' \
	'-DV8_INTL_SUPPORT' \
	'-DV8_CONCURRENT_MARKING' \
	'-DV8_ARRAY_BUFFER_EXTENSION' \
	'-DV8_ENABLE_LAZY_SOURCE_POSITIONS' \
	'-DV8_USE_SIPHASH' \
	'-DDISABLE_UNTRUSTED_CODE_MITIGATIONS' \
	'-DV8_WIN64_UNWINDING_INFO' \
	'-DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DISPATCH' \
	'-DV8_SNAPSHOT_COMPRESSION' \
	'-DDEBUG' \
	'-D_DEBUG' \
	'-DV8_ENABLE_CHECKS' \
	'-DVERIFY_HEAP' \
	'-DV8_TRACE_MAPS' \
	'-DV8_ENABLE_ALLOCATION_TIMEOUT' \
	'-DV8_ENABLE_FORCE_SLOW_PATH' \
	'-DENABLE_HANDLE_ZAPPING'

# Flags passed to all source files.
CFLAGS_Debug := \
	-pthread \
	-Wno-unused-parameter \
	-m32 \
	-Wno-return-type \
	-msse2 \
	-mfpmath=sse \
	-mmmx \
	-fno-strict-aliasing \
	-m32 \
	-g \
	-Woverloaded-virtual \
	 \
	-fdata-sections \
	-ffunction-sections \
	-O3

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-std=gnu++1y \
	-fexceptions

INCS_Debug := \
	-I$(srcdir)/deps/v8 \
	-I$(srcdir)/deps/v8/include

DEFS_Release := \
	'-DV8_GYP_BUILD' \
	'-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=64' \
	'-D__STDC_FORMAT_MACROS' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DOPENSSL_THREADS' \
	'-DV8_TARGET_ARCH_IA32' \
	'-DV8_EMBEDDER_STRING="-node.18"' \
	'-DENABLE_DISASSEMBLER' \
	'-DV8_PROMISE_INTERNAL_FIELD_COUNT=1' \
	'-DENABLE_MINOR_MC' \
	'-DOBJECT_PRINT' \
	'-DV8_INTL_SUPPORT' \
	'-DV8_CONCURRENT_MARKING' \
	'-DV8_ARRAY_BUFFER_EXTENSION' \
	'-DV8_ENABLE_LAZY_SOURCE_POSITIONS' \
	'-DV8_USE_SIPHASH' \
	'-DDISABLE_UNTRUSTED_CODE_MITIGATIONS' \
	'-DV8_WIN64_UNWINDING_INFO' \
	'-DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DISPATCH' \
	'-DV8_SNAPSHOT_COMPRESSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-pthread \
	-Wno-unused-parameter \
	-m32 \
	-Wno-return-type \
	-msse2 \
	-mfpmath=sse \
	-mmmx \
	-fno-strict-aliasing \
	-m32 \
	-O3 \
	-fno-omit-frame-pointer \
	-fdata-sections \
	-ffunction-sections \
	 \
	-O3

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-std=gnu++1y \
	-fexceptions

INCS_Release := \
	-I$(srcdir)/deps/v8 \
	-I$(srcdir)/deps/v8/include

OBJS := \
	$(obj).target/$(TARGET)/deps/v8/src/torque/ls/json-parser.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/ls/json.o \
	$(obj).target/$(TARGET)/deps/v8/src/torque/ls/message-handler.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m32 \
	-m32

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m32 \
	-m32

LIBS :=

$(obj).target/tools/v8_gypfiles/libtorque_ls_base.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/tools/v8_gypfiles/libtorque_ls_base.a: LIBS := $(LIBS)
$(obj).target/tools/v8_gypfiles/libtorque_ls_base.a: TOOLSET := $(TOOLSET)
$(obj).target/tools/v8_gypfiles/libtorque_ls_base.a: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,alink_thin)

all_deps += $(obj).target/tools/v8_gypfiles/libtorque_ls_base.a
# Add target alias
.PHONY: torque_ls_base
torque_ls_base: $(obj).target/tools/v8_gypfiles/libtorque_ls_base.a

