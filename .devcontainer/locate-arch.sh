#!/bin/bash
set -e
ARCH=$(uname -m)
ARCH_TAG="x64"
if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    echo "Detected ARM64 architecture, executing ARM64 installation script"
    ARCH_TAG="arm64"
elif [ "$ARCH" = "x86_64" ]; then
    echo "Detected x86_64 architecture, executing x64 installation script"
    ARCH_TAG="x64"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

# Install necessary tools
sudo apt-get update
sudo apt-get install -y wget unzip

# Download Dart SDK
DART_VERSION="3.4.4"
wget "https://storage.googleapis.com/dart-archive/channels/stable/release/${DART_VERSION}/sdk/dartsdk-linux-${ARCH_TAG}-release.zip"

# Extract to /usr/lib/dart
sudo mkdir -p /usr/lib/dart
sudo unzip "dartsdk-linux-${ARCH_TAG}-release.zip" -d /usr/lib/dart

# Set up PATH
echo 'export PATH="$PATH:/usr/lib/dart/dart-sdk/bin"' >> ~/.bashrc
echo 'export PATH="$PATH:/usr/lib/dart/dart-sdk/bin"' >> ~/.zshrc

# Clean up downloaded files
rm "dartsdk-linux-${ARCH_TAG}-release.zip"

# Verify installation
source ~/.bashrc
dart --version