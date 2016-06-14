#!/bin/sh

UBUNTU_VERSION=xenial
DOWNLOAD_FILE=puppetlabs-release-pc1-$UBUNTU_VERSION.deb
if [ ! -f $DOWNLOAD_FILE ]; then
        echo getting the .deb file to enable the puppet repository on $UBUNTU_VERSION
        wget https://apt.puppetlabs.com/$DOWNLOAD_FILE -O $DOWNLOAD_FILE
fi

echo installing the deb file
sudo dpkg -i $DOWNLOAD_FILE

echo updating the package manager
sudo apt-get update

echo installing puppet
sudo apt-get install puppet-agent

echo "adding the location of the puppet directory to PATH (This is done because the puppet-agent doesn't really run the interative puppet command)"
echo "export PATH=$PATH:/opt/puppetlabs/bin" >> ~/.profile
echo "complete! now reload the .profile file (source ~/.profile might work) or re-login and run: puppet -V"

echo "copying contents tp puppets config"
echo 'cat puppet.conf >> /etc/puppetlabs/puppet/puppet.conf' | sudo -s

echo "installing librarian puppet"
sudo apt-get install make ruby ruby-dev
sudo gem install librarian-puppet puppet

echo "initializing librarian puppet in /etc/puppetlabs/code/environments/production"
cd /etc/puppetlabs/code/environments/production
#sudo rm -rf modules
#sudo librarian-puppet init

