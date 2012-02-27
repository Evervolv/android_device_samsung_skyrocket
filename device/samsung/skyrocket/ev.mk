# Inherit AOSP device configuration for surf.
$(call inherit-product, device/samsung/skyrocket/full_skyrocket.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_skyrocket
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := skyrocket
PRODUCT_MODEL := SGH-I727
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I727 BUILD_ID=GRI40 BUILD_FINGERPRINT=samsung/SGH-I727/SGH-I727:2.3.5/GINGERBREAD/UCKJ2:user/release-keys PRIVATE_BUILD_DESC="unkown still"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := xiphias
PRODUCT_VERSION_DEVICE_SPECIFIC := p4

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Samsung Skyrocket\n------------------------------------------------\n"

#PRODUCT_PACKAGES += \
    Camera

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/wvga/media/bootanimation.zip:system/media/bootanimation.zip
