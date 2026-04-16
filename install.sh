#!/bin/bash

set -e

echo "Installing Zettlab fan control..."

# Build module
cd zettlab-d8-fans
make clean
make

# Install module
cp zettlab_d8_fans.ko /lib/modules/$(uname -r)/
depmod

# Enable module on boot
grep -qxF 'zettlab_d8_fans' /etc/modules || echo 'zettlab_d8_fans' >> /etc/modules

# Copy script
cp ../d6-hdd-fan.sh /usr/local/bin/
chmod +x /usr/local/bin/d6-hdd-fan.sh

# Copy service
cp ../d6-hdd-fan.service /etc/systemd/system/

# Enable + start service
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable d6-hdd-fan.service
systemctl restart d6-hdd-fan.service

echo "Done."
