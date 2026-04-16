#!/bin/bash
set -e

echo "Installing Zettlab D6 Fan Control..."

# Install dependencies
apt update
apt install -y git dkms build-essential smartmontools

# Download repo
cd /tmp
rm -rf zettlab-d6-fan-control
git clone https://github.com/imskerd/zettlab-d6-fan-control.git
cd zettlab-d6-fan-control

# Run installer
chmod +x install.sh
./install.sh

echo "Done."
