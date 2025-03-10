#!/bin/sh

BOARD_DIR="$(dirname $0)"
BOARD_NAME="$(basename ${BOARD_DIR})"
GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

#case "${2}" in
#	--add-pi3-miniuart-bt-overlay)
#	if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
#		echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
#		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
#
## fixes rpi3 ttyAMA0 serial console
#dtoverlay=pi3-miniuart-bt
#__EOF__
#	fi
#	;;
#esac

# Mark the kernel as DT-enabled
mkdir -p "${BINARIES_DIR}/kernel-marked"
${HOST_DIR}/usr/bin/mkknlimg "${BINARIES_DIR}/zImage" \
	"${BINARIES_DIR}/kernel-marked/zImage"

rm -rf "${GENIMAGE_TMP}"

genimage                           \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

ret=$?

#create directory if not exists
[ -d "${BINARIES_DIR}/../nfsroot" ] || mkdir "${BINARIES_DIR}/../nfsroot"

echo "extracting rootfs.tar to nfsroot"
sudo tar -xaf "${BINARIES_DIR}/rootfs.tar" -C "${BINARIES_DIR}/../nfsroot"

exit $ret
