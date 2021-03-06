#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 29 August 2019,
# Description : Installing / Compiling YAML from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc make perl readline-devel zlib zlib-devel

# downloading, extracting and compiling yaml.
curl -JL http://pyyaml.org/download/libyaml/yaml-0.1.5.tar.gz -o $HOME/yaml.tar.gz && \
tar -xzf $HOME/yaml.tar.gz -C $HOME                                                && \
rm  -rf  $HOME/yaml.tar.gz                                                         && \
mv       $HOME/yaml-* $HOME/YAML                                                   && \
cd       $HOME/YAML                                                                && \
./configure --prefix=$HOME/yaml                                                    && \
make install                                                                       && \
cd       $HOME                                                                     && \
rm  -rf  $HOME/YAML
