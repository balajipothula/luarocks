## kong dependency bundles installation on rhel8 machine.

step-01: ./install-lua.sh  
step-02: ./install-unzip.sh  
step-03: ./install-luarocks.sh  
step-04: ./install-zlib.sh  
step-05: ./install-openssl.sh  
step-06: ./install-yaml.sh  
step-07: ./install-kong-dependency-bundles.sh  

listing luarocks installed packages.  
step-08: luarocks list --porcelain  

listing luarocks c libraries.  
step-08: ls $HOME/luarocks/lib/lua/5.1  

listing luarocks lua libraries.  
step-10: ls $HOME/luarocks/share/lua/5.1  
