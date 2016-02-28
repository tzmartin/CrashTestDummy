
TARGET_PLATFORM = android-8
APP_STL := stlport_shared
ifeq ($(BUILD_X86), 1)
	APP_ABI := armeabi armeabi-v7a x86
else
	APP_ABI := armeabi armeabi-v7a
endif


TARGET_DEVICE := device
APP_OPTIM := release
TI_DEBUG := 1

