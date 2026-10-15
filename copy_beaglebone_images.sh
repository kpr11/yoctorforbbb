#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Locate the checkout whether this script is beside it or inside it.
if [[ -d "$SCRIPT_DIR/yoctorforbbb" ]]; then
    YOCTO_DIR="$SCRIPT_DIR/yoctorforbbb"
elif [[ -d "$SCRIPT_DIR/poky" ]]; then
    YOCTO_DIR="$SCRIPT_DIR"
else
    printf 'Cannot locate yoctorforbbb relative to this script: %s\n' "$SCRIPT_DIR" >&2
    exit 1
fi

# Run after a successful build. Optional arguments override source and destination.
DEPLOY_DIR="${1:-$YOCTO_DIR/build-k7/tmp/deploy/images/beaglebone-yocto}"
DEST_DIR="${2:-$YOCTO_DIR/bbb_flash_images}"

if [[ ! -d "$DEPLOY_DIR" ]]; then
    printf 'Deploy directory not found: %s\n' "$DEPLOY_DIR" >&2
    exit 1
fi

IMAGE_FILES=(
    MLO
    u-boot.img
    zImage
    am335x-boneblack.dtb
    core-image-minimal-beaglebone-yocto.rootfs.tar.bz2
)

SOURCE_FILES=()
DEST_FILES=()
for file in "${IMAGE_FILES[@]}"; do
    if [[ ! -f "$DEPLOY_DIR/$file" ]]; then
        printf 'Missing build artifact: %s\n' "$DEPLOY_DIR/$file" >&2
        exit 1
    fi
    SOURCE_FILES+=("$DEPLOY_DIR/$file")
    DEST_FILES+=("$DEST_DIR/$file")
done

mkdir -p -- "$DEST_DIR"

# Dereference deploy symlinks so the copied files are usable independently.
cp -pL -- "${SOURCE_FILES[@]}" "$DEST_DIR"/

printf 'Copied %d image files from:\n  %s\ninto:\n  %s\n\n' "${#IMAGE_FILES[@]}" "$DEPLOY_DIR" "$DEST_DIR"
ls -lh -- "${DEST_FILES[@]}"
