#!/usr/bin/env bash

apt-get -y update
apt-get -y install make
apt-get -y install g++
apt-get -y install curl
apt-get -y install rpm
apt-get -y install chkconfig
apt-get -y install initscripts
apt-get -y install git
cd ~
git clone git://github.com/joyent/node.git
cd node
git checkout v0.10.16-release
./configure
make
make install
cd ~
git clone https://github.com/isaacs/npm.git
cd npm
make install

sed -i '$ a deb http://cran.ms.unimelb.edu.au/bin/linux/ubuntu precise/' /etc/apt/sources.list
apt-get update
apt-get -y --force-yes install r-base
cd /vagrant
git clone https://github.com/dudek313/palsR.git
cd palsR
R CMD INSTALL plotrix
R CMD INSTALL pals
mkdir /pals
mkdir /pals/executions
mkidr /pals/data
apt-get -y install libnetcdf-dev
apt-get -y install netcdf-bin
R --slave --vanilla --quiet --no-save <<RSCRIPT
install.packages('RJSONIO',repos='http://cran.us.r-project.org')
install.packages('ncdf',repos='http://cran.us.r-project.org')
install.packages('boot',repos='http://cran.us.r-project.org')
RSCRIPT

cd /vagrant
npm install meteor
git clone https://github.com/dudek313/palsweb.git
curl https://install.meteor.com | /bin/sh
npm install -g meteorite
cd ~
mkdir ~/pals
cp -R /vagrant/palsweb/pals/.meteor ~/pals
mount --bind ~/pals/.meteor/ /vagrant/palsweb/pals/.meteor/
sed -i '$ a sudo mount --bind /root/pals/.meteor/ /vagrant/palsweb/pals/.meteor/' ~/.bashrc


apt-get -y install redis-server

cd /vagrant
git clone https://github.com/dudek313/palsnoder.git

git config --global user.name "David Fuchs"
git config --global user.email d.fuchs@unsw.edu.au