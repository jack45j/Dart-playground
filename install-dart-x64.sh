#!/bin/bash
set -e

# 安裝必要的工具
sudo apt-get update
sudo apt-get install -y wget unzip

# 下載 Dart SDK
DART_VERSION="3.4.4"
wget https://storage.googleapis.com/dart-archive/channels/stable/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip

# 解壓到 /usr/lib/dart
sudo mkdir -p /usr/lib/dart
sudo unzip dartsdk-linux-x64-release.zip -d /usr/lib/dart

# 設置 PATH
echo 'export PATH="$PATH:/usr/lib/dart/dart-sdk/bin"' >> ~/.bashrc
echo 'export PATH="$PATH:/usr/lib/dart/dart-sdk/bin"' >> ~/.zshrc

# 清理下載的文件
rm dartsdk-linux-x64-release.zip

# 驗證安裝
source ~/.bashrc
dart --version