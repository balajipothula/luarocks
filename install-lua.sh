#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 12 August 2019,
# Description : Installing / Compiling Lua from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make readline-devel

# lua downloading, extracting and compiling.
curl -JL http://www.lua.org/ftp/lua-5.1.1.tar.gz -o $HOME/lua.tar.gz                && \
tar -xzf $HOME/lua.tar.gz -C $HOME                                                  && \
rm  -rf  $HOME/lua.tar.gz                                                           && \
mv       $HOME/lua-* $HOME/Lua                                                      && \
sed -i 's/INSTALL_TOP= \/usr\/local/INSTALL_TOP= ${HOME}\/lua/' $HOME/Lua/Makefile  && \
cd       $HOME/Lua                                                                  && \
make linux install                                                                  && \
cd       $HOME                                                                      && \
rm -rf   $HOME/Lua                                                                  && \
rm -rf   $HOME/lua/man                                                              && \
echo "export PATH=$PATH:$HOME/lua/bin" >> $HOME/.bashrc                             && \
exec $BASH
