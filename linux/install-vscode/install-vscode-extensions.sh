#!/bin/bash
echo == install vs code extension ==
pkglist=(
shakram02.bash-beautify \
coenraads.bracket-pair-colorizer \
peterjausovec.vscode-docker \
dbaeumer.vscode-eslint \
grapecity.gc-excelviewer \
eamodio.gitlens \
ms-ceintl.vscode-language-pack-ja \
orta.vscode-jest \
shd101wyy.markdown-preview-enhanced \
davidanson.vscode-markdownlint \
ibm.output-colorizer \
jebbs.plantuml \
ms-python.python \
chrmarti.regex \
mimarec.swagger-doc-viewer \
shuworks.vscode-table-formatter \
shardulm94.trailing-spaces \
eg2.tslint \
vscodevim.vim \
shardulm94.trailing-spaces \
chrmarti.regex \
eamodio.gitlens
)

for i in ${pkglist[@]}; do
    code --install-extension $i
done
