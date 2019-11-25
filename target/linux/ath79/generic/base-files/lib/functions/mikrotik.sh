#!/bin/sh
#
# Copyright (C) 2019 Robert Marko <robimarko@gmail.com>
#
# Helper function to extract MAC addresses and calibration data for MikroTik
#
mikrotik_caldata_extract() {
	local part=$1
	local offset=$(($2))
	local count=$(($3))
	local mtd

	mtd=$(find_mtd_chardev $part)
	[ -n "$mtd" ] || caldata_die "no mtd device found for partition $part"

	#rbextract -e $mtd /lib/firmware/erd.bin

	#dd if=/lib/firmware/silverchis-test-caldata.bin iflag=skip_bytes bs=$count skip=$offset count=1 2>/dev/null || \
	#	caldata_die "failed to extract calibration data from $mtd"
}