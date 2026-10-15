require u-boot-common.inc
require u-boot.inc

DEPENDS += "bc-native dtc-native python3-pyelftools-native"

HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
ARM, MIPS and several other processors, which can be installed in a boot \
ROM and used to initialize and test the hardware or to download and run \
application code."
SECTION = "bootloaders"
DEPENDS += "flex-native bison-native python3-setuptools-native"

LICENSE = "GPL-2.0-or-later"
LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
PE = "1"

# U-Boot v2026.07 stable release (6 July 2026).
SRCREV = "ece349ade2973e220f524ce59e59711cc919263f"
