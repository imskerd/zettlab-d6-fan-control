# Zettlab D6 Fan Control (Proxmox / Linux)

Custom fan control for Zettlab D6 Ultra using HDD temperatures.

## Features
- HDD-based fan control (SMART temps)
- Automatic PWM scaling
- Systemd service (runs on boot)
- Kernel module for fan access

## Requirements
- Debian / Proxmox
- smartmontools

## Install

```bash
git clone https://github.com/YOUR-USERNAME/zettlab-d6-fan-control.git
cd zettlab-d6-fan-control
chmod +x install.sh
sudo ./install.sh


## Notes
- If your system updates to a new kernel, rerun:
  make clean && make
  and reinstall the module
