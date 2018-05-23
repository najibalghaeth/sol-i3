#!/bin/bash

sudo eopkg it git make python-configobj libisoburn syslinux

git clone https://dev.solus-project.com/source/common
git clone https://dev.solus-project.com/source/solus-image-budgie solus-image-i3

ln -sv common/Makefile.common .
ln -sv common/Makefile.toplevel Makefile
ln -sv common/Makefile.iso .

cd solus-image-i3
cp ../packages .

sed -i '
	s/Solus/Sol/g; 
	s/Budgie/i3/g;
	s/gzip/"xz -Xbcj x86 -b 1M"/; 
	s/false/true/
	' image.conf

make
