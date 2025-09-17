<!-- Dead Drop ASCII Logo -->
```text
░███████                                ░██    ░███████                                  
░██   ░██                               ░██    ░██   ░██                                 
░██    ░██  ░███████   ░██████    ░████████    ░██    ░██ ░██░████  ░███████  ░████████  
░██    ░██ ░██    ░██       ░██  ░██    ░██    ░██    ░██ ░███     ░██    ░██ ░██    ░██ 
░██    ░██ ░█████████  ░███████  ░██    ░██    ░██    ░██ ░██      ░██    ░██ ░██    ░██ 
░██   ░██  ░██        ░██   ░██  ░██   ░███    ░██   ░██  ░██      ░██    ░██ ░███   ░██ 
░███████    ░███████   ░█████░██  ░█████░██    ░███████   ░██       ░███████  ░██░█████  
                                                                              ░██        
                                                                              ░██        
```

---

🧨 Dead Drop

Dead Drop is a lightweight, portable post-exploitation tool for Windows, designed for red team exercises, lab environments, and offline operations.

This PowerShell-based script enables you to insert removable media, execute a single script, and silently establish a backdoor channel via OpenSSH, complete with:

A hidden administrative user

Firewall exceptions

Startup persistence

⚙️ Features

✔️ Checks and installs OpenSSH Client and Server

✔️ Enables & configures ssh-agent and sshd on boot

✔️ Creates a hidden admin user: Shadow

✔️ Adds firewall exception for port 22

✔️ Requires no internet after initial execution

✔️ Written entirely in PowerShell (self-contained)

🚨 Intended Use

Dead Drop is for ethical, educational, and controlled environments only.
Use with explicit permission and in accordance with local laws and organizational policies.

🧰 Requirements

🖥️ Windows 10/11 with Administrator access

💬 PowerShell 5.1+ or CMD

💾 Removable USB/Drive containing dead_drop.ps1

📦 Usage Guide

Copy dead_drop.ps1 to a removable drive

Insert drive into the target Windows system

Manually execute the script with Administrator privileges

Script performs the following:

Installs & starts OpenSSH services

Creates hidden admin user: Shadow

Adds firewall exception for port 22

Confirms each step during setup

🔐 Example Hidden Account
Username	Password	Group
Shadow	Shadow123!	Administrators (Hidden)
