define Device/mikrotik
	DEVICE_VENDOR := MikroTik
	DEVICE_PACKAGES := kmod-usb-ohci kmod-usb2 kmod-usb-ledtrig-usbport
	BOARD_NAME := routerboard
	LOADER_TYPE := elf
	KERNEL_NAME := vmlinux.elf
	KERNEL_INITRAMFS_NAME := vmlinux-initramfs.elf
	KERNEL := kernel-bin | append-dtb | lzma | loader-kernel
	KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-kernel
endef

define Device/rb-nor-flash-16M
	$(Device/mikrotik)
	DEVICE_PACKAGES := rbcfg rssileds -nand-utils kmod-ledtrig-gpio
	IMAGE_SIZE := 16000k
	KERNEL_INSTALL := 1
	IMAGE/sysupgrade.bin := append-kernel | kernel2minor -s 1024 -e | pad-to $$$$(BLOCKSIZE) | \
	append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
endef

define Device/rb-nor-flash-16M-ac
	$(Device/rb-nor-flash-16M)
	DEVICE_PACKAGES += kmod-ath10k-ct ath10k-firmware-qca988x-ct ath10k-firmware-qca9887-ct kmod-usb-ehci
	SUPPORTED_DEVICES += rb-wapg-5hact2hnd mikrotik_rb-wapg-5hact2hnd
endef
