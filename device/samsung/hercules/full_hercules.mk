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

# Pull in full_surf.mk
$(call inherit-product, device/samsung/skyrocket/full_skyrocket.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/samsung/hercules/prebuilt/system/etc/gps.conf:system/etc/gps.conf

#Kernel files for this device
PRODUCT_COPY_FILES += \
    device/samsung/hercules/prebuilt/root/init.qcom.sh:root/init.qcom.sh \
    device/samsung/hercules/prebuilt/root/init.qcom.rc:root/init.qcom.rc \
    device/samsung/hercules/prebuilt/recovery/root/init.rc:root/init.rc \
    device/samsung/hercules/prebuilt/recovery/root/lpm.rc:root/lpm.rc \
    device/samsung/hercules/prebuilt/root/init.qcom.lpm_boot.sh:root/init.qcom.lpm_boot.sh \
    device/samsung/hercules/prebuilt/root/init.skyrocket.usb.rc:root/init.skyrocket.usb.rc \
    device/samsung/hercules/prebuilt/root/ueventd.goldfish.rc:root/ueventd.goldfish.rc \
    device/samsung/hercules/prebuilt/root/ueventd.rc:root/ueventd.rc

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-samsung \
	ro.com.google.clientidbase.ms=android-tmobile-us \
	ro.com.google.clientidbase.am=android-tmobile-us \
	ro.com.google.clientidbase.yt=android-samsung \
	ro.com.google.clientidbase.gmm=android-samsung \
	ro.product.model=SAMSUNG-SGH-T989 \
	gsm.sim.operator.alpha=tmobile \
	gsm.operator.alpha=tmobile \
	gsm.sim.operator.numeric=310120 \
	gsm.operator.numeric=310120 \
	gsm.sim.operator.iso-country=us \
	gsm.operator.iso-country=us \
	ro.com.google.locationfeatures=1 \
	ro.setupwizard.enable_bypass=1

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/hercules/prebuilt/root/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# media profiles and capabilities spec
$(call inherit-product, device/samsung/skyrocket/media_a1026.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_NAME := full_hercules
PRODUCT_DEVICE := hercules
PRODUCT_MODEL := SGH-T989
PRODUCT_MANUFACTURER := Samsung
