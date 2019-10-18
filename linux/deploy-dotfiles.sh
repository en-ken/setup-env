#!/bin/bash
pushd "$(dirname $0)/dotfiles"

DOTFILES=$(ls -A)
PWD=$(pwd)

for file in ${DOTFILES[@]}
do
    ln -s ${PWD}/${file} ${HOME}/${file}
done

popd
