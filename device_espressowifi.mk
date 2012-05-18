#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/espressowifi/espressowifi-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/espressowifi/overlay

# Prebuilt kernel location
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/espressowifi/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Files needed for boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/init.espresso.rc:root/init.espresso.rc \
    $(LOCAL_PATH)/init.espresso.usb.rc:root/init.espresso.usb.rc \
    $(LOCAL_PATH)/ueventd.espresso.rc:root/ueventd.espresso.rc

# Modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    $(LOCAL_PATH)/prebuilt/dhd.ko:system/lib/modules/dhd.ko \
    $(LOCAL_PATH)/prebuilt/mwlan_aarp.ko:system/lib/modules/mwlan_aarp.ko \
	$(LOCAL_PATH)/prebuilt/rpmsg_client_sample.ko:system/lib/modules/rpmsg_client_sample.ko \
    $(LOCAL_PATH)/prebuilt/rpmsg_client_sample.ko:system/lib/modules/rpmsg_server_sample.ko \
    $(LOCAL_PATH)/prebuilt/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko

# Prebuilt configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/egl.cfg:system/lib/egl/egl.cfg \
    $(LOCAL_PATH)/configs/espressowifi.xml:system/etc/sound/espressowifi.xml \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/main.conf:system/etc/bluetooth/main.conf \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab

# Input device configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/espresso-gpio-keypad.kl:system/usr/keylayout/espresso-gpio-keypad.kl \
    $(LOCAL_PATH)/keylayout/sec_keyboard.kl:system/usr/keylayout/sec_keyboard.kl \
    $(LOCAL_PATH)/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    $(LOCAL_PATH)/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    $(LOCAL_PATH)/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    $(LOCAL_PATH)/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    $(LOCAL_PATH)/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    $(LOCAL_PATH)/keychars/espresso-gpio-keypad.kcm:system/usr/keychars/espresso-gpio-keypad.kcm \
    $(LOCAL_PATH)/idc/melfas_ts.idc:system/usr/idc/melfas_ts.idc \
    $(LOCAL_PATH)/idc/synaptics-ts.idc:system/usr/idc/synaptics-ts.idc

# Camera/Wifi/BT Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/bcmdhd_apsta.bin:system/etc/wifi/bcmdhd_apsta.bin \
    $(LOCAL_PATH)/prebuilt/bcmdhd_sta.bin:system/etc/wifi/bcmdhd_sta.bin \
    $(LOCAL_PATH)/prebuilt/bcmdhd_p2p.bin:system/etc/wifi/bcmdhd_p2p.bin \
    $(LOCAL_PATH)/firmware/BCM4330.hcd:system/vendor/firmware/BCM4330.hcd \
    $(LOCAL_PATH)/firmware/ducati-m3.bin:system/vendor/firmware/ducati-m3.bin

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Build characteristics setting
PRODUCT_CHARACTERISTICS := tablet

# 7" tablet is "large" at 160dpi (169.x) is mdpi, but it's lying..
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# This device has enough room for precise dalvik
PRODUCT_TAGS += dalvik.gc.type-precise

# Extra packages to build for this device
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accesory \
    make_ext4fs \
    setup_fs

# Packages for audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.omap4

# Properties specific for this device
PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.opengles.version = 131072 \
    ro.sf.lcd_density=160 \
    persist.sys.usb.config=mtp,adb

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
	PRODUCT_PACKAGES += send_bug
	PRODUCT_COPY_FILES += \
		system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
		system/extras/bugmailer/send_bug:system/bin/send_bug
endif

# Inherit tablet dalvik settings
$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)

# Call the vendor to setup proprietary files
$(call inherit-product-if-exists, vendor/samsung/espressowifi/espressowifi-vendor.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_espressowifi
PRODUCT_DEVICE := espressowifi
PRODUCT_MODEL := espressowifi
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
