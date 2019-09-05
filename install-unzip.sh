#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 05 September 2019,
# Description : Installing / Compiling UnZip from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make

# unzip downloading, extracting and compiling.
curl -JL https://downloads.sourceforge.net/infozip/unzip60.tar.gz -o unzip.tar.gz && \
tar -xzf $HOME/unzip.tar.gz -C $HOME                                              && \
rm  -rf  $HOME/unzip.tar.gz                                                       && \
mv       $HOME/unzip* $HOME/UnZip                                                 && \
cd       $HOME/UnZip                                                              && \
make prefix=$HOME/unzip -f unix/Makefile generic install                          && \
rm  -rf  $HOME/UnZip                                                              && \
rm  -rf  $HOME/unzip/man                                                          && \
echo "export PATH=$PATH:$HOME/unzip/bin" >> $HOME/.bashrc                         && \
exec $BASH
