FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://debug-tools.cfg"

# linux-mainline inherits kernel, not kernel-yocto: explicitly merge fragments.
# Heavy instrumentation can be enabled in local.conf with:
# KERNEL_DEBUG_INSTRUMENTATION = "1"
KERNEL_DEBUG_INSTRUMENTATION ?= "0"
SRC_URI:append = " ${@bb.utils.contains('KERNEL_DEBUG_INSTRUMENTATION', '1', 'file://debug-instrumentation.cfg', '', d)}"

do_configure:append() {
    debug_fragments="${WORKDIR}/debug-tools.cfg"
    if [ "${KERNEL_DEBUG_INSTRUMENTATION}" = "1" ]; then
        debug_fragments="$debug_fragments ${WORKDIR}/debug-instrumentation.cfg"
    fi
    ${S}/scripts/kconfig/merge_config.sh -m -O ${B} ${B}/.config $debug_fragments
    oe_runmake -C ${S} O=${B} olddefconfig
}
