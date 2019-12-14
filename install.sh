#!/bin/bash

sudo apt update
sudo dpkg --add-architecture i386
sudo apt install -y build-essential gdb xinetd vim curl \
  libc6-dbg libgmp3-dev unzip \
  libc6-dbg:i386 libncurses5:i386 libstdc++6:i386 \
	python python-dev \
	python3 python3-distutils python3-dev

# Install dotfiles
git clone https://github.com/jakkdu/dotfiles.git
pushd dotfiles
./install.sh
./setup.sh
popd

# Install pip
if ! [ -x $(command -v pip) ]; then
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python get-pip.py --user
	python3 get-pip.py --user
	rm get-pip.py
fi

# Install pwntools
pip2 install --user pwntools pycryptodome
