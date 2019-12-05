define Device/mikrotik
	DEVICE_VENDOR := MikroTik
	BOARD_NAME := routerboard
	LOADER_TYPE := elf
	KERNEL := kernel-bin | append-dtb | lzma | loader-kernel
	KERNEL_INITRAMFS := kernel-bin | append-dtb | lzma | loader-kernel
endef

define Device/mikrotik_routerboard-wap-g-5hact2hnd
  $(Device/mikrotik)
  ATH_SOC := qca9556
  DEVICE_MODEL := RouterBOARD wAP G-5HacT2HnD (wAP AC)
  IMAGE_SIZE := 16000k
  IMAGE/sysupgrade.bin := append-kernel | kernel2minor -s 1024 -e | \
    pad-to $$$$(BLOCKSIZE) | append-rootfs | pad-rootfs | \
    append-metadata | check-size $$$$(IMAGE_SIZE)
  DEVICE_PACKAGES += kmod-ath10k-ct ath10k-firmware-qca988x-ct
  SUPPORTED_DEVICES += rb-wapg-5hact2hnd
endef
TARGET_DEVICES += mikrotik_routerboard-wap-g-5hact2hnd
