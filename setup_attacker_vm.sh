#!/bin/bash
echo "Starting Attacker Machine Configuration"

# Update and install neccessary tools
echo "Updating packages and installing Hydra and Nmap"
sudo apt update && sudo apt upgrade -y
sudo apt install -y hydra nmap

# Display the network configuration
echo "Your Attacker Machine IP Address is:"
ip addr show | grep "inet " | awk '{print $2}'

echo "Attacker Machine Setup Complete! You can now use Hydra and Nmap to simulate attacks."
