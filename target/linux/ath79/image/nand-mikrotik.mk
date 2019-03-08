define Device/mikrotik
  PROFILES := Default
  DEVICE_PACKAGES := kmod-usb-core kmod-usb-ohci kmod-usb2 kmod-usb-ledtrig-usbport
  BOARD_NAME := routerboard
  LOADER_TYPE := elf
  KERNEL := kernel-bin | loader-kernel
  MIKROTIK_CHUNKSIZE :=
  IMAGE/sysupgrade.bin/squashfs :=
endef
DEVICE_VARS += MIKROTIK_CHUNKSIZE

define Device/mikrotik-nand
  $(Device/mikrotik)
  IMAGE/sysupgrade.bin/squashfs = append-kernel | \
	kernel2minor -s $$(MIKROTIK_CHUNKSIZE) -e -c | sysupgrade-tar kernel=$$$$@
	IMAGE/sysupgrade.bin := sysupgrade-tar
endef

define Device/nand-64m
  $(Device/mikrotik-nand)
  MIKROTIK_CHUNKSIZE := 512
	
endef


define Device/nand-large
  $(Device/mikrotik-nand)
  MIKROTIK_CHUNKSIZE := 2048
endef

define Device/nand-large-ac
  $(Device/mikrotik-nand)
  MIKROTIK_CHUNKSIZE := 2048
  DEVICE_PACKAGES += kmod-ath10k-ct ath10k-firmware-qca988x-ct
endef

define Device/mikrotik_rb921gs-5hpacd-15s
  $(Device/mikrotik-nand-large-ac)
  ATH_SOC := qca9558
  DEVICE_TITLE := MikroTik RB921GS-5HPacD-15S (mANTBox 15s)
	BOARD_NAME := routerboard
endef
TARGET_DEVICES += mikrotik_rb921gs-5hpacd-15s

define Device/mikrotik_rb922uags-5hpacd
  $(Device/mikrotik-nand-large-ac)
  ATH_SOC := qca9558
  DEVICE_TITLE := MikroTik RB922UAGS-5HPacD
	DEVICE_PACKAGES := kmod-usb-core kmod-usb-ohci kmod-usb2 kmod-usb-ledtrig-usbport
  BOARD_NAME := routerboard
  LOADER_TYPE := bin
	MIKROTIK_CHUNKSIZE := 2048
  KERNEL := kernel-bin | loader-kernel
	IMAGE/sysupgrade.bin := sysupgrade-tar
	IMAGE/sysupgrade.bin/squashfs = append-kernel | \
	kernel2minor -s $$(MIKROTIK_CHUNKSIZE) -e -c | sysupgrade-tar kernel=$$$$@
endef
TARGET_DEVICES += mikrotik_rb922uags-5hpacd
