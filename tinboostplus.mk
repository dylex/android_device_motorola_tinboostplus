$(call inherit-product, device/common/gps/gps_us.mk)

PRODUCT_BRAND := motorola
PRODUCT_DEVICE := tinboostplus
PRODUCT_MODEL := XT557
PRODUCT_MANUFACTURER := Motorola

PRODUCT_COPY_FILES += \
	$(foreach l,$(shell cat device/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)/proprietary-libs.txt), \
		vendor/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)/proprietary/lib/lib$(l).so:obj/lib/lib$(l).so \
		vendor/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)/proprietary/lib/lib$(l).so:system/lib/lib$(l).so) \
	$(foreach f,$(shell cat device/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)/proprietary-files.txt), \
		vendor/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)/proprietary/$(f):$(f))
