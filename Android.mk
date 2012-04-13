ifneq ($(filter skyrocket,$(TARGET_DEVICE)),)
    include $(all-subdir-makefiles)
endif
