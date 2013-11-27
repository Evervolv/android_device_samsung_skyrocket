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
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I727 TARGET_DEVICE=SGH-I727 BUILD_FINGERPRINT="samsung/SGH-I727/SGH-I727:4.4/KRT16M/UCMC1:user/release-keys" PRIVATE_BUILD_DESC="SGH-I727-user 4.4 KRT16M UCMC1 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := trainwreck
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv \nfor your Samsung Skyrocket\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at XDA-Developers.com\n------------------------------------------------\n"

#PRODUCT_PACKAGES += \
    Camera

# Hot reboot
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/ev/overlay/hot_reboot

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/wvga/media/bootanimation.zip:system/media/bootanimation.zip
