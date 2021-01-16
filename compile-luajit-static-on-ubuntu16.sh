#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 16 January 2021,
# Description : Installing / Compiling LuaJIT from Source Code.

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


# luajit downloading, extracting and compiling.
curl http://luajit.org/download/LuaJIT-2.0.5.tar.gz -o $HOME/luajitsrc.tar.gz && \
tar -xzf $HOME/luajitsrc.tar.gz -C $HOME                                      && \
rm  -rf  $HOME/luajitsrc.tar.gz                                               && \
mv       $HOME/LuaJIT-* $HOME/luajitsrc                                       && \
cd       $HOME/luajitsrc                                                      && \
make clean                                                                    && \
make STATIC_CC="/usr/bin/musl-gcc" CCOPT="-static -fPIC" BUILDMODE="static"   && \
make install PREFIX=$HOME/luajit                                              && \
cd       $HOME                                                                && \
rm  -rf  $HOME/luajitsrc                                                      && \
echo "export PATH=$PATH:$HOME/luajit/bin" >> $HOME/.bashrc                    && \
exec $BASH
