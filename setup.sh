#!/bin/bash

echo -e "\033[32m\nDownload vim-plug\033[0m"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "\033[32m\nDownload .vimrc of siahuat0727\033[0m"
curl -fLo ~/.vimrc \
    https://raw.githubusercontent.com/siahuat0727/vimrc/master/.vimrc

echo -e "\033[32m\nDownload plugins and install\033[0m"
vim +'silent! PlugInstall' +qall < /dev/tty

echo -e "\033[32m\nFinished, enjoy your vim\033[0m"
