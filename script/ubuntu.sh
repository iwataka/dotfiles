#!/usr/bin/env bash

set -e

# Enable to reboot after 30 seconds when panic occured.
if [[ -z $(grep kernel.panic /etc/sysctl.conf) ]]; then
    echo "kernel.panic = 30" |sudo tee -a /etc/sysctl.conf
    sysctl -p
fi

# Deactivate bluetooth on system startup
if [[ -z $(grep InitiallyPowered /etc/bluetooth/main.conf) ]]; then
    echo "InitiallyPowered = false" |sudo tee -a /etc/bluetooth/main.conf
fi
