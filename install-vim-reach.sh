if [ ! -f ~/.vim/autoload/plug.vim ]; then curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; else echo "plug.vim already exists - skipping"; fi
if [ ! -f ~/.vim/syntax/javascript.vim ]; then curl -fLo ~/.vim/syntax/javascript.vim --create-dirs https://raw.githubusercontent.com/pangloss/vim-javascript/master/syntax/javascript.vim; else echo "javascript.vim already exists - skipping"; fi
rm -rf vscode-reach
unzip -d vscode-reach reachsh.reach-ide-0.12.0.vsix
mkdir ~/.vim/reach-ide
cp -R vscode-reach/extension/server ~/.vim/reach-ide
rm -rf vscode-reach
cp -n .vimrc ~/.vimrc
retVal=$?
vim +PlugInstall +qall
if [ $retVal -ne 0 ]; then
    echo "The ~/.vimrc file already exists and will not be overwritten. Manually edit its configuration according to https://github.com/ericglau/vim-reach/blob/master/.vimrc"
    echo "Vim Reach has been installed, but the ~/.vimrc file must be manually configured."
else
    echo "Vim Reach has been successfully installed!"
fi