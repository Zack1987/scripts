#!/bin/bash

# update.sh - Script description
# Author: Zack
# Date: $(date +"%Y-%m-%d")

Sudo apt update && sudo apt upgrade -y
# Check if the update was successful
if [ $? -eq 0 ]; then
    echo "System update completed successfully."
else
    echo "System update failed. Please check the logs for details."
    exit 1
fi
# Clean up unnecessary packages
sudo apt autoremove -y
# Check if the autoremove was successful
if [ $? -eq 0 ]; then
    echo "Unnecessary packages removed successfully."
else
    echo "Failed to remove unnecessary packages. Please check the logs for details."
    exit 1
fi
# Clean up package cache
sudo apt clean
# Check if the clean was successful
if [ $? -eq 0 ]; then
    echo "Package cache cleaned successfully."
else
    echo "Failed to clean package cache. Please check the logs for details."
    exit 1
fi
# Notify the user that the script has completed
echo "Update script completed successfully."
#check to see if there is a distro upgrade available
if [ -x "$(command -v do-release-upgrade)" ]; then
    echo "Checking for distribution upgrades..."
    sudo do-release-upgrade -f DistUpgradeViewNonInteractive
    if [ $? -eq 0 ]; then
        echo "Distribution upgrade completed successfully."
    else
        echo "No distribution upgrade available or the upgrade failed. Please check the logs for details."
    fi
else
    echo "do-release-upgrade command not found. Skipping distribution upgrade check."
fi
# Notify the user that the script has completed
echo "All updates and cleanups have been completed successfully."
# Exit the script
exit 0
# Note: This script requires root privileges to run. Use sudo to execute it.
# Usage: ./update.sh

# End of update.sh