BOARDNAME:=MikroTik devices

FEATURES += minor

DEFAULT_PACKAGES += wpad-basic rbcfg rbextract

define Target/Description
	Build firmware images for devices based on the Qualcomm Atheros MIPS family of
	SoCs using the MiNOR split firmware format (e.g., MikroTik devices).
endef
