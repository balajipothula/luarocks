#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 15 January 2021,
# Description : Installing / Compiling Lua Static build from Source Code.

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
                    make            \
                    musl-tools

# lua downloading, extracting and compiling.
# make posix CC="musl-gcc -static"
curl -JL http://www.lua.org/ftp/lua-5.4.2.tar.gz -o $HOME/luasrc.tar.gz               && \
tar  -xf $HOME/luasrc.tar.gz -C $HOME                                                 && \
rm   -rf $HOME/luasrc.tar.gz                                                          && \
mv       $HOME/lua-* $HOME/luasrc                                                     && \
sed -i 's|INSTALL_TOP= \/usr\/local|INSTALL_TOP= ${HOME}\/lua|' $HOME/luasrc/Makefile && \
cd       $HOME/luasrc                                                                 && \
make posix CC="gcc -static"                                                           && \
make linux install                                                                    && \
cd       $HOME                                                                        && \
rm  -rf  $HOME/luasrc                                                                 && \
echo "export PATH=$PATH:$HOME/lua/bin" >> $HOME/.bashrc                               && \
exec $BASH
