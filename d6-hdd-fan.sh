#!/bin/bash

PWM_MIN=100
PWM_MAX=183
TEMP_LOW=25
TEMP_HIGH=50

# Auto-detect zettlab hwmon
for hw in /sys/class/hwmon/hwmon*; do
    if ls $hw/pwm1 &>/dev/null; then
        HWMON="$hw"
    fi
done

while true; do
    # Get max HDD temp (only /dev/sdX drives, ignores NVMe)
    MAX_TEMP=0
    for disk in /dev/sd?; do
        temp=$(smartctl -A "$disk" 2>/dev/null | awk '/Temperature_Celsius/ {print $10}')
        if [[ -n "$temp" && "$temp" -gt "$MAX_TEMP" ]]; then
            MAX_TEMP=$temp
        fi
    done

    # If no temps found, default safe value
    if [[ "$MAX_TEMP" -eq 0 ]]; then
        PWM=$PWM_MIN
    elif [[ "$MAX_TEMP" -ge $TEMP_HIGH ]]; then
        PWM=$PWM_MAX
    elif [[ "$MAX_TEMP" -le $TEMP_LOW ]]; then
        PWM=$PWM_MIN
    else
        PWM=$((PWM_MIN + (MAX_TEMP - TEMP_LOW) * (PWM_MAX - PWM_MIN) / (TEMP_HIGH - TEMP_LOW)))
    fi

    # Apply to both rear fans
    echo $PWM > $HWMON/pwm1
    echo $PWM > $HWMON/pwm2

    # Debug output (optional)
    echo "HDD Temp: $MAX_TEMP°C | PWM: $PWM"

    sleep 20
done
