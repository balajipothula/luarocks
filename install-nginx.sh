#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 12 August 2019,
# Description : Installing / Compiling NGINX from Source Code.

# update package repositories.
sudo yum -y update

# installing build essentials.
sudo yum -y install gcc gcc-c++ make autoconf automake

# zlib downloading, extracting and compiling.
curl -JL https://zlib.net/zlib-1.2.11.tar.gz -o $HOME/zlib.tar.gz && \
tar -xzf $HOME/zlib.tar.gz -C $HOME                               && \
rm  -rf  $HOME/zlib.tar.gz                                        && \
mv       $HOME/zlib-* $HOME/zlibsrc                               && \
mkdir -p $HOME/zlib                                               && \
cd       $HOME/zlibsrc                                            && \
./configure --prefix=$HOME/zlib                                   && \
make install                                                      && \
cd       $HOME                                                    && \
rm  -rf  $HOME/zlibsrc

# pcre downloading, extracting and compiling.
curl -JL https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.gz -o $HOME/pcre.tar.gz && \
tar -xzf $HOME/pcre.tar.gz -C $HOME                                          && \
rm  -rf  $HOME/pcre.tar.gz                                                   && \
mv       $HOME/pcre-* $HOME/pcresrc                                          && \
mkdir -p $HOME/pcre                                                          && \
cd       $HOME/pcresrc                                                       && \
./configure --prefix=$HOME/pcre                                              && \
make install                                                                 && \
cd       $HOME                                                               && \
rm  -rf  $HOME/pcresrc

# libressl downloading, extracting and compiling.
curl -JL https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.6.1.tar.gz -o $HOME/libressl.tar.gz && \
tar -xzf $HOME/libressl.tar.gz -C $HOME                                                              && \
rm  -rf  $HOME/libressl.tar.gz                                                                       && \
mv       $HOME/libressl-* $HOME/libresslsrc                                                          && \
mkdir -p $HOME/libressl                                                                              && \
cd       $HOME/libresslsrc                                                                           && \
./configure --prefix=$HOME/libressl                                                                  && \
make install                                                                                         && \
cd       $HOME                                                                                       && \
rm  -rf  $HOME/libresslsrc


# nginx downloading, extracting and compiling.
curl -JL http://nginx.org/download/nginx-1.12.1.tar.gz -o $HOME/nginx.tar.gz && \
tar -xzf $HOME/nginx.tar.gz -C $HOME                                         && \
rm  -rf  $HOME/nginx.tar.gz                                                  && \
mv       $HOME/nginx-* $HOME/nginxsrc                                        && \
mkdir -p $HOME/nginx                                                         && \
cd       $HOME/nginxsrc                                                      && \
./configure --prefix=$HOME/nginx                                                \
            --without-http_scgi_module                                          \
            --without-http_uwsgi_module                                         \
            --without-http_fastcgi_module                                       \
            --with-cc-opt='-static -static-libgcc'                              \
            --with-cpu-opt=generic                                              \
            --with-pcre=$HOME/pcre                                              \
            --with-pcre-jit                                                     \
            --with-zlib=$HOME/zlib                                              \
            --with-openssl=$HOME/libressl                                       \
            --with-http_ssl_module                                           && \
make install                                                                 && \
cd       $HOME                                                               && \
rm  -rf  $HOME/nginxsrc
