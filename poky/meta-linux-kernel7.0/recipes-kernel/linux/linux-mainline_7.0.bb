SUMMARY = "Mainline Linux Kernel 7.0 for BeagleBone Black"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

inherit kernel

# FIXED: Added nobranch=1 to ensure the fetcher can resolve the global tag/commit point
SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git;protocol=https;branch=linux-7.0.y"
SRCREV = "v7.0.11"

S = "${WORKDIR}/git"

COMPATIBLE_MACHINE = "beaglebone-yocto"

KBUILD_DEFCONFIG = "multi_v7_defconfig"
KERNEL_DEVICETREE = "ti/omap/am335x-boneblack.dtb ti/omap/am335x-bone.dtb"
