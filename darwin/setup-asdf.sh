#!/bin/bash
GO_VERSION=$(asdf latest golang)
NODE_VERSION=$(asdf latest nodejs)
PYTHON_VERSION=$(asdf latest python)
TERRAFORM_VERSION=$(asdf latest terraform)

bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs $NODE_VERSION
asdf global nodejs $NODE_VERSION

sudo apt install libffi-dev
asdf install python $PYTHON_VERSION
asdf global python $PYTHON_VERSION

asdf install terraform $TERRAFORM_VERSION
asdf global terraform $TERRAFORM_VERSION

