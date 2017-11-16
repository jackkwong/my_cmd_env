ln -s `pwd`/.vimrc ~/.vimrc

# setup for NeoVim
mkdir -p ~/.vim
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
