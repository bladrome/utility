
termux-setup-storage

sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
pkg update && pkg upgrade

pkg install -y openssh git zsh wget proot tmux
chsh -s zsh
sshd


git clone https://gitee.com/lu_x/ohmyzsh.git .oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

passwd `whoami`
