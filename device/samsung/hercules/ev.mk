# Inherit AOSP device configuration for surf.
$(call inherit-product, device/samsung/surf/full_surf.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_hercules
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := hercules
PRODUCT_MODEL := SGH-T989
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-T989 BUILD_ID=GRI40 BUILD_FINGERPRINT=samsung/SGH-T989/SGH-T989:2.3.5/GINGERBREAD/UCKJ2:user/release-keys PRIVATE_BUILD_DESC="unkown still"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := iuro
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Tmo Samsung Galaxy sII\n------------------------------------------------\n"

#PRODUCT_PACKAGES += \
    Camera

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/wvga/media/bootanimation.zip:system/media/bootanimation.zip

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage

#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mtp,adb
