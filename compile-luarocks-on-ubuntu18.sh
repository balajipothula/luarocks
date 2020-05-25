#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 25 May 2020,
# Description : Installing / Compiling LuaRocks from Source Code.

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
                    libssl-dev      \
                    make            \
                    unzip

# downloading, extracting and compiling luarocks.
curl -JL https://luarocks.org/releases/luarocks-3.1.3.tar.gz -o $HOME/luarocks.tar.gz && \
tar -xf  $HOME/luarocks.tar.gz -C $HOME                                               && \
rm  -rf  $HOME/luarocks.tar.gz                                                        && \
mv       $HOME/luarocks-* $HOME/luarockssrc                                           && \
cd       $HOME/luarockssrc                                                            && \
./configure --prefix="$HOME/luarocks"                                                    \
            --lua-version="5.2"                                                          \
            --with-lua-bin="$HOME/lua/bin"                                               \
            --with-lua-include="$HOME/lua/include"                                       \
            --with-lua-lib="$HOME/lua/lib"                                               \
            --with-lua-interpreter="lua"                                              && \
make build install
