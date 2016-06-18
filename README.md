# puppet-bootstrap
install and bootstrap puppet in masterless mode

This downloads puppet from the puppet repos and installs it for ubuntu based os's based on trusty
it the installs puppet (agent) and sets up the path variable to point to /opt/puppetlabs/bin

Then installs make, librarian puppet and ruby tools

Requires: git

Usage: 
- git clone https://github.com/General-Meow/puppet-bootstrap.git bootstrap
- cd bootstrap
- chmod +x install-puppet-\<VERSION>.sh
- ./install-puppet-\<VERSION>.sh
- puppet --version
