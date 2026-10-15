# Development/debug tools for the existing BeagleBone image.
# See DEBUGGING.md in this layer for advanced tool prerequisites.
IMAGE_INSTALL:append = " \
    gdb gdbserver strace ltrace valgrind binutils elfutils elfutils-binutils \
    valgrind-massif valgrind-callgrind valgrind-cachegrind \
    perf trace-cmd blktrace kernel-modules \
    kexec-tools makedumpfile crash \
    procps psmisc sysstat htop iotop lsof \
    iproute2 iproute2-ss ethtool tcpdump socat \
    coreutils util-linux util-linux-dmesg \
    i2c-tools usbutils pciutils dtc \
    memtester stress-ng \
"
IMAGE_FEATURES:append = " tools-debug dbg-pkgs ssh-server-dropbear"

# Explicit opt-in after resolving the prerequisites in DEBUGGING.md.
# tools-profile also pulls in SystemTap and LTTng in this checkout.
DEBUG_EXTRA_PACKAGES ?= ""
IMAGE_INSTALL:append = " ${DEBUG_EXTRA_PACKAGES}"
