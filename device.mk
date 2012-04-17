#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## ramdisk stuffs
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/prebuilt/init:root/init \
    device/samsung/skyrocket/ramdisk/init.rc:root/init.rc \
    device/samsung/skyrocket/ramdisk/init.qcom.lpm_boot.sh:root/init.qcom.lpm_boot.sh \
    device/samsung/skyrocket/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/samsung/skyrocket/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/samsung/skyrocket/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/skyrocket/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/samsung/skyrocket/ramdisk/init.target.rc:root/init.target.rc \
    device/samsung/skyrocket/ramdisk/initlogo.rle:root/initlogo.rle \
    device/samsung/skyrocket/ramdisk/lpm.rc:root/lpm.rc \
    device/samsung/skyrocket/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc

# BCM4330 BT Firmware
PRODUCT_COPY_FILES += \
    device/samsung/msm8660-common/firmware/bcm4330B1.hcd:system/vendor/firmware/bcm4330B1.hcd

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/skyrocket/skyrocket-vendor.mk)

## misc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/skyrocket/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# GPS and Light
PRODUCT_PACKAGES += \
    gps.skyrocket \
    lights.skyrocket

# keylayouts
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/keylayout/8660_handset.kl:system/usr/keylayout/8660_handset.kl\
    device/samsung/skyrocket/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/skyrocket/keylayout/ffa-keypad.kl:system/usr/keylayout/ffa-keypad.kl \
    device/samsung/skyrocket/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
    device/samsung/skyrocket/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/skyrocket/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl\
    device/samsung/skyrocket/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
    device/samsung/skyrocket/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/samsung/skyrocket/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/samsung/skyrocket/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/samsung/skyrocket/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/samsung/skyrocket/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/samsung/skyrocket/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/samsung/skyrocket/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    device/samsung/skyrocket/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/samsung/skyrocket/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl

# Keychars
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/samsung/skyrocket/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/samsung/skyrocket/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/samsung/skyrocket/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

# IDC
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/samsung/skyrocket/idc/qwerty2.idc:system/usr/idc/qwerty2.idc

# Kernel and modules
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/skyrocket/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/samsung/skyrocket/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    device/samsung/skyrocket/modules/cls_flow.ko:system/lib/modules/cls_flow.ko \
    device/samsung/skyrocket/modules/dal_remotetest.ko:system/lib/modules/dal_remotetest.ko \
    device/samsung/skyrocket/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/samsung/skyrocket/modules/dma_test.ko:system/lib/modules/dma_test.ko \
    device/samsung/skyrocket/modules/evbug.ko:system/lib/modules/evbug.ko \
    device/samsung/skyrocket/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
    device/samsung/skyrocket/modules/ksapi.ko:system/lib/modules/ksapi.ko \
    device/samsung/skyrocket/modules/lcd.ko:system/lib/modules/lcd.ko \
    device/samsung/skyrocket/modules/msm-buspm-dev.ko:system/lib/modules/msm-buspm-dev.ko \
    device/samsung/skyrocket/modules/msm_tsif.ko:system/lib/modules/msm_tsif.ko \
    device/samsung/skyrocket/modules/qce.ko:system/lib/modules/qce.ko \
    device/samsung/skyrocket/modules/qcedev.ko:system/lib/modules/qcedev.ko \
    device/samsung/skyrocket/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
    device/samsung/skyrocket/modules/sch_dsmark.ko:system/lib/modules/sch_dsmark.ko \
    device/samsung/skyrocket/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/samsung/skyrocket/modules/spidev.ko:system/lib/modules/spidev.ko \
    device/samsung/skyrocket/modules/tsif_chrdev.ko:system/lib/modules/tsif_chrdev.ko \
    device/samsung/skyrocket/modules/vibrator.ko:system/lib/modules/vibrator.ko

# common msm8660 configs
$(call inherit-product, device/samsung/msm8660-common/msm8660.mk)

$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/samsung/skyrocket/skyrocket-vendor.mk)

#WIFI_BAND := 802_11_ABG
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
