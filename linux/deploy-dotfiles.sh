#!/bin/bash
pushd "$(dirname $0)/dotfiles"

DOTFILES=$(ls -A | grep -v .gitignore)
PWD=$(pwd)

for file in ${DOTFILES[@]}
do
    echo "create ${file} ..."
    ln -s ${PWD}/${file} ${HOME}/
done

popd
