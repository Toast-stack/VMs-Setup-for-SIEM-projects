#!/bin/bash

echo "Starting Victim Machine Configuration"

# Update and install OpennSSH Server
Echo "Updating packages and installing OpenSSH Server"
sudo apt update && sudo apt upgrade -y
sudo apt install -y openssh-server

# Enable and start SSH Service
echo "Enabling and starting SSH service"
sudo systemctl enable ssh
sudo systemctl start ssh

# Check SSH service status
echo "Checking SSH service status"
sudo systemctl status | grep Active

# Display the machine's IP address
echo "Your Victim Machine IP Address is:"
ip addr show | grep "inet" | awk '{print $2}'

echo "Victim Machine setup complete! Make sure this machine can communicate with your host and attacker machine."
