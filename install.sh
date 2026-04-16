#!/bin/bash
set -e

echo "Installing Zettlab fan control..."

# Install dependencies
apt update
apt install -y dkms build-essential smartmontools

# Install DKMS driver
mkdir -p /usr/src/zettlab-d6-fans-1.0
cp -r driver/* /usr/src/zettlab-d6-fans-1.0/

cat <<EOF > /usr/src/zettlab-d6-fans-1.0/dkms.conf
PACKAGE_NAME="zettlab-d6-fans"
PACKAGE_VERSION="1.0"
BUILT_MODULE_NAME[0]="zettlab_d8_fans"
DEST_MODULE_LOCATION[0]="/extra"
AUTOINSTALL="yes"
EOF

dkms add -m zettlab-d6-fans -v 1.0 2>/dev/null || true
dkms build -m zettlab-d6-fans -v 1.0 2>/dev/null || true
dkms install -m zettlab-d6-fans -v 1.0 2>/dev/null || true

modprobe zettlab_d8_fans

# Install script
cp d6-hdd-fan.sh /usr/local/bin/
chmod +x /usr/local/bin/d6-hdd-fan.sh

# Install service
cp d6-hdd-fan.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable d6-hdd-fan.service
systemctl restart d6-hdd-fan.service

echo "Installation complete."
