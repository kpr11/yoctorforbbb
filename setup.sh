#!/bin/bash
export TEMPLATECONF=$(pwd)/poky/meta-custom/conf/templates/bbb
source poky/oe-init-build-env build
