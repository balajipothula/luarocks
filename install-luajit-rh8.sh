#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 15 August 2019,
# Description : Installing / Compiling LuaJIT from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make

# luajit downloading, extracting and compiling.
curl http://luajit.org/download/LuaJIT-2.0.5.tar.gz -o $HOME/luajitsrc.tar.gz && \
tar -xzf $HOME/luajitsrc.tar.gz -C $HOME                                      && \
rm  -rf  $HOME/luajitsrc.tar.gz                                               && \
mv       $HOME/LuaJIT-* $HOME/luajitsrc                                       && \
cd       $HOME/luajitsrc                                                      && \
make                                                                          && \
make install CC="gcc -m32" TARGET_SYS=Linux PREFIX=$HOME/luajit               && \
cd       $HOME                                                                && \
rm  -rf  $HOME/luajitsrc                                                      && \
echo "export PATH=$PATH:$HOME/luajit/bin" >> $HOME/.bashrc                    && \
exec $BASH
