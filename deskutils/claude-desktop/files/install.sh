#!/bin/sh

set -ex

PACKAGE_NAME="claude-desktop"

echo ${DESTDIR}

## Install icons
for size in 16 24 32 48 64 256; do
	icon_dir="$INSTALL_DIR/share/icons/hicolor/${size}x${size}/apps"
	mkdir -p "$icon_dir"

	case "$size" in
		16)  file="claude_13_16x16x32.png" ;;
		24)  file="claude_11_24x24x32.png" ;;
		32)  file="claude_10_32x32x32.png" ;;
		48)  file="claude_8_48x48x32.png" ;;
		64)  file="claude_7_64x64x32.png" ;;
		256) file="claude_6_256x256x32.png" ;;
	esac

	install -m 644 "$file" "$icon_dir/claude-desktop.png"
done

# Copy app files
cp app.asar "$INSTALL_DIR/share/$PACKAGE_NAME/resources/"
cp -R app.asar.unpacked "$INSTALL_DIR/share/$PACKAGE_NAME/resources/"
