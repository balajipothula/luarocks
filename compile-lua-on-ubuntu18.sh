#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 02 May 2020,
# Description : Installing / Compiling NGINX from Source Code.

# exit immediately if a command exits with a non-zero exit status.
set -e

# debugging shell script.
set -x

# update package repositories.
sudo apt -y update

# upgrading packages.
sudo apt -y upgrade

# build essentials installing.
sudo apt -y install autoconf        \
                    automake        \
                    build-essential \
                    g++             \
                    gcc             \
                    git             \
                    libreadline-dev \
                    make

# lua downloading, extracting and compiling.
curl -JL http://www.lua.org/ftp/lua-5.3.5.tar.gz -o lua.tar.gz                        && \
tar  -xf $HOME/lua.tar.gz -C $HOME                                                    && \
rm   -rf $HOME/lua.tar.gz                                                             && \
mv       $HOME/lua-* $HOME/luasrc                                                     && \
sed -i 's/INSTALL_TOP= \/usr\/local/INSTALL_TOP= ${HOME}\/lua/' $HOME/luasrc/Makefile && \
cd       $HOME/luasrc                                                                 && \
make linux test
