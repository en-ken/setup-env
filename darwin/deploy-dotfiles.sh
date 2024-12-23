#!/bin/bash
pushd "$(dirname $0)/dotfiles"

DOTFILES=$(ls -A | grep -v .gitignore | grep -v .config)
PWD=$(pwd)

for file in ${DOTFILES[@]}
do
    echo "create ${file} ..."
    ln -s ${PWD}/${file} ${HOME}/
done

# .config
CONFIGS=$(ls -A .config)
for file in ${CONFIGS[@]}
do
    echo "create ${file} ..."
    ln -s ${PWD}/${file} ${HOME}/.config/
done

popd
