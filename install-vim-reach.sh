curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/syntax/javascript.vim --create-dirs https://raw.githubusercontent.com/pangloss/vim-javascript/master/syntax/javascript.vim
rm -rf vscode-reach
unzip -d vscode-reach reachsh.reach-ide-0.12.0.vsix
mkdir ~/.vim/reach-ide
cp -R vscode-reach/extension/server ~/.vim/reach-ide
rm -rf vscode-reach
cp -n .vimrc ~/.vimrc
vim +PlugInstall +qall