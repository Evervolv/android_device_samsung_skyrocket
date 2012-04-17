$(call inherit-product, device/samsung/skyrocket/full_skyrocket.mk)

PRODUCT_RELEASE_NAME := SamsungSGH-T727

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=samsung_skyrocket BUILD_FINGERPRINT="samsung/SGH-I727/SGH-I727:4.0.3/IML74K/107:user/release-keys" PRIVATE_BUILD_DESC="SGH-I727-user 4.0.3 IML74K 107 release-keys"

TARGET_BOOTANIMATION_NAME := vertical-480x800

PRODUCT_NAME := cm_skyrocket
PRODUCT_DEVICE := skyrocket
