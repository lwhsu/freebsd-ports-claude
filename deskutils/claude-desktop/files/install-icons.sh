#!/bin/sh

set -ex

if [ -z "${ICONSDIR}" ]; then
	echo "No ICONSDIR defined." > /dev/stderr
	exit 1
fi

for size in 16 24 32 48 64 256; do
	icon_dir="${ICONSDIR}/hicolor/${size}x${size}/apps"
	mkdir -p "$icon_dir"

	case "$size" in
		16)  file="claude_13_16x16x32.png" ;;
		24)  file="claude_11_24x24x32.png" ;;
		32)  file="claude_10_32x32x32.png" ;;
		48)  file="claude_8_48x48x32.png" ;;
		64)  file="claude_7_64x64x32.png" ;;
		256) file="claude_6_256x256x32.png" ;;
	esac

	install -m 0644 "$file" "$icon_dir/claude-desktop.png"
done
