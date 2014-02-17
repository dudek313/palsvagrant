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

apt-get -y install r-base
cd /vagrant
git clone https://github.com/edenduthie/palsR.git
cd palsR
R CMD INSTALL plotrix
R CMD INSTALL pals

R --slave --vanilla --quiet --no-save <<RSCRIPT
install.packages('RJSONIO',repos='http://cran.us.r-project.org')
RSCRIPT

cd /vagrant
npm install meteor
git clone https://github.com/edenduthie/palsweb.git
curl https://install.meteor.com | /bin/sh
npm install -g meteorite
cd ~
mkdir ~/pals
cp -R /vagrant/palsweb/pals/.meteor ~/pals
mount --bind ~/pals/.meteor/ /vagrant/palsweb/pals/.meteor/
sed -i '$ a sudo mount --bind /root/pals/.meteor/ /vagrant/palsweb/pals/.meteor/' ~/.bashrc


apt-get -y install erlang
cd ~
sed -i '$ a deb http://www.rabbitmq.com/debian/ testing main' /etc/apt/sources.list
apt-get update
wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc
apt-get -y --force-yes install rabbitmq-server

cd /vagrant
git clone https://github.com/edenduthie/palsnoder.git

git config --global user.name "Eden Duthie"
git config --global user.email eduthie@gmail.com