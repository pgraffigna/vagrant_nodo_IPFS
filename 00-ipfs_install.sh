#!/bin/bash

VERSION=v0.7.0
URL=https://dist.ipfs.io/go-ipfs/"$VERSION"/go-ipfs_"$VERSION"_linux-amd64.tar.gz
TAR=go-ipfs_"$VERSION"_linux-amd64.tar.gz

sudo apt update
sudo apt install -y golang-go
export PATH=$PATH:$GOROOT/bin:$GOPATH/
export GOPATH=$HOME/go
wget "$URL"
tar xvfz "$TAR"
sudo mv go-ipfs/ipfs /usr/local/bin/ipfs

rm "$TAR"

ipfs init



