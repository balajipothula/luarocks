#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 12 August 2019,
# Description : Installing / Compiling Lua from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make

# zlib downloading, extracting and compiling.
curl -JL https://zlib.net/zlib-1.2.11.tar.gz -o $HOME/zlib.tar.gz && \
tar -xzf $HOME/zlib.tar.gz -C $HOME                               && \
rm  -rf  $HOME/zlib.tar.gz                                        && \
mv       $HOME/zlib-* $HOME/zlibsrc                               && \
cd       $HOME/zlibsrc                                            && \
./configure --prefix=$HOME/zlib                                   && \
make install                                                      && \
cd       $HOME                                                    && \
rm  -rf  $HOME/zlibsrc
