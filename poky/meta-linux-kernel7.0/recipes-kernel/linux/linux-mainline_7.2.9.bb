# Reuse the existing BeagleBone configuration and kernel build integration.
require linux-mainline_7.0.bb

SUMMARY = "Mainline Linux Kernel 7.2.9 for BeagleBone Black"
SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git;protocol=https;branch=linux-7.2.y"
# Peeled upstream v7.2.9 tag, verified with git ls-remote.
SRCREV = "5fce161649b4d779d1b76d9fcd52dc77779774b8"
