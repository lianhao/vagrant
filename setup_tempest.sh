#!/usr/bin/env bash

set -e

sudo rm -rf /opt/stack
sudo mkdir -p /opt/stack
sudo chown vagrant /opt/stack

cd devstack
cp /vagrant/tempest.conf  local.conf
./stack.sh
