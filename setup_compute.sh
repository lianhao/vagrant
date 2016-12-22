#!/usr/bin/env bash

set -e

sudo rm -rf /opt/stack
sudo mkdir -p /opt/stack
sudo chown vagrant /opt/stack

cd devstack
cp /vagrant/compute.conf local.conf
ip=`ifconfig | grep 192.168.1 | cut -f2 -d: | cut -f1 -d' '`
host=`hostname`
sed -i -e "s/HOSTIP/$ip/" -e "s/HOSTNAME/$host/" local.conf
./stack.sh
