#!/bin/bash

sudo eopkg it git make python-configobj libisoburn syslinux

git clone https://github/atommixz/sol-i3
cd sol-i3

git clone https://dev.solus-project.com/source/common
git clone https://dev.solus-project.com/source/solus-image-budgie solus-image-i3

ln -sv common/Makefile.common .
ln -sv common/Makefile.toplevel Makefile
ln -sv common/Makefile.iso .

cp packages solus-image-i3

cd solus-image-i3

sed -i '
	s/Solus/Sol/g; 
	s/Budgie/i3/g;
	s/gzip/"xz -Xbcj x86 -b 1M"/; 
	s/false/true/
	' image.conf

make
