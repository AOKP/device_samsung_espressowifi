# Inherit device configuration
$(call inherit-product, device/samsung/espressowifi/full_espressowifi.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := espressowifi
PRODUCT_NAME := cm_espressowifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := Galaxy Tab 2 7.0
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-P3113 BUILD_FINGERPRINT=samsung/espressowifiue/espressowifi:4.0.3/IML74K/P3113UEALCB:user/release-keys PRIVATE_BUILD_DESC="espressowifiue-user 4.0.3 IML74K P3113UEALCB release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := espressowifi
