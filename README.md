# VMs-Setup-for-SIEM-projects
A comprehensive step-by-step guide to setting up Virtual Machines (VMs) for cybersecurity labs and learning environments. This repository is tailored for first-time users and provides everything you need to replicate an attacker-victim scenario while configuring and experimenting with network settings
---

## Table of Contents

1. [Introduction](#introduction)
2. [What You'll Learn](#what-youll-learn)
3. [Prerequisites](#prerequisites)
4. [Step-by-Step VM Setup](#step-by-step-vm-setup)
5. [Networking Configuration](#networking-configuration)
6. [Troubleshooting](#troubleshooting)
7. [Resources](#resources)
8. [Contributing](#contributing)

---
## Introdcution
Virtual Machines (VMs) are vital for creating isolated environments to experiment, learn, and test without impacting your main system. This guide will walk you through setting up VMs for a practical cybersecurity lab, including attacker and victim scenarios.
---

## What You'll Learn
- How to install and configure VirtualBox
- Setting up VMs Kali Linux (attacker machine) and Ubuntu (victim machine).
- Configure network settings, enable SSH services and forward logs to your host machine.
- Using VMs for brute force attack simulations and log analysis.
---

## Prerequisites
1. **System Requirements**:
   - At least 16GB of RAM and 50GB of free disk space.
   - A processor with virtualization support (e.g., Intel VT-x or AMD-V).

2. **Software Downloads**:
   - [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
   - [Kali Linux ISO](https://www.kali.org/get-kali/).
   - [Ubuntu ISO](https://ubuntu.com/download/desktop).

3. **Basic Knowledge**:
   - Familiarity with command-line tools is helpful but not required.
---

## Step-by-Step VM Setup

### Step 1: Install VirtualBox

1. Download VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads)
2. Install the application by following the prompts.
3. Launch VirtualBox and ensure your system supports virtualization.

### Step 2: Create a Virtual Machine

1. Click **New** in VirtualBox.
2. Name your VM (e.g., "Ubuntu24").
3. Allocate at least 4GB of RAM and 20GB of disk space.
4. Select the downloaded Ubuntu ISO as the boot image.

### Step 3: Configure Network Settings

1. Open **Settings → Network** for your VM.
2. Choose **Host-only Adapter** for the initial setup.
3. If the victim machine needs to communicate with the host machine, follow the [Networking Configuration](#network-configuration) instructions below.

### Step 4: Install the Operating System

1. Start the VM and follow the installation prompts for Ubuntu or Kali Linux.
2. Create a user account and set a secure password.

### Step 5: Enable SSH Service (Ubuntu VM)

1. Install SSH:
   ```bash
   sudo apt install openssh-server
   ```

2. Start and enable the SSh service.
   ```bash
   sudo systemctl start ssh
   sudo systemctl enable ssh
   ```
### Step 6: Perform a Brute Force Test (Optional)
  ```bash
hydra -l root -P wordlist.txt ssh://<victim-IP>
```
---

## Networking Configuration
### Original Setup
Initially, both the attacker and victim machines were configured with a **Host-Only Adapter**. This setup allowed communication between the virtual machines (VMs) but restricted their access to the host machine or external networks.

  - **Why Host-Only Adapter?**
    - Ensures isolation of the attacker and victim machine from the host and external networks.
    - Ideal for simulating interactions between the attacker and victim without outside interference.

### Updated Configuration
To enable the victim machine to communicate with the host machine (for log forwarding or Splunk integration), the network configuration for the victim machine was updated to include a **Bridged Adapter**.
  - **Why add a Bridged Adapter?**
    - Allows the victim machine to communicate directly with the host machine.
    - Necessary for scenarios requiring log forwarding or SIEM integration.

### Steps to Update the Network Configuration
1. Open the VirtualBox Network Settings:
   - Shut down your victim machine.
   - in VirtualBox, right-click the victim machine and select **Settings**.
   - Navigate to the **Network** section.

2. Configure the Adapter:
   - Adapter 1: Keep this as **Host-Only Adapter** for communication between the victim and attacker machines.
   - Adapter 2: Enable this adapter and select **Bridged Adapter**.
     - Choose your host machine's active network interface (e.g., Wi-Fi or Ethernet).

3. Apply the changes:
   - Save the settings and start the victim machine.

4. Verify Connectivity:
   - Check the victim machine's IP address:
   ```bash
   ifconfig
   ```
   You should see an IP address from the same network as your host machine.
  - Test the connection to your host:
    ```bash
    ping <host-IP>
    ```
---
## Troubleshooting
### Issue: VM Won't Start
  - Ensure virtualization is enabled in your BIOS settings
  - Restart your system and try launching the VM again.

### Issue: VM Network Not Working
  - Switch the network mode to **NAT** for basic connectivity.
  - Verify your firewall settings don't block VM traffic.

### Issue: Low Performance
  - Allocate more CPU and RAM to your VM through **Settings → System**.

---
## Resources
- [Kali Linux ISO](https://www.kali.org/get-kali/#kali-platforms)
- [Ubuntu ISO](https://ubuntu.com/download/desktop)
- [VirtualBox Documentation](https://www.virtualbox.org/manual/)
- [Nmap Reference Guide](https://nmap.org/)
