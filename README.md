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


## Credits

Fan control driver based on the Zettlab D8 project:

https://github.com/Haveacry/zettlab-d8-fans

Originally developed by Dean Holland.

Tested and confirmed working on Zettlab D6 Ultra.



## Install

```bash
git clone https://github.com/imskerd/zettlab-d6-fan-control.git
cd zettlab-d6-fan-control
chmod +x install.sh
sudo ./install.sh


## Notes
- If your system updates to a new kernel, rerun:
  make clean && make
  and reinstall the module
