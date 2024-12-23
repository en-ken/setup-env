echo ==== install fisher ==
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

echo ===== bass ==
fisher install edc/bass

echo ===== theme ==
fisher add omf/theme-bobthefish
fisher install rafaelrinaldi/pure

echo ===== fzf ==
fisher install jethrokuan/fzf

echo ===== z ==
fisher install jethrokuan/z

echo ===== ghq ==
fisher install decors/fish-ghq
