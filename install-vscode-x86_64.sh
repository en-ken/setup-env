curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt update
sudo apt install -y code

echo === INSTALL EXTENSION ===
code \
--install-extension shakram02.bash-beautify \
--install-extension coenraads.bracket-pair-colorizer \
--install-extension peterjausovec.vscode-docker \
--install-extension dbaeumer.vscode-eslint \
--install-extension grapecity.gc-excelviewer \
--install-extension eamodio.gitlens \
--install-extension ms-ceintl.vscode-language-pack-ja \
--install-extension orta.vscode-jest \
--install-extension shd101wyy.markdown-preview-enhanced \
--install-extension davidanson.vscode-markdownlint \
--install-extension ibm.output-colorizer \
--install-extension jebbs.plantuml \
--install-extension ms-python.python \
--install-extension chrmarti.regex \
--install-extension mimarec.swagger-doc-viewer \
--install-extension shuworks.vscode-table-formatter \
--install-extension shardulm94.trailing-spaces \
--install-extension eg2.tslint \
--install-extension vscodevim.vim