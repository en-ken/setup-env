set GO_VERSION '1.13.6'
set NODE_VESION '12.14.1'

echo ==== goenv ==
goenv install {$GO_VERSION}
goenv global {$GO_VESION}
if not test -d ~/go
    mkdir ~/go
end

echo ==== nodenv ==
nodenv install {$NODE_VERSION}
nodenv global {$NODE_VERSION}
