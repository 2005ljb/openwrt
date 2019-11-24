define Device/mikrotik
	DEVICE_VENDOR := MikroTik
	DEVICE_PACKAGES := rbcfg
	BOARD_NAME := routerboard
	LOADER_TYPE := elf
	KERNEL := kernel-bin | append-dtb | lzma | loader-kernel
	KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-kernel
	FEATURES += minor
endef

define Device/rb-nor-flash-16M
	$(Device/mikrotik)
	DEVICE_PACKAGES += -nand-utils
	IMAGE_SIZE := 16000k
	IMAGE/sysupgrade.bin := append-kernel | kernel2minor -s 1024 -e | pad-to $$$$(BLOCKSIZE) | \
	append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
endef

define Device/rb-nor-flash-16M-ac
	$(Device/rb-nor-flash-16M)
endef