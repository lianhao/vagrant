#!/usr/bin/env bash

set -e

sudo cp -f /vagrant/sources.list /etc/apt/
sudo apt-get update -y
sudo apt-get install puppet git -y
git clone https://github.com/openstack-dev/devstack 
sudo apt-get install openvswitch-switch -y
sudo ovs-vsctl add-br br-int
