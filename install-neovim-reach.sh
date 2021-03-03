sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/syntax/javascript.vim --create-dirs https://raw.githubusercontent.com/pangloss/vim-javascript/master/syntax/javascript.vim'
rm -rf vscode-reach
unzip -d vscode-reach reachsh.reach-ide-0.12.0.vsix
sh -c 'mkdir "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/reach-ide'
sh -c 'cp -R vscode-reach/extension/server "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/reach-ide'
rm -rf vscode-reach
mkdir ~/.config/nvim
cp -n init.vim ~/.config/nvim/init.vim
retVal=$?
nvim +PlugInstall +qall
if [ $retVal -ne 0 ]; then
    echo "The ~/.config/nvim/init.vim file already exists and will not be overwritten. Manually edit its configuration according to https://github.com/ericglau/vim-reach/blob/master/init.vim"
    echo "Neovim Reach has been installed, but the ~/.config/nvim/init.vim file must be manually configured."
else
    echo "Neovim Reach has been successfully installed!"
fi