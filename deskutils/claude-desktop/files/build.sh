#!/bin/sh

# dependencies:
# 7-zip
# icoutils
# npm-node20

set -ex

PACKAGE_NAME="claude-desktop"
CLAUDE_EXE=Claude-Setup-x64.exe

echo ${PREFIX}
echo ${FILESDIR}

# Extract resources
7z x -y ${CLAUDE_EXE}

# Extract nupkg filename and version
NUPKG_PATH=$(find . -name "AnthropicClaude-*.nupkg" | head -1)

# Extract version from the nupkg filename
VERSION=$(echo "$NUPKG_PATH" | sed -En 's/.*AnthropicClaude-([0-9]+\.[0-9]+\.[0-9]+)-full.*/\1/p')
7z x -y ${NUPKG_PATH}

# Extract and convert icons
wrestool -x -t 14 "lib/net45/claude.exe" -o claude.ico
icotool -x claude.ico

# Process app.asar
mkdir -p electron-app
cp "lib/net45/resources/app.asar" electron-app/
cp -R "lib/net45/resources/app.asar.unpacked" electron-app/

cd electron-app
npx asar extract app.asar app.asar.contents

# Replace native module with stub implementation
cp -f ${FILESDIR}/index.js \
	app.asar.contents/node_modules/claude-native/
# Create native module with keyboard constants
cp -f ${FILESDIR}/index.js \
	app.asar.unpacked/node_modules/claude-native/

# Copy Tray icons
mkdir -p app.asar.contents/resources
cp ../lib/net45/resources/Tray* app.asar.contents/resources/

# Copy only the language-specific JSON files (e.g., en-US.json)
mkdir -p app.asar.contents/resources/i18n
cp ../lib/net45/resources/*-*.json app.asar.contents/resources/i18n/

# Repackage app.asar
npx asar pack app.asar.contents app.asar

echo claude-desktop-${VERSION}
