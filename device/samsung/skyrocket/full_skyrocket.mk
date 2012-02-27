#
# Copyright (C) 2011 The Evervolv Project
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
#


PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/prebuilt/system/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-samsung \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r5 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Kernel 
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/prebuilt/root/init.goldfish.rc:root/init.goldfish.rc \
    device/samsung/skyrocket/prebuilt/root/init.qcom.sh:root/init.qcom.sh \
    device/samsung/skyrocket/prebuilt/root/init.qcom.rc:root/init.qcom.rc \
    device/samsung/skyrocket/prebuilt/recovery/root/lpm.rc:root/lpm.rc \
    device/samsung/skyrocket/prebuilt/root/init.qcom.lpm_boot.sh:root/init.qcom.lpm_boot.sh \
    device/samsung/skyrocket/prebuilt/root/init.skyrocket.usb.rc:root/init.skyrocket.usb.rc \
    device/samsung/skyrocket/prebuilt/root/init.target.rc:root/init.target.rc \
    device/samsung/skyrocket/prebuilt/root/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    device/samsung/skyrocket/prebuilt/root/ueventd.rc:root/ueventd.rc \
    device/samsung/skyrocket/prebuilt/system/lib/modules/ansi_cprng.ko:root/lib/modules/ansi_cprng.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/bthid.ko:root/lib/modules/bthid.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/dal_remotetest.ko:root/lib/modules/dal_remotetest.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/dhd.ko:root/lib/modules/dhd.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/dma_test.ko:root/lib/modules/dma_test.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/evbug.ko:root/lib/modules/evbug.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/gspca_main.ko:root/lib/modules/gspca_main.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/ksapi.ko:root/lib/modules/ksapi.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/lcd.ko:root/lib/modules/lcd.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/librasdioif.ko:root/lib/modules/librasdioif.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/msm_tsif.ko:root/lib/modules/msm_tsif.ko\
    device/samsung/skyrocket/prebuilt/system/lib/modules/oprofile.ko:root/lib/modules/oprofile.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/qce.ko:root/lib/modules/qce.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/qcedev.ko:root/lib/modules/qcedev.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/qcrypto.ko:root/lib/modules/qcrypto.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/spidev.ko:root/lib/modules/spidev.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/tsif_chrdev.ko:root/lib/modules/tsif_chrdev.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/vibrator.ko:root/lib/modules/vibrator.ko

# Temporary hack
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1

#Using prebuilt audio libs right now
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/prebuilt/system/lib/hw/audio.primary.default.so:system/lib/hw/audio.primary.default.so \
    device/samsung/skyrocket/prebuilt/system/lib/hw/audio_policy.default.so:system/lib/hw/audio_policy.default.so \
    device/samsung/skyrocket/prebuilt/system/lib/hw/audio.a2dp.default.so:system/lib/hw/audio.a2dp.default.so

#Using prebuilt libril.so right now
#PRODUCT_COPY_FILES += \
    #device/samsung/skyrocket/prebuilt/system/lib/libril.so:system/lib/libril.so

#Add touchscreen config file
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/prebuilt/system/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/skyrocket/skyrocket-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-samsung \
	ro.com.google.clientidbase.ms=android-att-us \
	ro.com.google.clientidbase.am=android-att-us \
	ro.com.google.clientidbase.yt=android-samsung \
	ro.com.google.clientidbase.gmm=android-samsung \
	ro.product.model=SAMSUNG-SGH-I727 \
	gsm.sim.operator.alpha=att \
	gsm.operator.alpha=att \
	gsm.sim.operator.numeric=310120 \
	gsm.operator.numeric=310120 \
	gsm.sim.operator.iso-country=us \
	gsm.operator.iso-country=us \
	ro.com.google.locationfeatures=1 \
	ro.setupwizard.enable_bypass=1

