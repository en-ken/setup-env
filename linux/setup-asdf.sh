#!/bin/bash
GO_VERSION=$(asdf latest golang)
NODE_VERSION=$(asdf latest nodejs)
PYTHON_VERSION=$(asdf latest python)
RUST_VERSION=$(asdf latest rust)

asdf install golang $GO_VERSION
asdf global golang $GO_VERSION

bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs $NODE_VERSION
asdf global nodejs $NODE_VERSION

sudo apt install libffi-dev
asdf install python $PYTHON_VERSION
asdf global python $PYTHON_VERSION

asdf install rust $RUST_VERSION
asdf global rust $RUST_VERSION

# completions
mkdir -p ~/.config/fish/completions && cp "$(brew --prefix asdf)/asdf.fish" ~/.config/fish/completions

