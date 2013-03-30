LOCAL_PATH := $(call my-dir)
THIS_DIR := $(LOCAL_PATH)

include $(CLEAR_VARS)

LOCAL_CFLAGS := -g "-I$(TI_MOBILE_SDK)/android/native/include" -I$(SYSROOT)/usr/include

# Several places in generated code we set some jvalues to NULL and
# since NDK r8b we'd get warnings about each one.
LOCAL_CFLAGS += -Wno-conversion-null

# cf https://groups.google.com/forum/?fromgroups=#!topic/android-ndk/Q8ajOD37LR0
LOCAL_CFLAGS += -Wno-psabi

# Yes, I know this lets me crash things. This is what I want in crash test dummy.
LOCAL_CFLAGS += -fpermissive

LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -ldl -llog -L$(TARGET_OUT) "-L$(TI_MOBILE_SDK)/android/native/libs/$(TARGET_ARCH_ABI)" -lkroll-v8

LOCAL_MODULE := ti.crashtestdummy.jni
LOCAL_SRC_FILES := moduleJNI.cpp

include $(BUILD_SHARED_LIBRARY)
