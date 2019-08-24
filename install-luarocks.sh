#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 12 August 2019,
# Description : Installing / Compiling LuaRocks from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc git make readline-devel unixODBC-devel unzip

# downloading, extracting and compiling luarocks.
curl -J -L https://luarocks.org/releases/luarocks-3.1.3.tar.gz -o $HOME/luarocks.tar.gz && \
tar -xzf $HOME/luarocks.tar.gz -C $HOME                                                 && \
rm  -rf  $HOME/luarocks.tar.gz                                                          && \
mv       $HOME/luarocks-* $HOME/luarocks                                                && \
cd       $HOME/luarocks                                                                 && \
./configure --prefix="$HOME/luarocks"                                                      \
            --lua-version="5.1"                                                            \
            --with-lua-bin="$HOME/lua/bin"                                                 \
            --with-lua-include="$HOME/lua/include"                                         \
            --with-lua-lib="$HOME/lua/lib"                                                 \
            --with-lua-interpreter="lua"                                                && \
make build install bootstrap                                                            && \
export PATH=$PATH:$HOME/luarocks/bin                                                    && \
echo "export PATH=$PATH:$HOME/luarocks/bin" >> $HOME/.bashrc                            && \
luarocks path >> $HOME/.bashrc
