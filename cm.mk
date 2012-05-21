$(call inherit-product, device/samsung/skyrocket/full_skyrocket.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=samsung_skyrocket BUILD_FINGERPRINT="samsung/SGH-I727/SGH-I727:4.0.4/IMM76D/UCLE2:user/release-keys" PRIVATE_BUILD_DESC="SGH-I727-user 4.0.4 IMM76D UCLE2 release-keys"

TARGET_BOOTANIMATION_NAME := vertical-480x800

PRODUCT_NAME := cm_skyrocket
PRODUCT_DEVICE := skyrocket

