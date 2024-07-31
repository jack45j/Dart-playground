#!/bin/bash
set -e

# 檢測系統架構
ARCH=$(uname -m)

if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    echo "檢測到 ARM64 架構，執行 ARM64 安裝腳本"
    bash install-dart-arm64.sh
elif [ "$ARCH" = "x86_64" ]; then
    echo "檢測到 x86_64 架構，執行 x64 安裝腳本"
    bash install-dart-x64.sh
else
    echo "不支援的架構: $ARCH"
    exit 1
fi