#!/bin/bash

echo ===INSTALL NECESSARY PACKAGES===
export CC=/usr/bin/cc
export CXX=/usr/bin/c++
sudo apt install -y libsecret-1-dev git python2.7 clang make libx11-dev libxkbfile-dev fakeroot rpm
npm install -g yarn

echo ===CLONE VSCODE===
mkdir /tmp/vscode; cd $_
git clone https://github.com/Microsoft/vscode.git --depth=1

echo ===SED FOR AARCH64===
sed -i 's|require("gulp-sourcemaps");|{write:()=>gulpUtil.noop(),init:()=>gulpUtil.noop()};|' build/lib/optimize.js
sed -i 's|--max_old_space_size=[0-9]\+|--max_old_space_size=1700|' package.json
sed -i 's|yarnInstall..test/smoke|// &|' build/npm/postinstall.js

echo ===BUILD VSCODE===
yarn
yarn run gulp vscode-linux-arm64-min
yarn run gulp vscode-linux-arm64-build-deb

echo ===INSTALL VSCODE===
sudo apt install -y ./.build/linux/deb/arm64/deb/code-oss_*_arm64.deb
