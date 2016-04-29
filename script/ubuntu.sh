#!/usr/bin/env bash

set -e

# Enable to reboot after 30 seconds when panic occured.
# See http://askubuntu.com/questions/43555/how-to-configure-automatic-reboot-after-kernel-panic
if [[ -z $(grep kernel.panic /etc/sysctl.conf) ]]; then
    echo "kernel.panic = 30" |sudo tee -a /etc/sysctl.conf
    sysctl -p
fi

# Deactivate bluetooth on system startup
# See http://askubuntu.com/questions/67758/how-can-i-deactivate-bluetooth-on-system-startup
if [[ -z $(grep "rfkill block bluetooth" /etc/rc.local) ]]; then
    echo "rfkill block bluetooth" |sudo tee -a /etc/rc.local
fi
