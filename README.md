palsvagrant
===========

Development environment for pals using vagrant and VirtualBox

Instructions:

1. Install Vagrant for your system from http://www.vagrantup.com/downloads.html.
2. Install VirtualBox for your system from https://www.virtualbox.org/wiki/Downloads.
3. Clone this repo 'git clone https://github.com/edenduthie/palsvagrant.git'
4. Start up the virtual machine 'cd palsvagrant' 'vagrant up'. This will take a while as it will download the precise64 base box.
5. Log into the pals machine with 'vagrant ssh'.
6. Swap to root 'sudo su'.
7. 'source ~/.bashrc'.
8. cd /vagrant/palsnoder/server
9. 'node sendmessage.js'
10. 'node server.js'
11. Open a new terminal and 'cd palsvagrant' 'vagrant ssh'.
12. 'cd /vagrant/palsWeb/pals'
13. 'mrt'
14. ^C
15. 'meteor --port=80'
16. If you get complaints about missing packages type 'npm install packagename' for each packagename complained about. (e.g. ampq).
17. PALS should then be available on your host machine via http://localhost:8080.
