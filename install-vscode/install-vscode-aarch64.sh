#!/bin/bash

echo ===INSTALL NECESSARY PACKAGES===
export CC=/usr/bin/cc
export CXX=/usr/bin/c++
sudo apt install -y libsecret-1-dev git python2.7 clang make libx11-dev libxkbfile-dev fakeroot rpm
sudo apt install -y jq
npm install -g yarn

echo ===CLONE VSCODE===
git clone https://github.com/Microsoft/vscode.git /tmp/vscode --depth=1
mkdir /tmp/vscode; cd $_

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

echo ===ADD EXTENSION GALLERY===
gallery=$(cat << EOT
{
  "extensionsGallery":{
    "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
    "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
    "itemUrl": "https://marketplace.visualstudio.com/items"
  }
}
EOT
)
jsonPath='/usr/share/code-oss/resources/app/product.json'
cat ${jsonPath} | jq ". | .+ ${gallery}" | sudo tee {jsonPath}