DEVICE_PACKAGE_OVERLAYS += device/samsung/skyrocket/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    librs_jni \
    libOmxVenc \
    libOmxVdec \
    gralloc.msm8660 \
    com.android.future.usb.accessory
#    overlay.default \
#    gps.SGH-I727 \
#    copybit.msm8x60 \
#    overlay.default \
#    libOmxCore \
#    libaudio \

##Disable HWAccel for now
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.disable_hw_accel=true

# Keylayouts
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/prebuilt/system/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/samsung/skyrocket/prebuilt/system/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/samsung/skyrocket/prebuilt/system/usr/keychars/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin \
    device/samsung/skyrocket/prebuilt/system/usr/keychars/sec_touchkey.kcm.bin:system/usr/keychars/sec_touchkey.kcm.bin \
    device/samsung/skyrocket/prebuilt/system/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/skyrocket/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/skyrocket/prebuilt/system/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/skyrocket/prebuilt/system/usr/keylayout/sec_power_key.kl:system/usr/keylayout/sec_power_key.kl \
    device/samsung/skyrocket/prebuilt/system/usr/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    device/samsung/skyrocket/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/dsps_fluid.b00:system/etc/firmware/dsps_fluid.b00 \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/dsps_fluid.b01:system/etc/firmware/dsps_fluid.b01 \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/dsps_fluid.b02:system/etc/firmware/dsps_fluid.b02 \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/dsps_fluid.b03:system/etc/firmware/dsps_fluid.b03 \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/dsps_fluid.mdt:system/etc/firmware/dsps_fluid.mdt \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/osbl.mbn:system/etc/firmware/osbl.mbn \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/RS_M5LS_O.bin:system/etc/firmware/RS_M5LS_O.bin \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/RS_M5LS_S.bin:system/etc/firmware/RS_M5LS_S.bin \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/RS_M5LS_S_TMO.bin:system/etc/firmware/RS_M5LS_S_TMO.bin \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/samsung/skyrocket/prebuilt/system/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# Wifi Module
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/prebuilt/system/lib/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/bthid.ko:system/lib/modules/bthid.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/dal_remotetest.ko:system/lib/modules/dal_remotetest.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/dma_test.ko:system/lib/modules/dma_test.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/evbug.ko:system/lib/modules/evbug.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/ksapi.ko:system/lib/modules/ksapi.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/lcd.ko:system/lib/modules/lcd.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/msm_tsif.ko:system/lib/modules/msm_tsif.ko\
    device/samsung/skyrocket/prebuilt/system/lib/modules/oprofile.ko:system/lib/modules/oprofile.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/qce.ko:system/lib/modules/qce.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/qcedev.ko:system/lib/modules/qcedev.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/spidev.ko:system/lib/modules/spidev.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/tsif_chrdev.ko:system/lib/modules/tsif_chrdev.ko \
    device/samsung/skyrocket/prebuilt/system/lib/modules/vibrator.ko:system/lib/modules/vibrator.ko

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Temporary hack
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1 \
    ro.secure=0


#NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag

#Optional Add on packages
PRODUCT_PACKAGES += \
    Camera \
    Superuser \
    su \
    Stk

# NFC EXTRAS add-on API
PRODUCT_PACKAGES += \
	com.android.nfc_extras

PRODUCT_PACKAGES += \
	nfc.skyrocket

PRODUCT_LOCALES += en

PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab \
    device/samsung/skyrocket/prebuilt/system/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/samsung/skyrocket/prebuilt/system/etc/spn-conf.xml:system/etc/spn-conf.xml \
    device/samsung/skyrocket/prebuilt/system/etc/voicemail-conf.xml:system/etc/voicemail-conf.xml

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/skyrocket/prebuilt/root/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# media profiles and capabilities spec
$(call inherit-product, device/samsung/skyrocket/media_a1026.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_NAME := full_skyrocket
PRODUCT_DEVICE := SGH-I727
PRODUCT_MODEL := SGH-I727
PRODUCT_MANUFACTURER := Samsung
