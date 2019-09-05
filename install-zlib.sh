#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 05 September 2019,
# Description : Installing / Compiling UnZip from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make

# unzip downloading, extracting and compiling.
curl -JL https://www.zlib.net/zlib-1.2.11.tar.gz -o zlib.tar.gz && \
tar -xzf $HOME/zlib.tar.gz -C $HOME                             && \
rm  -rf  $HOME/zlib.tar.gz                                      && \
mv       $HOME/zlib-* $HOME/zLib                                && \
cd       $HOME/zLib                                             && \
./configure --prefix=$HOME/zlib                                 && \
make install                                                    && \
cd       $HOME                                                  && \
rm  -rf  $HOME/zLib                                             && \
rm  -rf  $HOME/zlib/share/man                                   && \
echo "export PATH=$PATH:$HOME/zlib" >> $HOME/.bashrc            && \
exec $BASH
