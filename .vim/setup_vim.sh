#! /bin/sh
cd ~
git clone git@github.com:vim/vim.git
cd vim

# setup dependence
sudo apt update
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

# remove old ver
sudo apt remove vim vim-runtime gvim

# config
./configure --with-features=huge \
            --enable-multibyte \
    	    --enable-rubyinterp=yes \
	        --enable-pythoninterp=yes \
	        --with-python-config-dir=/usr/lib/python2.7/config \ # pay attention here check directory correct
    	    --enable-python3interp=yes \
	        --with-python3-config-dir=/usr/lib/python3.5/config \
    	    --enable-perlinterp=yes \
    	    --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
    	   --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81

# install
sudo apt install checkinstall
cd ~/vim
sudo checkinstall

# show vim version
vim --version

