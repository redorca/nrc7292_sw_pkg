#
# Compile the device tree file into a blob
#
#

TARGET=newracom
INSTALL_DIR=/Boot/overlays

all: ${TARGET}.dtbo

${TARGET}.dtbo: ${TARGET}-overlay.dts
	# Suppress warnings about unit name exists but a register property does not.
	dtc -I dts -O dtb -W no-unit_address_vs_reg -o ${TARGET}.dtbo ${TARGET}-overlay.dts

install: ${INSTALL_DIR}/${TARGET}.dtbo

${INSTALL_DIR}/${TARGET}.dtbo: ${INSTALL_DIR} ${TARGET}.dtbo
	@([ -d ${INSTALL_DIR} ] && cp ${TARGET}.dtbo ${@}) || true

${INSTALL_DIR}:
	# @([ ! -d ${@} ] && echo "No install dir ${@}" >&2) || true
	@[ -d ${@} ] || echo "No install dir ${@}" >&2

clean:
	@rm ${TARGET}.dtbo

clobber:
	@rm -f ${INSTALL_DIR}/${TARGET}.dtbo
