# Zettlab D6 Fan Control

Fan control for Zettlab D6 Ultra using HDD temperatures on Proxmox/Linux.

---

## Features

- HDD temperature-based fan control
- Automatic fan speed scaling
- Systemd service (runs on boot)
- DKMS support (auto rebuild on kernel updates)

---

## Installation

### Option 1: One-line install (recommended)

sudo apt update && sudo apt install -y git && git clone https://github.com/imskerd/zettlab-d6-fan-control.git && cd zettlab-d6-fan-control && chmod +x install.sh && sudo ./install.sh

---

### Option 2: One-line install (no git required)

curl -fsSL https://raw.githubusercontent.com/imskerd/zettlab-d6-fan-control/main/install-online.sh | sudo bash

---

### Step-by-step install

git clone https://github.com/imskerd/zettlab-d6-fan-control.git
cd zettlab-d6-fan-control
chmod +x install.sh
sudo ./install.sh

The installer will automatically install required dependencies:
- dkms
- build-essential
- smartmontools

---

## Quick Test

After installation, run:

ls /sys/class/hwmon/*/pwm*

If you see pwm1 and pwm2, the fan driver is working.

Check the service:

systemctl status d6-hdd-fan.service

It should show:
active (running)

---

## How It Works

- Reads HDD temperatures using smartctl
- Finds the highest temperature across all drives
- Maps temperature to fan speed (PWM)
- Writes fan speed to the system hardware controller
- Runs continuously via systemd

---

## Notes

- This project uses DKMS, so the fan driver will automatically rebuild on kernel updates.
- No manual recompilation is required.
- Designed for Zettlab D6 Ultra, but may work on similar models using the same controller.

---

## Credits

Fan control driver based on the Zettlab D8 project:
https://github.com/Haveacry/zettlab-d8-fans

Originally developed by Dean Holland.

Tested and confirmed working on Zettlab D6 Ultra.
