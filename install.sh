# this installation script assumes you have already installed
# zsh, vim, tmux with relatively new version

# clone the dot-files repo first
git clone --recursive git@github.com:jinjiren/dot-files.git ~/dot-files

# soft link for dot files
ln -s ~/dot-files/zsh-config/zshrc ~/.zshrc
ln -s ~/dot-files/tmux-config/tmux.conf ~/.tmux.conf
ln -s ~/dot-files/vim-config ~/.vim

# install zsh, oh-my-zsh (git is required)
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# change default shell to zsh
chsh -s /bin/zsh
# zsh plugins
ZSH_CUSTOM=$HOME/dot-files/zsh-config/custom
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh themes
git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k
# dircolors for solarized scheme
git clone https://github.com/seebi/dircolors-solarized
cp dircolors-solarized/dircolors.256dark ~/.dircolors
rm -rf dircolors-solarized

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
source ~/.zshrc
pyenv install anaconda3-4.4.0
